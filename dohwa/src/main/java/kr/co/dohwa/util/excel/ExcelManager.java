package kr.co.dohwa.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.record.crypto.Biff8EncryptionKey;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackageAccess;
import org.apache.poi.poifs.crypt.EncryptionInfo;
import org.apache.poi.poifs.crypt.EncryptionMode;
import org.apache.poi.poifs.crypt.Encryptor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellAddress;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.error.YAMLException;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExcelManager {

	private final static Pattern pattern = Pattern.compile("\\{\\{(.*?)\\}\\}");

	private final static ObjectMapper mapper = new ObjectMapper();

	public void makeExcelWithPassword(String templateExcelfilePath, String makeExcelFilePath, String jsonString, String password) throws ExcelCommentNotFountException {
		try(FileInputStream fileIn = new FileInputStream(templateExcelfilePath);) {
			String jsonData = jsonString.replaceAll("&quot;", "\"");

			Workbook wb = WorkbookFactory.create(fileIn);

			if(wb instanceof XSSFWorkbook) {
				EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile);
				Encryptor enc = info.getEncryptor();
				  enc.confirmPassword(password);
			} else {
				Biff8EncryptionKey.setCurrentUserPassword(password);
			}

			Sheet sheet = wb.getSheetAt(0);

			Yaml yaml = new Yaml();

			Map<CellAddress, ? extends Comment> cellComments = sheet.getCellComments();

			Set<CellAddress> keySet = cellComments.keySet();

			if(keySet.size() < 1) {
				throw new ExcelCommentNotFountException();
			}

			CellReference start = null;
			CellReference end = null;

			Map<String, Integer> cellMap = null;
			Map<String, Row> rowMap = null;

			@SuppressWarnings("unchecked")
			Map<String, Object> readValue = mapper.readValue(jsonData, Map.class);

			for (CellAddress cellAddress : keySet) {
				Comment comment = cellComments.get(cellAddress);
				ExcelComment excelComment = null;

				try {
					excelComment = yaml.loadAs(comment.getString().getString(), ExcelComment.class);
				} catch (YAMLException e) {
					continue;
				}

				List<ExcelDataAreaDefinition> datas = excelComment.getDatas();

				Comparator<? super ExcelDataAreaDefinition> comparator = new Comparator<ExcelDataAreaDefinition>() {

					@Override
					public int compare(ExcelDataAreaDefinition o1, ExcelDataAreaDefinition o2) {
						return o1.getType() == o2.getType() ? 0 : o1.getType() == ExcelDataAreaDefinitionType.one ? 1 : -1;
					}

				};

				Collections.sort(datas, comparator);

				for (ExcelDataAreaDefinition excelDataDefinition : datas) {

					start = new CellReference(excelDataDefinition.getStartCell());
					end = new CellReference(excelDataDefinition.getEndCell());

					int startRow = start.getRow();
					int startCol = start.getCol();

					int endRow = end.getRow();
					int endCol = end.getCol();

					if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.one) {
						for(int i = startRow ; i <= endRow ; i++) {
							for(int j = startCol ; j <= endCol ; j++) {
								Row row = sheet.getRow(i);
								Cell cell = row.getCell(j);
								switch (cell.getCellType()) {
								case STRING:
									String value = cell.getStringCellValue();
									Matcher matcher = pattern.matcher(value);
									if(matcher.find()) {
										String group = matcher.group(1);
										String[] split = group.split("\\.");

										@SuppressWarnings("unchecked")
										Map<String, Object> onlyOne = (Map<String, Object>)readValue.get(split[0]);
										Object object = onlyOne.get(split[1]);
										if( object instanceof String) {
											cell.setCellValue((String)object);
										} else {
											cell.setCellValue((Double)object);
										}
									}
									break;
								default:
									break;
								}
							}
						}
					} else if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.more) {
						cellMap = new HashMap<>();
						rowMap = new HashMap<>();

						for(int i = startRow ; i <= endRow ; i++) {
							for(int j = startCol ; j <= endCol ; j++) {
								Row row = sheet.getRow(i);
								Cell cell = row.getCell(j);
								switch (cell.getCellType()) {
								case STRING:
									String value = cell.getStringCellValue();
									Matcher matcher = pattern.matcher(value);
									if(matcher.find()) {
										String group = matcher.group(1);
										String[] split = group.split("\\.");
										rowMap.put(split[0], row);
										cellMap.put(group, j);
									}
									break;
								default:
									break;
								}
							}
						}
					}
				}

				//리스트 그리기
				for (ExcelDataAreaDefinition excelDataDefinition : datas) {
					if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.more) {
						String objectName = excelDataDefinition.getObjectName();
						@SuppressWarnings("unchecked")
						List<Map<String, Object>> more = (List<Map<String, Object>>)readValue.get(objectName);
						if(more != null && more.size() > 0 && null != rowMap) {
							Row row = rowMap.get(objectName);
							int startRow = row.getRowNum();
							int roopCount = 0;
							Row writeTargetCell = null;
							for (Map<String, Object> map : more) {
								Set<String> twoes = map.keySet();
								copyRow(wb, sheet, startRow + (roopCount ++), startRow+roopCount);
								writeTargetCell = sheet.getRow(startRow + roopCount - 1);

								for(String two : twoes) {
									Object object = map.get(two);
									if(null != cellMap) {
										Integer integer = cellMap.get(objectName + "." + two);
										if(integer == null) continue;

										int col = integer;
										if(writeTargetCell != null) {
											Cell cell = writeTargetCell.getCell(col);
											if(cell != null ) {
												if( object instanceof String) {
													cell.setCellValue((String)object);
												} else if( object instanceof Integer) {
													cell.setCellValue((Integer)object);
												} else if( object instanceof Double) {
													cell.setCellValue((Double)object);
												}
											}
										}
									}
								}
							}
							sheet.removeRow(sheet.getRow(startRow + roopCount));
						}
					}
				}
			}

			wb.setForceFormulaRecalculation(true); // 엑셀 수식 재계산
			FileOutputStream fileOut = new FileOutputStream(makeExcelFilePath, false); // 엑셀파일 저장경로
			wb.write(fileOut);// 파일에 저장
			fileOut.close();

			if (wb instanceof XSSFWorkbook) {
				try (POIFSFileSystem fs = new POIFSFileSystem()) {
					EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile);
					// EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile,
					// CipherAlgorithm.aes192, HashAlgorithm.sha384, -1, -1, null);

					Encryptor enc = info.getEncryptor();
					enc.confirmPassword(password);

					// Read in an existing OOXML file and write to encrypted output stream
					// don't forget to close the output stream otherwise the padding bytes aren't
					// added
					try (OPCPackage opc = OPCPackage.open(new File(makeExcelFilePath), PackageAccess.READ_WRITE);
							OutputStream os = enc.getDataStream(fs)) {
						opc.save(os);
					}

					// Write out the encrypted version
					try (FileOutputStream fos = new FileOutputStream(makeExcelFilePath)) {
						fs.writeFilesystem(fos);
					}
				}
			}
		} catch (FileNotFoundException e) {
			log.error("ExcelManager makeExcelWithPassword error {}", e);
		} catch (IOException e) {
			log.error("ExcelManager makeExcelWithPassword error {}", e);
		} catch (InvalidFormatException e) {
			log.error("ExcelManager makeExcelWithPassword error {}", e);
		} catch (GeneralSecurityException e) {
			log.error("ExcelManager makeExcelWithPassword error {}", e);
		}
	}

	/**
	 * @param templateExcelfilePath
	 * @param makeExcelFilePath
	 * @param jsonString
	 * @throws ExcelCommentNotFountException
	 */
	public void makeExcel(String templateExcelfilePath, String makeExcelFilePath, String jsonString) throws ExcelCommentNotFountException {

		try(FileInputStream fileIn = new FileInputStream(templateExcelfilePath);) {
			String jsonData = jsonString.replaceAll("&quot;", "\"");

			Workbook wb = WorkbookFactory.create(fileIn);

			Sheet sheet = wb.getSheetAt(0);

			Yaml yaml = new Yaml();

			Map<CellAddress, ? extends Comment> cellComments = sheet.getCellComments();

			Set<CellAddress> keySet = cellComments.keySet();

			if(keySet.size() < 1) {
				throw new ExcelCommentNotFountException();
			}

			CellReference start = null;
			CellReference end = null;

			Map<String, Integer> cellMap = null;
			Map<String, Row> rowMap = null;
			@SuppressWarnings("unchecked")
			Map<String, Object> readValue = mapper.readValue(jsonData, Map.class);
			System.out.println(readValue);

			for (CellAddress cellAddress : keySet) {
				Comment comment = cellComments.get(cellAddress);
				ExcelComment excelComment = null;

				try {
					excelComment = yaml.loadAs(comment.getString().getString(), ExcelComment.class);
				} catch (YAMLException e) {
					continue;
				}

				List<ExcelDataAreaDefinition> datas = excelComment.getDatas();

				Comparator<? super ExcelDataAreaDefinition> comparator = new Comparator<ExcelDataAreaDefinition>() {

					@Override
					public int compare(ExcelDataAreaDefinition o1, ExcelDataAreaDefinition o2) {
						return o1.getType() == o2.getType() ? 0 : o1.getType() == ExcelDataAreaDefinitionType.one ? 1 : -1;
					}

				};
				Collections.sort(datas, comparator);

				for (ExcelDataAreaDefinition excelDataDefinition : datas) {

					start = new CellReference(excelDataDefinition.getStartCell());
					end = new CellReference(excelDataDefinition.getEndCell());

					int startRow = start.getRow();
					int startCol = start.getCol();

					int endRow = end.getRow();
					int endCol = end.getCol();

					if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.one) {
						for(int i = startRow ; i <= endRow ; i++) {
							for(int j = startCol ; j <= endCol ; j++) {
								Row row = sheet.getRow(i);
								Cell cell = row.getCell(j);
								switch (cell.getCellType()) {
								case STRING:
									String value = cell.getStringCellValue();
									Matcher matcher = pattern.matcher(value);
									if(matcher.find()) {
										String group = matcher.group(1);
										String[] split = group.split("\\.");
										@SuppressWarnings("unchecked")
										Map<String, Object> onlyOne = (Map<String, Object>)readValue.get(split[0]);
										Object object = onlyOne.get(split[1]);
										if( object instanceof String) {
											cell.setCellValue((String)object);
										} else {
											cell.setCellValue((Double)object);
										}
									}
									break;
								default:
									break;
								}
							}
						}
					} else if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.more) {
						cellMap = new HashMap<>();
						rowMap = new HashMap<>();

						for(int i = startRow ; i <= endRow ; i++) {
							for(int j = startCol ; j <= endCol ; j++) {
								Row row = sheet.getRow(i);
								Cell cell = row.getCell(j);
								switch (cell.getCellType()) {
								case STRING:
									String value = cell.getStringCellValue();
									Matcher matcher = pattern.matcher(value);
									if(matcher.find()) {
										String group = matcher.group(1);
										String[] split = group.split("\\.");
										rowMap.put(split[0], row);
										cellMap.put(group, j);
									}
									break;
								default:
									break;
								}
							}
						}
					}
				}

				//리스트 그리기
				for (ExcelDataAreaDefinition excelDataDefinition : datas) {
					if(excelDataDefinition.getType() == ExcelDataAreaDefinitionType.more) {
						String objectName = excelDataDefinition.getObjectName();
						@SuppressWarnings("unchecked")
						List<Map<String, Object>> more = (List<Map<String, Object>>)readValue.get(objectName);
						if(more != null && more.size() > 0 && null != rowMap) {
							Row row = rowMap.get(objectName);
							int startRow = row.getRowNum();
							int roopCount = 0;
							Row writeTargetCell = null;
							for (Map<String, Object> map : more) {
								Set<String> twoes = map.keySet();
								copyRow(wb, sheet, startRow + (roopCount ++), startRow+roopCount);
								writeTargetCell = sheet.getRow(startRow + roopCount - 1);

								for(String two : twoes) {
									Object object = map.get(two);
									if(null != cellMap) {
										Integer integer = cellMap.get(objectName + "." + two);
										if(integer == null) continue;

										int col = integer;
										if(writeTargetCell != null) {
											Cell cell = writeTargetCell.getCell(col);
											if(cell != null ) {
												if( object instanceof String) {
													cell.setCellValue((String)object);
												} else if( object instanceof Integer) {
													cell.setCellValue((Integer)object);
												} else if( object instanceof Double) {
													cell.setCellValue((Double)object);
												}
											}
										}
									}
								}
							}
							sheet.removeRow(sheet.getRow(startRow + roopCount));
						}
					}
				}
			}

			wb.setForceFormulaRecalculation(true); // 엑셀 수식 재계산
			FileOutputStream fileOut = new FileOutputStream(makeExcelFilePath, false); // 엑셀파일 저장경로
			wb.write(fileOut);// 파일에 저장
			fileOut.close();

		} catch (FileNotFoundException e) {
			log.error("ExcelManager makeExcel error {}", e);
		} catch (IOException e) {
			log.error("ExcelManager makeExcel error {}", e);
		}
	}

	private static void copyRow(Workbook workbook, Sheet worksheet, int sourceRowNum, int destinationRowNum) {
		// Get the source / new row
		Row newRow = worksheet.getRow(destinationRowNum);
		Row sourceRow = worksheet.getRow(sourceRowNum);

		boolean isXlsx = workbook instanceof XSSFWorkbook;

		// If the row exist in destination, push down all rows by 1 else create a new row
		if (newRow != null && !isXlsx) {
			worksheet.shiftRows(destinationRowNum, worksheet.getLastRowNum()+1, 1, true, true);
		} else {
			newRow = worksheet.createRow(destinationRowNum);
		}

		// Loop through source columns to add to new row
		for (int i = 0; i < sourceRow.getLastCellNum(); i++) {
			// Grab a copy of the old/new cell
			Cell oldCell = sourceRow.getCell(i);
			Cell newCell = newRow.createCell(i);

			// If the old cell is null jump to next cell
			if (oldCell == null) {
				newCell = null;
				continue;
			}

			// Copy style from old cell and apply to new cell
			CellStyle newCellStyle = workbook.createCellStyle();
			newCellStyle.cloneStyleFrom(oldCell.getCellStyle());
			;
			newCell.setCellStyle(newCellStyle);

			// If there is a cell comment, copy
			if (oldCell.getCellComment() != null) {
				newCell.setCellComment(oldCell.getCellComment());
			}

			// If there is a cell hyperlink, copy
			if (oldCell.getHyperlink() != null) {
				newCell.setHyperlink(oldCell.getHyperlink());
			}

			// Set the cell data value
			switch (oldCell.getCellType()) {
				case BLANK:
					newCell.setCellValue(oldCell.getStringCellValue());
					break;
				case BOOLEAN:
					newCell.setCellValue(oldCell.getBooleanCellValue());
					break;
				case ERROR:
					newCell.setCellErrorValue(oldCell.getErrorCellValue());
					break;
				case FORMULA:
					newCell.setCellFormula(oldCell.getCellFormula());
					break;
				case NUMERIC:
					newCell.setCellValue(oldCell.getNumericCellValue());
					break;
				case STRING:
					newCell.setCellValue(oldCell.getRichStringCellValue());
					break;
				default:
					break;
			}
		}

		// If there are are any merged regions in the source row, copy to new row
		for (int i = 0; i < worksheet.getNumMergedRegions(); i++) {
			CellRangeAddress cellRangeAddress = worksheet.getMergedRegion(i);
			if (cellRangeAddress.getFirstRow() == sourceRow.getRowNum()) {
				CellRangeAddress newCellRangeAddress = new CellRangeAddress(newRow.getRowNum(),
						(newRow.getRowNum() +
								(cellRangeAddress.getLastRow() - cellRangeAddress.getFirstRow()
										)),
						cellRangeAddress.getFirstColumn(),
						cellRangeAddress.getLastColumn());
				worksheet.addMergedRegion(newCellRangeAddress);
			}
		}
	}

}

package kr.co.dohwa.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.lang.reflect.Method;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.function.Function;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections4.properties.SortedProperties;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.io.Resources;
import org.apache.poi.openxml4j.util.ZipSecureFile;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.plexus.util.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;


public class CommonUtils {

	private static final Logger logger = LoggerFactory.getLogger(CommonUtils.class);

	/**
	 * 프로퍼티 파일에서 한개의 키만 조회
	 * @param resource 프로퍼티 파일 경로
	 * @param key 키
	 * @return key의 value
	 */
	public static String getPropertiesKey(String resource, String key) throws Exception{

		Properties properties = new Properties();
		String retunValue = "";

		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
			retunValue = properties.getProperty(key);
		}catch(Exception e) {
			logger.error(e.toString());
		}

		return retunValue;
	}

	/**
	 * 프로퍼티 파일에서 한개의 키만 조회
	 * @param resource	프로퍼티 파일 경로
	 * @param key	키
	 * @param defStr	값이 없을 경우의 기본 값
	 * @return	key의 value
	 */
	public static String getPropertiesKey(String resource, String key, String defStr){

		String retunValue = "";

		try {
			Properties properties = new Properties();
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
			retunValue = Optional.ofNullable(properties.getProperty(key)).orElse(defStr);
		}catch(Exception e) {
			logger.error(e.toString());
			retunValue = defStr;
		}

		return retunValue;
	}

	/**
	 * 프로퍼티 파일 읽기
	 * @param resource 프로퍼티 파일 경로
	 * @return 프로퍼티 내용
	 */
	public static Properties getProperties(String resource) throws Exception {

		Properties properties = new Properties();

		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
		}catch(Exception e) {
			logger.error(e.toString());
		}

		return properties;
	}

	/**
	 * 현재 접속한 위치의 국가코드를 구함
	 * @param ip 사용자 ip
	 * @param key 국가코드 조회를 위해 필요한 키
	 * @return 국가코드
	 */
	public static String getIpLocation(String ip) throws Exception {
		String returnValue = "";
		String responseStr = "";
		try {
			String ipAddr = ip;
			if(ip.indexOf(':') > -1) {
				ipAddr = ipAddr.split(":")[0];
			}
			ObjectMapper mapper = new ObjectMapper();
			JsonNode jsonNode = null;
			String url = "http://whois.kisa.or.kr/openapi/ipascc.jsp?query="+ipAddr+"&key=2016030813211818161799&answer=json";
			jsonNode = mapper.readTree(new URL(url));
			responseStr = jsonNode.toString();
			returnValue = jsonNode.path("whois").get("countryCode").textValue();
		}catch(Exception e) {
			logger.error("getIpLocation error : " + e.getMessage() + ", responseStr : " + responseStr);
		}
		return returnValue;
	}

	/**
	 * Method cropByte. 문자열 바이트수만큼 끊어주고, 생략표시하기
	 * @param str 문자열
	 * @param i 바이트수
	 * @param trail 생략 문자열. 예) "..."
	 * @return String
	 */
	public static String cropByte(String str, int i, String trail) {
    	if (str==null) return "";
    	String tmp = str;
    	int slen = 0, blen = 0;
    	char c;
    	try {
        	if(tmp.getBytes("MS949").length>i) {
        		while (blen+1 < i) {
        			c = tmp.charAt(slen);
        			blen++;
        			slen++;
        			if ( c  > 127 ) blen++;  //2-byte character..
        		}
        		tmp=tmp.substring(0,slen)+trail;
        	}
        } catch(java.io.UnsupportedEncodingException e) {
        	logger.error("Unsupported Encoding:"+str);
        }
    	return tmp;
    }

	/**
	 * 바이트로 문자열 substring
	 * @param string
	 * @param begin
	 * @param end
	 * @return
	 */
	public static String cropByte(String string, int begin, int end) {
    	int beginPos = 0, endPos = 0, bytelen = 0;
    	char c;
    	try {
    		if(string.getBytes().length>end) {
        		while (bytelen < end) {
        			c = string.charAt(endPos);
        			if ( bytelen < begin ) beginPos++;
        			bytelen++;
        			endPos++;
        			if ( c  > 127 ) bytelen++;  //2-byte character..
        		}
        		string=string.substring(beginPos,endPos);
        	}
        } catch(Exception e) {
        	logger.error("Unsupported Encoding:"+string);
        }
    	return string;
	}

	/**
	 * 두 VO의 같은 필드의 값을 복사해준다.
	 * @param fromVo	원본 VO
	 * @param toVo	대상 VO. 값을 채우는 기준이 되는 필드.
	 * @param type	1 : 무조건 복사, 2: 원본 VO 필드에 값이 있을때만 무조건 복사, 3: 대상 VO 필드에 값이 있을 경우는 무시하고 없는 필드만 복사
	 * @return
	 */
	public static void copyVoValue(Object fromVo, Object toVo, int type) {
		Class<?> fromClass = fromVo.getClass();
		Class<?> toClass = toVo.getClass();
		Method tm = null;
		Object toVoValue = null;
		Method fm = null;
		Object value = null;
		for(Method m : toClass.getMethods()) {
			try {
				if(m.getName().startsWith("set")) {
					fm = fromClass.getMethod(m.getName().replace("set", "get"));
					if(fm != null) {
						value = fm.invoke(fromVo);
					}
					if(type == 1) {
						m.invoke(toVo, new Object[] {value});

					} else if(type == 2) {
						if(value != null ) {
							m.invoke(toVo, new Object[] {value});
						}
					} else if(type == 3) {
						tm = toClass.getMethod(m.getName().replace("set", "get"));
						if(tm != null) {
							toVoValue = tm.invoke(toVo);
						}
						if(toVoValue == null || (toVoValue instanceof Integer && ((Integer)toVoValue) == 0)) {
							m.invoke(toVo, new Object[] {value});
						}
					}
				}
			} catch(Exception e) {
	    		logger.debug("copyVoValue error [" + m.getName() + "] ==> " + e.toString());
	    	}
		}
	}

	/**
	 * Object를 int형으로 변환. 에러시 -1이 리턴 되므로 정상적인 값이 양수인 경우에만 쓰도록 하자.
	 * @param obj	대상 오브젝트.
	 * @return	int형. 오류시 -1 리턴.
	 */
	public static int getIntegerFromObject(Object obj) {
		int result = 0;

		try {
			if(obj instanceof Double) {
				result = ((Double)obj).intValue();
			} else if(obj instanceof Long) {
				result = ((Long)obj).intValue();
			} else if(obj instanceof Short) {
				result = ((Short)obj).intValue();
			} else if(obj instanceof Integer) {
				result = ((Integer)obj).intValue();
			} else {
				result = Integer.parseInt((String)obj);
			}
		} catch(Exception e){
			result = -1;
		}

		return result;

	}

	/**
	 * 문자열 배열에 비교 문자열이 존재하는 지 여부
	 * @param stringArray	문자열 배열
	 * @param checkStr	비교 문자열
	 * @return	존재하면 true
	 */
	public static boolean isExistInArray(String[] stringArray, String checkStr) {
		boolean result = false;

		try {
			for(String str : stringArray) {
				if(str.trim().equals(checkStr)) {
					return true;
				}
			}
		} catch(Exception e){
			 result = false;
		}

		return result;

	}

	/**
	 * file을 base64로 변환시키는 메소트
	 * @param file MultipartFile
	 * @return
	 * @throws Exception
	 */
	public static String fileToBase64String(MultipartFile file) throws Exception {
		String returnString = "";

		try {
			returnString = new String(Base64.encodeBase64(file.getBytes()));
		} catch (IOException e) {
			returnString = "fail";
		}

		return returnString;
	}

	/**
	 * 사용자 접속IP 확인
	 * @param request	HttpServletRequest
	 * @return
	 */
	public static String getClientIP(HttpServletRequest request) {
	    String clientIp = request.getHeader("Proxy-Client-IP");
	    if (clientIp == null) {
	        clientIp = request.getHeader("WL-Proxy-Client-IP");
	        if (clientIp == null) {
	            clientIp = request.getHeader("X-Forwarded-For");
	            if (clientIp == null) {
	                clientIp = request.getRemoteAddr();
	            }
	        }
	    }
	    return clientIp;
    }

	/**
	 * <pre>
	 * url을 기준으로 서버에 파일을 저장을 한다.
	 * 예시)
	 * 	String serverType = CommonUtils.getPropertiesKey("application.properties", "spring.profiles.active");
		String webDomain = CommonUtils.getPropertiesKey("application-"+serverType+".properties", "web.domain");
		String imgUrl = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F2730E64758D9FF711CAD83";
		String storePath = "C:/yongPyongResortPJ/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/yp-mobile-restapi/static/image/upload";
		String urlPrefix = "mapi/static/image/upload";
		logger.info("newImgUrl " + CommonUtils.downloadImageFromUrl(imgUrl, storePath, webDomain+urlPrefix));
	 *
	 * </pre>
	 * @param imgUrl	원본 이미지의 full url
	 * @param storePath	저장할 절대 경로
	 * @param urlPrefix	파일명을 제외한 현재 서버의 이미지 접근 url의 앞 부분.
	 * @return
	 */
	public static String downloadImageFromUrl(String imgUrl, String storePath, String urlPrefix) {
		String retUri = "";

		URL url = null;
		BufferedImage bi = null;

		try {

			String tmpStorePath = storePath.endsWith("/") ? storePath : storePath + "/";
			String tmpUrlPrefix = urlPrefix.endsWith("/") ? urlPrefix : urlPrefix + "/";

			String fileName = imgUrl.substring(imgUrl.lastIndexOf('/')+1, imgUrl.lastIndexOf('.'));
			String fileExt = imgUrl.substring(imgUrl.lastIndexOf('.')+1);

			// 일반적인 이미지 경로가 아닌 경우 새로 생성하기.
			if(imgUrl.indexOf('?') > -1 || StringUtils.isBlank(fileExt) || fileExt.length() > 3) {
				fileName = encryptMD5(imgUrl);	// url을 기준으로 파일명을 생성한다. 파일명을 짧게 하기 위해 md5 기법을 이용함.
				fileName = fileName.replaceAll("\\/", "").replaceAll("\\\\", "");	// 슬래쉬, 역슬래쉬는 치환해야함.
				fileExt = "png";
			}

			File dir = new File(tmpStorePath);
			if(!dir.exists()) {
				dir.mkdirs();
			}

			File outputFile = new File(tmpStorePath + fileName + "." + fileExt);
			if(outputFile.exists() && outputFile.isFile()) {
				outputFile.deleteOnExit();
			}
		    url = new URL(imgUrl);
		    bi = ImageIO.read(url);
		    ImageIO.write(bi, fileExt.toLowerCase(), outputFile);

		    retUri = tmpUrlPrefix + fileName + "." + fileExt;

		}catch(Exception e) {
			retUri = "";
		}


		return retUri;

	}

	/**
	 * md5 암호화
	 * @param inputStr
	 * @return
	 */
	public static String encryptMD5(String inputStr) {
		String ecnStr = "";
		try {

			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] byteValue = md5.digest(inputStr.getBytes());
			Base64 base64EnDe = new Base64();
			ecnStr = base64EnDe.encodeToString(byteValue).replaceAll("\r\n", "");
		} catch(NoSuchAlgorithmException e) {
			ecnStr = "";
		}
		return ecnStr;
	}

	/**
	 * 엑셀을 읽어서 엑셀 데이터를  Map<String, Object> 담어서 리턴한다.
	 * 리턴하는 Map에는 "RSLT":성공여부(OK:성공), "HEADER_LIST": 헤더리스트(List<String>),  "DATA_LIST" : 데이터 리스트(List<Map<String, Object>>)
	 * 데이터는 로우별로 맵에 값을 담는데, map.get(헤더명)으로 접근 가능함.
	 * @param excelFileAbsPath	엑셀 파일 절대 경로
	 * @return
	 */
	public static Map<String, Object> readExcelFile(String excelFileAbsPath) {
		return readExcelFile(excelFileAbsPath, null);
	}

	/**
	 * 엑셀을 읽어서 엑셀 데이터를  Map<String, Object> 담어서 리턴한다.
	 * 리턴하는 Map에는 "RSLT":성공여부(OK:성공), "HEADER_LIST": 헤더리스트(List<String>),  "DATA_LIST" : 데이터 리스트(List<Map<String, Object>>)
	 * 데이터는 로우별로 맵에 값을 담는데, map.get(헤더명)으로 접근 가능함.
	 * @param excelFileAbsPath	엑셀 파일 절대 경로
	 * @param arrColNm	헤더의 컬럼명 배열. 값이 있으면 HEADER_LIST는 arrColNm로 대체된다.
	 * @return
	 */
	public static Map<String, Object> readExcelFile(String excelFileAbsPath, String[] arrColNm) {
		Map<String, Object> retMap = Maps.newHashMap();
		retMap.put("RSLT", "OK");
		InputStream inputStream = null;
		try {
			File file = new File(excelFileAbsPath);
			if(file.exists() && file.isFile()) {
				logger.debug("file is Exist!");

				inputStream = new FileInputStream(excelFileAbsPath);

				// 엑셀 로드
				ZipSecureFile.setMinInflateRatio(0);	//"Zip bomb" 이라는 용어는 일종의 공격 기법에 대한 방어 에러를 막기 위해서.
				Workbook workbook = WorkbookFactory.create(inputStream);
				// 시트 로드 0, 첫번째 시트 로드
				Sheet sheet = workbook.getSheetAt(0);
				Iterator<Row> rowItr = sheet.iterator();
				List<String> headerList = new  ArrayList<String>();
				List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
				if(arrColNm != null && arrColNm.length > 0) {
					for(String colNm : arrColNm) {
						headerList.add(colNm);
					}
				}

				// 행만큼 반복
				while(rowItr.hasNext()) {
					HashMap<String, Object> rowDataMap = new HashMap<String, Object>();
					Row row = rowItr.next();
					Iterator<Cell> cellItr = row.cellIterator();

					// 한행이 한열씩 읽기 (셀 읽기)
					while(cellItr.hasNext()) {
						Cell cell = cellItr.next();
						int index = cell.getColumnIndex();
						logger.debug(row.getRowNum() + ":" + index + " => " + getValueFromCell(cell));
						if(row.getRowNum() == sheet.getFirstRowNum()) {
							// header
							if(arrColNm == null || arrColNm.length == 0) {
								headerList.add((String)getValueFromCell(cell));
							}
						} else {
							if(index >= headerList.size()) {
								rowDataMap.put("NO_HEADER_"+index, getValueFromCell(cell));
							} else {
								rowDataMap.put(headerList.get(index), getValueFromCell(cell));
							}

						}
					}
					if(row.getRowNum() > 0) {
						dataList.add(rowDataMap);
					}
				}

				retMap.put("RSLT", "OK");
				retMap.put("HEADER_LIST", headerList);
				retMap.put("DATA_LIST", dataList);

			} else {
				logger.debug("file is not Exist!");
			}
		}catch(Exception e) {
			retMap.put("RSLT", "ERROR");
			retMap.put("MSG", e.getMessage());
		} finally {
			if(inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					retMap.put("MSG_FINALLY_ERROR", e.getMessage());
				}
			}
		}
		return retMap;
	}

	/**
	 * 엑셀을 읽어서 엑셀 데이터를  Map<String, Object> 담어서 리턴한다.
	 * 리턴하는 Map에는 "RSLT":성공여부(OK:성공), "HEADER_LIST": 헤더리스트(List<String>),  "DATA_LIST_0" : 데이터 리스트(List<Map<String, Object>>). 시트 순서대로 _0, _1 형태로 key값이 생성된다.
	 * "SHEET_NAMES" : 시트의 이름을 담은 문자열 배열.
	 * 데이터는 로우별로 맵에 값을 담는데, map.get(헤더명)으로 접근 가능함.
	 * @param excelFileAbsPath	엑셀 파일 절대 경로
	 * @param arrColNm	헤더의 컬럼명 배열. 값이 있으면 HEADER_LIST는 arrColNm로 대체된다.
	 * @return
	 */
	public static Map<String, Object> readExcelFileMultiSheet(String excelFileAbsPath, String[] arrColNm) {
		Map<String, Object> retMap = Maps.newHashMap();
		retMap.put("RSLT", "OK");
		InputStream inputStream = null;
		try {

			// 헤더 리스트 셋팅
			List<String> headerList = new  ArrayList<String>();
			if(arrColNm != null && arrColNm.length > 0) {
				for(String colNm : arrColNm) {
					headerList.add(colNm);
				}
			}

			File file = new File(excelFileAbsPath);
			if(file.exists() && file.isFile()) {
				logger.debug("file is Exist!");

				inputStream = new FileInputStream(excelFileAbsPath);

				// 엑셀 로드
				ZipSecureFile.setMinInflateRatio(0);	//"Zip bomb" 이라는 용어는 일종의 공격 기법에 대한 방어 에러를 막기 위해서.
				Workbook workbook = WorkbookFactory.create(inputStream);
				Sheet sheet = null;
				int sheetCnt = workbook.getNumberOfSheets();
				String[] arrSheetName = new String[sheetCnt];
				for(int i = 0; i < sheetCnt; i++ ) {
					sheet = workbook.getSheetAt(i);
					retMap.put("DATA_LIST_"+i, readExcelSheet(sheet, headerList));	// sheet별로 데이터를 읽어드리는 함수를 호출해서 리턴맵에 셋팅한다.
					arrSheetName[i] = sheet.getSheetName();
				}

				retMap.put("RSLT", "OK");
				retMap.put("HEADER_LIST", headerList);
				retMap.put("SHEET_NAMES", arrSheetName);

			} else {
				logger.debug("file is not Exist!");
			}
		}catch(Exception e) {
			retMap.put("RSLT", "ERROR");
			retMap.put("MSG", e.getMessage());
		} finally {
			if(inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					retMap.put("MSG_FINALLY_ERROR", e.getMessage());
				}
			}
		}
		return retMap;
	}

	/**
	 * 엑셀 파일의 시트를 읽어서 데이터를 List<Map<String,Object>>로 리턴한다.
	 * @param sheet	Sheet
	 * @param headerList	List<String>
	 * @return	List<Map<String,Object>
	 */
	public static List<Map<String,Object>> readExcelSheet(Sheet sheet, List<String> headerList) {
		List<Map<String,Object>> dataList = new ArrayList<Map<String, Object>>();
		try {
			Iterator<Row> rowItr = sheet.iterator();
			boolean isHeaderEmpty  = (headerList == null) ? true : headerList.isEmpty();

			// 행만큼 반복
			while(rowItr.hasNext()) {
				HashMap<String, Object> rowDataMap = new HashMap<String, Object>();
				Row row = rowItr.next();
				Iterator<Cell> cellItr = row.cellIterator();

				// 한행이 한열씩 읽기 (셀 읽기)
				while(cellItr.hasNext()) {
					Cell cell = cellItr.next();
					int index = cell.getColumnIndex();
					if(row.getRowNum() == sheet.getFirstRowNum()) {
						if(isHeaderEmpty) {	// 전달받은 headerList가 비어있는 상태였으면 첫번째 row로 헤더 리스트를 채운다.
							headerList.add((String)getValueFromCell(cell));
						}
					} else {
						if(index >= headerList.size()) {
							rowDataMap.put("NO_HEADER_"+index, getValueFromCell(cell));
						} else {
							rowDataMap.put(headerList.get(index), getValueFromCell(cell));
						}

					}
				}
				if(row.getRowNum() > 0) {
					dataList.add(rowDataMap);
				}
			}

		}catch(Exception e) {
			logger.error("readExcelSheet error :: "+e.getMessage(), e);
		}
		return dataList;
	}

	/**
	 * 셀서식에 맞게 값 읽기
	 * @param cell
	 * @return
	 */
	public static Object getValueFromCell(Cell cell) {
		logger.debug("cell is null?" + (cell == null));
		logger.debug("cell " + cell);
		logger.debug("cell.getCellType() is null? " + (cell.getCellType() == null));
		logger.debug("cell.getCellType() " + cell.getCellType());
		switch(cell.getCellType()) {
			case STRING: return cell.getStringCellValue();
			case BOOLEAN: return cell.getBooleanCellValue();
			case NUMERIC: if(DateUtil.isCellDateFormatted(cell)) { return cell.getDateCellValue(); } return getStrFromDouble(cell.getNumericCellValue());
			case FORMULA: return cell.getCellFormula();
			case BLANK: return "";
			default: return "";
		}
	}

	/**
	 * 더블형의 값중 .0 에 해당하는 값을 지우면서 문자열로 변환해서 가져옴
	 * @param d
	 * @return
	 */
	public static String getStrFromDouble(Double d) {
		String str = String.valueOf(d);
		if(d.intValue() == d) {
			str = d.intValue()+"";
		}
		return str;
	}

	/**
	 * jsp 파일에서 message property 코드뢍 기본값 추출하기
	 * @param jspFile
	 * @return
	 * @throws IOException
	 */
	public static List<Map<String, Object>> getMspPropListFromJsp(File jspFile) throws IOException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		if("jsp".equalsIgnoreCase(FileUtils.extension(jspFile.getName()))) {
			logger.debug("jsp filePath ====> " + jspFile.getAbsolutePath());
			String jspStr = FileUtils.fileRead(jspFile);
			String[] arrStr = jspStr.split("<spring:message");
			if(arrStr.length > 1) {
				for(int i = 1; i < arrStr.length; i++) {	// arrStr[0]에 해당하는 문자열에선 <spring:message 태그 값이 존재하지 않으므로.
					String str = arrStr[i];
					String[] arrQrr = str.split("\"");
					String code = "";
					String defTxt = "";
					if(arrQrr != null && arrQrr.length > 3) {
						code = arrQrr[1];
						defTxt = arrQrr[3];
					} else if(arrQrr != null && arrQrr.length > 1) {
						code = arrQrr[1];
					}
					logger.debug(jspFile.getName() + " > spring:message >> code:" + code + ", defTxt:"+defTxt);
					if(StringUtils.isNotEmpty(code)) {
						Map<String, Object> msgPropMap = Maps.newHashMap();
						msgPropMap.put("CODE", code);
						msgPropMap.put("TEXT", defTxt);
						list.add(msgPropMap);
					}
				}
			} else {
				logger.debug(jspFile.getName() + " > spring:message is not exist");
			}

		}

		return list;
	}

	/**
	 * jsp 파일에서 message property 코드뢍 기본값 추출하기
	 * @param jspFile
	 * @return
	 * @throws IOException
	 */
	public static Map<String, Object> getMspPropFromJsp(File jspFile) throws IOException {
		Map<String, Object> retMap = Maps.newHashMap();
		Map<String, Object> msgPropMap = Maps.newHashMap();
		StringBuilder duplCodeNotEqualTextLog = new StringBuilder();
		int duplCodeNotEqualTextCnt = 0;

		if("jsp".equalsIgnoreCase(FileUtils.extension(jspFile.getName()))) {
			logger.debug("jsp filePath ====> " + jspFile.getAbsolutePath());
			String jspStr = FileUtils.fileRead(jspFile);
			String[] arrStr = jspStr.split("<spring:message");
			if(arrStr.length > 1) {
				for(int i = 1; i < arrStr.length; i++) {	// arrStr[0]에 해당하는 문자열에선 <spring:message 태그 값이 존재하지 않으므로.
					String str = arrStr[i];
					String[] arrQrr = null;
					if(str.indexOf("code='") > 0) {
						arrQrr = str.split("'");
					} else {
						arrQrr = str.split("\"");
					}
					String code = "";
					String defTxt = "";
					if(arrQrr != null && arrQrr.length > 3) {
						code = arrQrr[1];
						defTxt = arrQrr[3];
					} else if(arrQrr != null && arrQrr.length > 1) {
						code = arrQrr[1];
					}
					logger.debug(jspFile.getName() + " > spring:message >> code:" + code + ", defTxt:"+defTxt);
					if(StringUtils.isNotEmpty(code)) {
						// 한글 프로퍼티에 기본적으로 정의한 값을 jsp에서 text 속성에 값을 채우지 않는 개발자가 있어서.
						if(StringUtils.isEmpty(defTxt)) {
							defTxt = CommonUtils.getPropertiesKey("/i18n/message_ko.properties", code, "");
							logger.debug(jspFile.getName() + " > text속성이 없는 케이스 >> code:" + code + ", defTxt:"+defTxt);
						}

						// msgPropMap에 code가 key로 존재하지 않으면 그냥 put, 존재한다면 값을 비교해서 같은 경우에는 put, 다른 경우에는 duplCodeLog에 jsp경로,코드명,기존값,신규값을 저장한다.
						if(msgPropMap.containsKey(code)) {
							if(msgPropMap.get(code) != null && ((String)msgPropMap.get(code)).equals(defTxt)) {	// 기존
								msgPropMap.put(code, defTxt);
							} else {
								duplCodeNotEqualTextCnt++;
								duplCodeNotEqualTextLog.append(jspFile.getAbsolutePath()).append("|").append(code).append("|").append(defTxt).append("|").append((msgPropMap.get(code) != null ? (String)msgPropMap.get(code) : "[NULL]" )).append("|");
								duplCodeNotEqualTextLog.append("\n").append("============================================================================================================================================================").append("\n");
							}
						} else {
							msgPropMap.put(code, defTxt);
						}

					}
				}
			} else {
				logger.debug(jspFile.getName() + " > spring:message is not exist");
			}

		}

		retMap.put("msgPropMap", msgPropMap);
		duplCodeNotEqualTextLog.insert(0, "[" + jspFile.getName() + "] code값이 같으나 text값이 다른 건수 : " + duplCodeNotEqualTextCnt + "\n");
		retMap.put("duplCodeLog", duplCodeNotEqualTextLog.toString());
		return retMap;
	}

	/**
	 * 특정 경로 밑의 모든 파일 가져오기.
	 * @param list	파일 리스트
	 * @param jspRootPath	파일을 탐색할 절대 경로
	 * @param ext	확장자
	 * @throws IOException
	 */
	public static void getFileList(List<File> list, String jspRootPath, String ext) throws IOException {
		File dirJsp = new File(jspRootPath);
		if(dirJsp.exists() && dirJsp.isDirectory()) {
			File[] arrFile = dirJsp.listFiles();
			if(arrFile != null && arrFile.length > 0) {
				for(File cFile : arrFile) {
					if(cFile.isDirectory()) {
						getFileList(list, cFile.getAbsolutePath(), ext);
					} else {
						if(cFile.isFile() && (StringUtils.isEmpty(ext) || ext.equalsIgnoreCase(FileUtils.extension(cFile.getName())))) {
							list.add(cFile);
						}
					}
				}
			}
		} else {
			logger.info("jspRootPath not exit");
		}
	}

	/**
	 * <pre>
	 * Excel 파일 생성
	 * sheetHeaderDataList 안에는 아래와 같은 정보를 담아야 한다.
	 *  [HEADER] : 헤더(타이틀)을 담은 문자열 배열 : String[]
	 *  [DATA_KEY] : 데이터를 담은 Map 리스트에서 값을 가져올 key값. : String[]
	 *  [DATA_LIST] : 데이터를 담은 Map 리스트 : List<Map<String, Object>>
	 *  [DATA_WIDTH] : 데이터 컬럼의 너비 (옵셔널) : int[]
	 *  [DATA_GROUP_BY_KEY] : 해당 key의 값을 기준으로 중복 데이터 생성하지 않음 : String
	 * </pre>
	 * @param excelFilePath	엑셀파일을 생성 할 파일명을 포함한 절대 경로.
	 * @param sheetNames	시트명을 담은 문자열 배열
	 * @param sheetHeaderDataList	시트를 생성 데이터를 담은 리스트
	 */
	@SuppressWarnings("unchecked")
	public static void createExcelFile(String excelFilePath, String[] sheetNames, List<Map<String, Object>> sheetHeaderDataList) {

		FileOutputStream fileOutputStream = null;
		XSSFWorkbook wb = null;
		try {
			wb = new XSSFWorkbook();
			XSSFSheet sheet = null;
			XSSFRow row = null;
			XSSFCell cell = null;

			// 허라이즌 스타일
			XSSFCellStyle csHr = wb.createCellStyle();
		    csHr.setAlignment(HorizontalAlignment.CENTER);
		    csHr.setVerticalAlignment(VerticalAlignment.TOP);
		    csHr.setBorderTop(BorderStyle.THIN);
		    csHr.setBorderRight(BorderStyle.THIN);
		    csHr.setBorderBottom(BorderStyle.THIN);
		    csHr.setBorderLeft(BorderStyle.THIN);
		    XSSFColor greyColor = new XSSFColor(new byte[] {(byte)150, (byte)150, (byte)150}, null);
		    csHr.setFillForegroundColor(greyColor);
		    csHr.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		    // 타이틀 스타일
			XSSFCellStyle csTitle = wb.createCellStyle();
			csTitle.setAlignment(HorizontalAlignment.LEFT);
			csTitle.setVerticalAlignment(VerticalAlignment.TOP);
			csTitle.setBorderTop(BorderStyle.THIN);
			csTitle.setBorderRight(BorderStyle.THIN);
			csTitle.setBorderBottom(BorderStyle.THIN);
			csTitle.setBorderLeft(BorderStyle.THIN);
		    XSSFColor greyColor2 = new XSSFColor(new byte[] {(byte)192, (byte)192, (byte)192}, null);
		    csTitle.setFillForegroundColor(greyColor2);
		    csTitle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		    // 일반 스타일
		    XSSFCellStyle cs = wb.createCellStyle();
		    cs.setAlignment(HorizontalAlignment.LEFT);
		    cs.setVerticalAlignment(VerticalAlignment.TOP);
		    cs.setBorderTop(BorderStyle.THIN);
		    cs.setBorderRight(BorderStyle.THIN);
		    cs.setBorderBottom(BorderStyle.THIN);
		    cs.setBorderLeft(BorderStyle.THIN);

		    // 일반 스타일 (하이퍼 링크)
		    XSSFCellStyle csLink = wb.createCellStyle();
		    csLink.setAlignment(HorizontalAlignment.LEFT);
		    csLink.setVerticalAlignment(VerticalAlignment.TOP);
		    csLink.setBorderTop(BorderStyle.THIN);
		    csLink.setBorderRight(BorderStyle.THIN);
		    csLink.setBorderBottom(BorderStyle.THIN);
		    csLink.setBorderLeft(BorderStyle.THIN);
		    XSSFFont underListFont = wb.createFont();
		    underListFont.setUnderline(XSSFFont.U_SINGLE);
		    XSSFColor blueColor = new XSSFColor(new byte[] {(byte)138, (byte)43, (byte)226}, null);
		    underListFont.setColor(blueColor);
		    csLink.setFont(underListFont);

			// 루프안에서 재사용되는 변수들 선언
			if(sheetNames != null && sheetNames.length > 0 && sheetHeaderDataList != null && sheetNames.length == sheetHeaderDataList.size()) {
				int sheetIdx = 0;	//sheet index
				int rowIdx = 0;	// row index
				int cellIdx = 0;	// cell index
				String[] arrHeader = null;
				String[] arrColNm = null;
				int[] arrDataWidth = null;
				List<Map<String, Object>> dataList = null;
				String strVal = "";
				boolean isAutoWidth = false;	// 데이터 컬럼 너비 자동 계산
				Function<Integer, Integer> getCellWidth = byteSize -> byteSize * 300 + 600;	// 데이터 컬럼 너비 자동 계산 산식.  산식은 여러 테스트를 통해 변경해야함. java8의 함수형 인터페이스중 Function을 활용함.
				String dataGroupByKey = "";
				String dataGroupByVal = "";
				Map<String, Integer> groupMap = null;
				for(String sheetName : sheetNames) {
					arrHeader = (String[])sheetHeaderDataList.get(sheetIdx).get("HEADER");	// 헤더(타이틀)명
					arrColNm = (String[])sheetHeaderDataList.get(sheetIdx).get("DATA_KEY");	//데이터의 컬럼명
					dataList = (List<Map<String, Object>>)sheetHeaderDataList.get(sheetIdx).get("DATA_LIST");	//데이터 리스트
					arrDataWidth = (int[])sheetHeaderDataList.get(sheetIdx).get("DATA_WIDTH");	//데이터 컬럼 너비
					dataGroupByKey = sheetHeaderDataList.get(sheetIdx).get("DATA_GROUP_BY_KEY") != null ? String.valueOf(sheetHeaderDataList.get(sheetIdx).get("DATA_GROUP_BY_KEY")) : ""; // 그룹핑할 데이터의 컬럼명(key)
					groupMap = Maps.newHashMap();	// grouping 하는 경우 사용하는 맵 초기화

					// sheet 객체 생성
					sheet = wb.createSheet(sheetName);

					//데이터 컬럼 너비 설정
					if(arrDataWidth != null && arrDataWidth.length == arrHeader.length) {
						int dwIdx = 0;
						for(int dataWidth : arrDataWidth) {
							sheet.setColumnWidth(dwIdx++, dataWidth);
						}
					} else {
						arrDataWidth = new int[arrColNm.length];
						isAutoWidth = true;
					}

					// 헤더(타이틀) 영역 생성
					rowIdx = 0;
					cellIdx = 0;
					row = sheet.createRow(rowIdx++);	// 헤더(타이틀) 로우 생성
					for(String header : arrHeader) {
						// 데이터 컬럼 너비를 자동 계산하면서 현재 값이 기존 값보다 큰 경우 업데이트함.
						if(isAutoWidth && arrDataWidth[cellIdx] < getCellWidth.apply(header.getBytes().length)) {
							arrDataWidth[cellIdx] = getCellWidth.apply(header.getBytes().length);
						}

						cell = row.createCell(cellIdx++);
						cell.setCellValue(header);
						cell.setCellStyle(csTitle);
					}

					// 데이터 영역 생성
					for(Map<String, Object> data : dataList) {

						// grouping 하는 경우 groupMap에 dataGroupByKey의 값이 key로 존재하면 이번 로우는 생성하지 않는다.
						if(StringUtils.isNotEmpty(dataGroupByKey)) {
							dataGroupByVal = (data.get(dataGroupByKey) == null ? "" : String.valueOf(data.get(dataGroupByKey)));
							if(groupMap.containsKey(dataGroupByVal)) {
								continue;
							} else {
								groupMap.put(dataGroupByVal, 1);
							}
						}

						// 데이터 로우 생성
						row = sheet.createRow(rowIdx++);
						cellIdx = 0;
						for(String colNm : arrColNm) {
							strVal = (data.get(colNm) == null ? "" : String.valueOf(data.get(colNm)));

							// 데이터 컬럼 너비를 자동 계산하면서 현재 값이 기존 값보다 큰 경우 업데이트함.
							if(isAutoWidth && arrDataWidth[cellIdx] < getCellWidth.apply(strVal.getBytes().length)) {
								arrDataWidth[cellIdx] = getCellWidth.apply(strVal.getBytes().length);
							}

							cell = row.createCell(cellIdx++);
							cell.setCellValue(strVal);
							cell.setCellStyle(cs);
						}
					}

					// 데이터 컬럼 너비 자동 계산인 경우 셋잍
					if(isAutoWidth) {
						int dwIdx = 0;
						for(int dataWidth : arrDataWidth) {
							sheet.setColumnWidth(dwIdx++, dataWidth);
						}
					}

					sheetIdx++;
				}
			}

			fileOutputStream = new FileOutputStream(excelFilePath);
			//생성한 엑셀파일을 outputStream 해줍니다.
			wb.write(fileOutputStream);

		} catch(Exception e) {
			logger.error(e.toString());
		} finally {
			if(fileOutputStream != null) {
				try {
					fileOutputStream.close();
				} catch (IOException e) {
					logger.error(e.toString());
				}
			}

			if(wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					logger.error(e.toString());
				}
			}

			logger.debug("Create Excel File Success! excelFilePath => " + excelFilePath);
		}

	}

	/**
	 * 프로퍼티 파일 생성
	 * @param msgPropList	프로퍼티 값
	 * @param destFilePath	프로퍼티 파일 생성할 절대 경로
	 * @param commnets 파일 생성 코멘트
	 * @throws IOException
	 */
	public static void createProperties(List<Map<String, Object>> msgPropList, String destFilePath, String comments) throws IOException {
		// 신규 파일로 생성하므로.
		SortedProperties prop = new SortedProperties();
		String code = null;
		String text = null;
		for(Map<String, Object> msgPropMap : msgPropList ) {
			logger.info("msgPropMap " + msgPropMap.toString());
			if(msgPropMap.get("CODE") != null) {
				code = (String)msgPropMap.get("CODE");
				if(msgPropMap.get("TEXT") != null) {
					text = (String)msgPropMap.get("TEXT");
				} else {
					text = "";
				}
				prop.setProperty(code, text);
			}
		}

		// 파일 저장
		FileOutputStream fo = null;
		OutputStreamWriter osw = null;
		try {
			fo = new FileOutputStream(destFilePath);
			osw = new OutputStreamWriter( fo, Charset.forName("utf-8"));
			prop.store(osw, comments);
		}catch(Exception e) {
			logger.info(destFilePath + " : store error :: " + e.getMessage());
		} finally {
			if(fo != null) {
				try {
					fo.close();
				}catch(IOException ioe) {
					fo = null;
				}
			}
			if(osw != null) {
				try {
					osw.close();
				}catch(IOException ioe) {
					osw = null;
				}
			}
		}
	}

	/**
	 * 세션에 저장된 현재 Locale 객체 구하기
	 * @return	세션에 저장된 현재 Locale 객체
	 * @throws Exception
	 */
	public static Locale getSessionLocale() {
		Locale sessionLocale = Locale.getDefault();
		try {
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();

			if(req.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME) != null) {
				sessionLocale = ((Locale)req.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME));
			}
		}catch(Exception e) {
			logger.debug("getSessionLocale : error :: " + e.getMessage());
		}
		return sessionLocale;
	}
	
	/**
	 * 세션에 저장된 현재 Locale 객체 구하기
	 * @return	세션에 저장된 현재 Locale 객체
	 * @param req	HttpServletRequest
	 * @return	세션에 저장된 현재 Locale 객체
	 */
	public static Locale getSessionLocale(HttpServletRequest req) {
		Locale sessionLocale = Locale.getDefault();
		try {
			if(req.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME) != null) {
				sessionLocale = ((Locale)req.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME));
			}
		}catch(Exception e) {
			logger.debug("getSessionLocale : error :: " + e.getMessage());
		}
		return sessionLocale;
	}

	/**
	 * 세션에 저장된 현재 Locale 객체 구하기
	 * @return	세션에 저장된 현재 Locale 객체
	 * @throws Exception
	 */
	public static String getMessageCurrSessionLocale(String code, String[] args, String defStr) {
		String msg = "";
		try {
			Locale sessionLocale = getSessionLocale();
			msg = getPropertiesKey("/i18n/message_"+sessionLocale.getLanguage().toLowerCase()+".properties", code, defStr);
			if(args != null && args.length > 0 && StringUtils.isNotEmpty(msg) && msg.indexOf('{') > -1) {
				for(int i = 0; i < args.length; i++) {
					msg = msg.replaceAll("\\{"+i+"\\}", args[i]);
				}
			}
		}catch(Exception e) {
			logger.debug("getMessageCurrSessionLocale : error :: " + e.getMessage());
		}
		return msg;
	}

	/**
	 * 모바일 디바이스 여부
	 * @param request	HttpServletRequest
	 * @return
	 */
	public static boolean isMobileDevice(HttpServletRequest request) {
		String userAgent = request.getHeader("User-Agent") != null ? request.getHeader("User-Agent") : "";
		return userAgent.indexOf("Mobi") > -1;
	}
}

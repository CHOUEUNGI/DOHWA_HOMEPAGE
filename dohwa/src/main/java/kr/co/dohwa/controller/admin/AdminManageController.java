package kr.co.dohwa.controller.admin;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.codehaus.plexus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Maps;
import com.google.gson.Gson;

import kr.co.dohwa.component.FileDownLoadView;
import kr.co.dohwa.service.AdminManageService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.util.excel.ExcelCommentNotFountException;
import kr.co.dohwa.util.excel.ExcelManager;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/manage")
public class AdminManageController {

	@Value("#{config['file.download-temp']}")
	private String FILE_DOWNLOAD_TEMP;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private AdminManageService adminManageService;

	@Autowired
	private FileDownLoadView downloadView;

	/**
	 * 메시지 프로퍼티 관리
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/msgProp")
	public String msgProp() throws Exception {
		return "admin/manage/msgProp";
	}

	/**
	 * 메시지 프로퍼티 관리 수행
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/msgPropProc")
	public ModelAndView msgPropProc(@RequestParam("excelFile") MultipartFile excelFile, @RequestParam("type") String type) throws Exception {

		ModelAndView mav = new ModelAndView();

		// 3.엑셀 파일에서 읽어들인 데이터를 메시지 프로퍼티 테이블에 저장
		if(type.startsWith("upload")) {

			try {
				String filePath = FILE_UPLOAD_DIR + "/" + "excelUpload_" + type + "/" + excelFile.getOriginalFilename();
				File destFile = new File(filePath);
				excelFile.transferTo(destFile);

				if(destFile.exists() && destFile.isFile()) {
					log.debug("엑셀 파일 업로드 성공");
					Map<String, Object> retMap = CommonUtils.readExcelFile(filePath);

					log.debug("retMap " + retMap.toString());
					if("OK".equals(retMap.get("RSLT"))) {
						log.debug("headerList " + (List<String>)retMap.get("HEADER_LIST"));
						log.debug("dataList " + (List<Map<String, Object>>)retMap.get("DATA_LIST"));

						// 엑셀 파일에서 읽어들인 데이터를 메시지 프로퍼티 테이블에 저장
						if("uploadExceltoMsgPropDB".equals(type)) {
							adminManageService.mergeMsgPropFromExcel((List<Map<String, Object>>)retMap.get("DATA_LIST"));
						}
						mav.addObject("CODE", "OK");
						Map<String, Object> msgMap = Maps.newHashMap();
						msgMap.put("headerList", (List<String>)retMap.get("HEADER_LIST"));
						msgMap.put("dataList", (List<Map<String, Object>>)retMap.get("DATA_LIST"));
						mav.addObject("MSG", msgMap);

					} else {
						mav.addObject("CODE", "FAIL");
						mav.addObject("MSG", retMap.get("MSG"));
						log.debug("MSG " + retMap.get("MSG"));
						log.debug("e.printStack " + retMap.get("ERROR_STACKTRACE"));
					}

				} else {
					mav.addObject("CODE", "FAIL");
					mav.addObject("MSG", "엑셀 파일 업로드 실패");
				}
			}catch(Exception e) {
				mav.addObject("CODE", "FAIL");
				mav.addObject("MSG", e.getMessage());
			}

		}

		// 4.엑셀 파일 생성해서 다운로드 진행함.
		else if("downloadExcelFromMsgProDB".equals(type)) {

			ExcelManager excelManager = new ExcelManager();
			String templateExcelfilePath = "";
			String makeExcelFilePath = "";

			try {
				templateExcelfilePath = resourceLoader.getResource("classpath:/excel/template_msg_prop.xlsx").getURI().getPath();
				makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";

				Gson gson = new Gson();
				List<Map<String,Object>> list = adminManageService.getMsgPropGrpCodeList();
				Map<String,Object> jsonMap = Maps.newHashMap();
				jsonMap.put("list", list);

				excelManager.makeExcel(templateExcelfilePath, makeExcelFilePath, gson.toJson(jsonMap));
			} catch (IOException e) {
				log.error("엑셀 파일 로드 실패 {}", e);
			} catch (ExcelCommentNotFountException e) {
				log.error("엑셀 다운로드 실패 {}", e);
			}

			File downFile = new File(makeExcelFilePath);
			mav.addObject("downloadFile", downFile);
			mav.addObject("fileName", "메세지_프로퍼티_" + (LocalDateTime.now()) +".xlsx");
			mav.setView(downloadView);
			return mav;
		}


		else {

			// 1.메시지 프로퍼티를 읽어서 메시지 프로퍼티 테이블에 저장
			if("toDBfromMsgProp".equals(type)) {
				try {
					adminManageService.toDBFromMsgProp();
					mav.addObject("CODE", "OK");
					mav.addObject("MSG", "메시지 프로퍼티 파일들을 읽어서 DB에서 저장했습니다.");

				} catch(Exception e) {
					mav.addObject("CODE", "FAIL");
					mav.addObject("MSG", e.getMessage());
				}
			}

			// 2.메시지 프로퍼티 테이블의 데이터를 읽어서 메시지 프로퍼티 파일로 생성
			else if("toMsgPropfromDB".equals(type)) {
				try {
					mav.addObject("CODE", "OK");
					mav.addObject("MSG", adminManageService.toMsgPropfromDB());

				} catch(Exception e) {
					mav.addObject("CODE", "FAIL");
					mav.addObject("MSG", e.getMessage());
				}
			}

			// 5.jsp파일을 파싱해서 메시지 프로퍼티 값 생성하기.
			else if("getMsgPropfromJsp".equals(type)) {

				// front용 jsp 파일 목록 뽑기
				String rootPath = resourceLoader.getResource("/").getURI().getPath();
				String jspRootPath = rootPath + "/WEB-INF/views/front";
				List<File> fileList = new ArrayList<File>();
				CommonUtils.getFileList(fileList, jspRootPath, "jsp");
				log.debug("front :: getMsgPropfromJsp > fileList.size() => " + (fileList == null ? 0 : fileList.size()));

				jspRootPath = rootPath + "/WEB-INF/views/front";
				CommonUtils.getFileList(fileList, jspRootPath, "jsp");
				log.debug("front + mobile :: getMsgPropfromJsp > fileList.size() => " + (fileList == null ? 0 : fileList.size()));

				// front용 jsp 파일에서 메시지 프로퍼지 정보 뽑기
				List<Map<String, Object>> msgPropList = new ArrayList<Map<String, Object>>();
//				if(fileList != null && !fileList.isEmpty()) {
//					for(File cFile : fileList) {
//						msgPropList.addAll(CommonUtils.getMspPropListFromJsp(cFile));
//					}
//				}
				Map<String, Object>  msgProp = Maps.newHashMap();
				Map<String, Object>  retMapJsp = null;
				StringBuilder sbLog = new StringBuilder();
				if(fileList != null && !fileList.isEmpty()) {
					for(File cFile : fileList) {
						retMapJsp = CommonUtils.getMspPropFromJsp(cFile);
						if(retMapJsp != null && retMapJsp.get("msgPropMap") != null) {
							msgProp.putAll((Map<String, Object>)retMapJsp.get("msgPropMap"));
						} else if(retMapJsp != null && retMapJsp.get("duplCodeLog") != null) {
							sbLog.append( (String)retMapJsp.get("duplCodeLog") ).append("\n");
						}
					}
				}

				// Map<String, Object>  msgProp에 담긴 정보를 List<Map<String, Object>> msgPropList형태로 변환
				if(msgProp != null && !msgProp.isEmpty()) {
					Iterator<String> iter = msgProp.keySet().iterator();
					while(iter.hasNext()) {
						String key = iter.next();
						Map<String, Object> item = Maps.newHashMap();
						item.put("CODE", key);
						item.put("TEXT", msgProp.get(key));
						msgPropList.add(item);
					}
				}

				// 프로퍼티 파일 생성
				String destFilePath = FILE_UPLOAD_DIR+"/message_KO_JSP_"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))+".properties";
				CommonUtils.createProperties(msgPropList, destFilePath, "Created by [FRONT_JSP] in " + LocalDateTime.now());

				log.info("getMsgPropfromJsp > msgPropList.size() => " + msgPropList.size());
				log.info("getMsgPropfromJsp > 같은 code지만 text 다른 경우 => \n" + sbLog.toString());

				// 생성한 프로퍼티 파일 다운로드 처리
				File downFile = new File(destFilePath);
				mav.addObject("downloadFile", downFile);
				mav.addObject("fileName", downFile.getName());
				mav.setView(downloadView);
				return mav;
			}
		}

		mav.addObject("TYPE", type);
		mav.setViewName("admin/manage/msgProp");
		return mav;
	}

	/**
	 * 엑셀 업로드를 이용한 초기 데이터 셋팅 화면 호출
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/excelUpload")
	public String excelUpload() throws Exception {
		return "admin/manage/excelUpload";
	}

	/**
	 * 엑셀 업로드를 이용한 초기 데이터 셋팅 수행
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/excelUploadProc")
	public ModelAndView excelUploadProc(@RequestParam("excelFile") MultipartFile excelFile, @RequestParam("type") String type, Principal principal) throws Exception {

		ModelAndView mav = new ModelAndView();

		try {
			// 파일업로드 경로 확인 후 없으면 강제 생성
			File targetDir = new File(FILE_UPLOAD_DIR + "/" + "excelUpload_" + type);
			if(!targetDir.exists()) {
				FileUtils.forceMkdir(targetDir);
			}

			// 파일 저장
			String filePath = FILE_UPLOAD_DIR + "/" + "excelUpload_" + type + "/" + excelFile.getOriginalFilename();
			File destFile = new File(filePath);
			excelFile.transferTo(destFile);

			// 엑셀 파일 업로드 성공
			if(destFile.exists() && destFile.isFile()) {
				log.debug("엑셀 파일 업로드 성공");

				// 엑셀 파일에서 읽어들인 데이터를 담은 Map<String, Object>
				Map<String, Object> retMap = Maps.newHashMap();
				if(type.startsWith("project")) {
					// 엑셀 파일을 읽어서 Map<String, Object> retMap 객체에 저장해서 전달함.
					String[] arrColNm = new String[]{"REG_DT","TITLE","SUB_TITLE","TYPE_1","TYPE_2","TYPE_3","TYPE_4","TYPE_5","CLIENT","YEAR","PC_IMG_PATH","PC_IMG","M_IMG_PATH","M_IMG","CONT"};
					retMap = CommonUtils.readExcelFileMultiSheet(filePath, arrColNm);
					log.debug("retMap " + retMap.toString());

					// 엑셀 데이터 import 진행
					adminManageService.importProjectExcel(retMap, filePath, principal.getName());
				}

				// 화면에 전달할 내용 셋팅
				mav.addObject("CODE", "OK");
				Map<String, Object> msgMap = Maps.newHashMap();
				msgMap.put("헤더", (List<String>)retMap.get("HEADER_LIST"));
				msgMap.put("국문", (List<Map<String, Object>>)retMap.get("DATA_LIST_0"));
				msgMap.put("영문", (List<Map<String, Object>>)retMap.get("DATA_LIST_1"));
				msgMap.put("스페인어", (List<Map<String, Object>>)retMap.get("DATA_LIST_2"));
				mav.addObject("MSG", msgMap);

			} else {
				mav.addObject("CODE", "FAIL");
				mav.addObject("MSG", "엑셀 파일 업로드 실패");
			}

		}catch(Exception e) {
			mav.addObject("CODE", "FAIL");
			mav.addObject("MSG", e.getMessage());
			log.error("excelUploadProc error :: " + e.getMessage(), e);
		}

		mav.addObject("TYPE", type);
		mav.setViewName("admin/manage/excelUpload");
		return mav;
	}

	/**
	 * 프로젝트 리스트 엑셀로 다운로드 받기
	 * @param lang	언어코드(KO, EN, ES)
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/downloadExcelProjectList")
	public ModelAndView downloadExcelProjectList(@RequestParam(name = "lang", required = true) String lang) throws Exception {
		ModelAndView mav = new ModelAndView();

		ExcelManager excelManager = new ExcelManager();
		String templateExcelfilePath = "";
		String makeExcelFilePath = "";

		try {
			templateExcelfilePath = resourceLoader.getResource("classpath:/excel/template_project_list.xlsx").getURI().getPath();
			makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";

			Gson gson = new Gson();
			Map<String, Object> paramMap = Maps.newHashMap();
			paramMap.put("LANG", lang);
			List<Map<String,Object>> list = adminManageService.exportProject(paramMap);
			Map<String,Object> jsonMap = Maps.newHashMap();
			jsonMap.put("list", list);

			excelManager.makeExcel(templateExcelfilePath, makeExcelFilePath, gson.toJson(jsonMap));
		} catch (IOException e) {
			log.error("엑셀 파일 로드 실패 {}", e);
		} catch (ExcelCommentNotFountException e) {
			log.error("엑셀 다운로드 실패 {}", e);
		}

		File downFile = new File(makeExcelFilePath);
		mav.addObject("downloadFile", downFile);
		mav.addObject("fileName", "프로젝트_리스트_" + (LocalDateTime.now()) +".xlsx");
		mav.setView(downloadView);
		return mav;
	}
	
	/**
	 * 프로젝트 리스트 엑셀로 다운로드 받기
	 * @param lang	언어코드(KO, EN, ES)
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/downloadExcelProjectListForCheck")
	public ModelAndView downloadExcelProjectListForCheck() throws Exception {
		ModelAndView mav = new ModelAndView();

		ExcelManager excelManager = new ExcelManager();
		String templateExcelfilePath = "";
		String makeExcelFilePath = "";

		try {
			templateExcelfilePath = resourceLoader.getResource("classpath:/excel/template_project_list_check.xlsx").getURI().getPath();
			makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + "_check.xlsx";

			Gson gson = new Gson();
			Map<String, Object> paramMap = Maps.newHashMap();
			List<Map<String,Object>> list = adminManageService.exportProjectForCheck(paramMap);;
			Map<String,Object> jsonMap = Maps.newHashMap();
			jsonMap.put("list", list);

			excelManager.makeExcel(templateExcelfilePath, makeExcelFilePath, gson.toJson(jsonMap));
		} catch (IOException e) {
			log.error("엑셀 파일 로드 실패 {}", e);
		} catch (ExcelCommentNotFountException e) {
			log.error("엑셀 다운로드 실패 {}", e);
		}

		File downFile = new File(makeExcelFilePath);
		mav.addObject("downloadFile", downFile);
		mav.addObject("fileName", "프로젝트_리스트_" + (LocalDateTime.now()) +".xlsx");
		mav.setView(downloadView);
		return mav;
	}

	/**
	 * 프로젝트 이미지 리스트 엑셀로 다운로드 받기
	 * @param lang	언어코드(KO, EN, ES)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/downloadExcelProjectImageList")
	public ModelAndView downloadExcelProjectImageList() throws Exception {
		ModelAndView mav = new ModelAndView();

		String makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";

		// 프로젝트 이미지 리스트 조회
		List<Map<String, Object>> dataList = adminManageService.getProjectImageListForExcel();

		// 엑셀 파일 생성을 위한 데이터 셋팅
		List<Map<String, Object>> sheetHeaderDataList = new ArrayList<Map<String, Object>>();
		// 테이블 목록 데이터 셋팅
		Map<String, Object> sheetMap1 = Maps.newHashMap();
		sheetMap1.put("HEADER", new String[] {"등록일시","일련번호(내부DB)","프로젝트명","디바이스타입","파일경로", "파일존재여부"});
		sheetMap1.put("DATA_KEY", new String[] {"REG_DATE","SEQ","TITLE","TYPE","FILE_PATH","FILE_EXIST"});
		sheetMap1.put("DATA_LIST", dataList);
		sheetHeaderDataList.add(sheetMap1);

		// 엑셀 파일 생성
		CommonUtils.createExcelFile(makeExcelFilePath, new String[] {"프로젝트 이미지 목록"} , sheetHeaderDataList);

		// 엑셀 파일 다운로드
		File downFile = new File(makeExcelFilePath);
		mav.addObject("downloadFile", downFile);
		mav.addObject("fileName", "프로젝트이미지목록_" + (LocalDateTime.now()) +".xlsx");
		mav.setView(downloadView);
		return mav;
	}


	/**
	 * 프로젝트의 테이블 목록, 테이블 정의서를 엑셀로 다운로드
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/downloadExcelForDBTableSpecs")
	public ModelAndView downloadExcelForDBTableSpecs() throws Exception {
		ModelAndView mav = new ModelAndView();

		String makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";

		// 테이블 스키마 조회
		Map<String, Object> paramMap = Maps.newHashMap();
		paramMap.put("TABLE_SCHEMA", "dohwa");
		List<Map<String, Object>> dataList = adminManageService.getMysqlTableSchema(paramMap);

		// 엑셀 파일 생성을 위한 데이터 셋팅
		List<Map<String, Object>> sheetHeaderDataList = new ArrayList<Map<String, Object>>();
		// 테이블 목록 데이터 셋팅
		Map<String, Object> sheetMap1 = Maps.newHashMap();
		sheetMap1.put("HEADER", new String[] {"테이블명","테이블 설명"});
		sheetMap1.put("DATA_KEY", new String[] {"TABLE_NAME","TABLE_COMMENT"});
		//sheetMap1.put("DATA_WIDTH", new int[] {3000,6000});
		sheetMap1.put("DATA_LIST", dataList);
		sheetMap1.put("DATA_GROUP_BY_KEY", "TABLE_NAME");
		sheetHeaderDataList.add(sheetMap1);

		// 테이블 정의서(전체) 데이터 셋팅
		Map<String, Object> sheetMap2 = Maps.newHashMap();
		sheetMap2.put("HEADER", new String[] {"테이블명","테이블 설명","컬럼명","컬럼 타입","널 여부","컬럼 설명"});
		sheetMap2.put("DATA_KEY", new String[] {"TABLE_NAME","TABLE_COMMENT","COLUMN_NAME","TYPE","IS_NULLABLE","COLUMN_COMMENT"});
		//sheetMap2.put("DATA_WIDTH", new int[] {100,200,300,400,500,600});
		sheetMap2.put("DATA_LIST", dataList);
		sheetHeaderDataList.add(sheetMap2);

		// 엑셀 파일 생성
		CommonUtils.createExcelFile(makeExcelFilePath, new String[] {"테이블 목록", "테이블 정의서(전체)"} , sheetHeaderDataList);

		// 엑셀 파일 다운로드
		File downFile = new File(makeExcelFilePath);
		mav.addObject("downloadFile", downFile);
		mav.addObject("fileName", "테이블정의서_" + (LocalDateTime.now()) +".xlsx");
		mav.setView(downloadView);
		return mav;
	}

	/**
	 * 프로젝트의 테이블 목록, 테이블 정의서를 엑셀로 다운로드.
	 * 테이블별로 시트 분할.
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/downloadExcelSheetsByTableForDBTableSpecs")
	public ModelAndView downloadExcelSheetsByTableForDBTableSpecs() throws Exception {
		ModelAndView mav = new ModelAndView();

		String makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";
		List<String> sheetNameList = new ArrayList<String>();

		// 테이블 스키마 조회
		Map<String, Object> paramMap = Maps.newHashMap();
		paramMap.put("TABLE_SCHEMA", "dohwa");
		List<Map<String, Object>> dataList = adminManageService.getMysqlTableSchema(paramMap);

		// 엑셀 파일 생성을 위한 데이터 셋팅
		List<Map<String, Object>> sheetHeaderDataList = new ArrayList<Map<String, Object>>();

		// 테이블목록 시트용 데이터 리스트
		List<Map<String, Object>> tableList = new ArrayList<Map<String, Object>>();

		// 테이블 목록 데이터 셋팅
		Map<String, Object> sheetMap1 = Maps.newHashMap();
		sheetMap1.put("HEADER", new String[] {"테이블명","테이블 설명"});
		sheetMap1.put("DATA_KEY", new String[] {"TABLE_NAME","TABLE_COMMENT"});
		sheetMap1.put("DATA_LIST", tableList);
		sheetHeaderDataList.add(0, sheetMap1);
		sheetNameList.add("테이블 목록");

		// 테이블 정의서 테이블별 시트 데이터 셋팅
		String tableName = "";
		int sheetHeaderDataListIdx = 1;
		Map<String, Integer> tableFilterMap = Maps.newHashMap();
		for(Map<String, Object> dataMap : dataList) {
			tableName = String.valueOf(dataMap.get("TABLE_NAME"));
			if(!tableFilterMap.containsKey(tableName) || tableFilterMap.get(tableName) == null) {	// tableFilterMap에 테이블명이 없는 경우

				// add tableList
				Map<String, Object> tableMap = Maps.newHashMap();
				tableMap.put("TABLE_NAME", tableName);
				tableMap.put("TABLE_COMMENT", String.valueOf(dataMap.get("TABLE_COMMENT")));
				tableList.add(tableMap);

				// add tableFilterMap
				tableFilterMap.put(tableName, sheetHeaderDataListIdx);

				// add sheetHeaderDataList
				Map<String, Object> sheetMap = Maps.newHashMap();
				sheetMap.put("HEADER", new String[] {"테이블명","테이블 설명","컬럼명","컬럼 타입","널 여부","컬럼 설명"});
				sheetMap.put("DATA_KEY", new String[] {"TABLE_NAME","TABLE_COMMENT","COLUMN_NAME","TYPE","IS_NULLABLE","COLUMN_COMMENT"});
				sheetMap.put("DATA_LIST", new ArrayList<Map<String, Object>>());
				sheetHeaderDataList.add(sheetHeaderDataListIdx, sheetMap);
				sheetNameList.add(tableName);
				log.debug("tableName " + tableName);

				// sheetHeaderDataList의 DATA_LIST에 현재 dataMap 추가
				((List<Map<String, Object>>)sheetHeaderDataList.get(sheetHeaderDataListIdx).get("DATA_LIST")).add(dataMap);

				sheetHeaderDataListIdx++;	// 시트 데이터 index 증가

			} else {	// tableFilterMap에 테이블명이 없는 경우

				// sheetHeaderDataList의 DATA_LIST에 현재 dataMap 추가
				((List<Map<String, Object>>)sheetHeaderDataList.get(tableFilterMap.get(tableName)).get("DATA_LIST")).add(dataMap);

			}

		}

		// 엑셀 파일 생성
		CommonUtils.createExcelFile(makeExcelFilePath, sheetNameList.toArray(new String[sheetNameList.size()]) , sheetHeaderDataList);

		// 엑셀 파일 다운로드
		File downFile = new File(makeExcelFilePath);
		mav.addObject("downloadFile", downFile);
		mav.addObject("fileName", "테이블정의서_" + (LocalDateTime.now()) +".xlsx");
		mav.setView(downloadView);
		return mav;
	}

}

package kr.co.dohwa.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.codehaus.plexus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.mysql.cj.log.Log;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.mapper.AdminManageMapper;
import kr.co.dohwa.mapper.CodeMapper;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.mapper.ProjectMapper;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.ProjectMlVO;
import kr.co.dohwa.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 어드민 관리 관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("adminManageService")
public class AdminManageService {

	@Autowired
	private AdminManageMapper adminManageMapper;

	@Autowired
	private CodeMapper codeMapper;

	@Autowired
	private ProjectMapper projectMapper;

	@Autowired
	private FileUploader fileUploader;

	@Autowired
	private FileMapper fileMapper;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	private final String PROJECT_IMAGE_IMPORT_ROOT = "/project_import/";

	/**
	 * 엑셀 업로드를 통해서 DB에 메시지 프로퍼티 정보를 머지함.
	 * 엑셀 양식 : CODE	,KO_TEXT,EN_TEXT,ES_TEXT
	 * @param codeVO
	 * @return
	 */
	@Transactional
	public void mergeMsgPropFromExcel(List<Map<String, Object>> msgPropList) {

		String regId = "EXCEL_UPLOAD_";
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if(securityContext != null && securityContext.getAuthentication() != null) {
			Authentication authentication = securityContext.getAuthentication();
			regId = "EXCEL_UPLOAD_" + authentication.getName();
		}

		for(Map<String, Object> map : msgPropList) {
			if(map.get("CODE") != null && StringUtils.isNotEmpty((String)map.get("CODE"))) {
				map.put("USE_YN", "Y");
				map.put("REG_ID", regId);
				if(map.get("KO_TEXT") != null) {
					map.put("LANG", "KO");
					map.put("TEXT", map.get("KO_TEXT"));
					//adminManageMapper.insertMsgProp(map);	//머지
					adminManageMapper.insertMsgPropOnlyAdd(map);	//추가만
				}
				if(map.get("EN_TEXT") != null) {
					map.put("LANG", "EN");
					map.put("TEXT", map.get("EN_TEXT"));
					//adminManageMapper.insertMsgProp(map);	//머지
					adminManageMapper.insertMsgPropOnlyAdd(map);	//추가만
				}
				if(map.get("ES_TEXT") != null) {
					map.put("LANG", "ES");
					map.put("TEXT", map.get("ES_TEXT"));
					adminManageMapper.insertMsgProp(map);	//머지
					//adminManageMapper.insertMsgPropOnlyAdd(map);	//추가만
				}
			}
		}
	}

	/**
	 * 메세지 프로퍼티 조회
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getMsgPropList(Map<String, Object> map) {
		return adminManageMapper.getMsgPropList(map);
	}

	/**
	 * 메시지 프로퍼티 파일을 읽어서 DB에서 인서트
	 * @throws Exception
	 */
	@Transactional
	public void toDBFromMsgProp() throws Exception{
		// 메시지 프로퍼티 핸들링
		String[] arrLang = {"KO","EN","ES"};
		for(String lang : arrLang) {
			List<Map<String, Object>> msgPropList = new ArrayList<Map<String, Object>>();
			Iterator<Entry<Object, Object>> itr = CommonUtils.getProperties("./../i18n/message"+(StringUtils.isNotEmpty(lang) ? "_" + lang.toLowerCase() : "")+".properties").entrySet().iterator();
			Map<String, Object> dataMap = null;
			while (itr.hasNext()) {
				dataMap = Maps.newHashMap();

				Entry<Object, Object> entry = itr.next();
				// 이메일 자르듯 구분자 자르기 ㅋ
				String propose_str = entry.toString();
				String propose_key = null;
				String propose_val = null;
				String arrStr[] = propose_str.split("=");
				if (arrStr != null && arrStr.length > 1) {
					propose_key = arrStr[0];
					propose_val = propose_str.substring(propose_str.indexOf('=')+1); // value안에 =가 있을 수 있어서 첫번째 '=' 부터 문자열 자르기처리함.
				}

				dataMap.put("CODE", propose_key);
				dataMap.put("TEXT", propose_val);
				dataMap.put("DEF_TXT", propose_val);
				dataMap.put("REG_ID", "_MSG_PROP_UPLOAD");
				dataMap.put("USE_YN", "Y");
				dataMap.put("LANG", StringUtils.isNotEmpty(lang) ? lang : "KO");

				msgPropList.add(dataMap);
			}

			// DB Insert
			for(Map<String, Object> map : msgPropList) {
				if(map.get("CODE") != null && StringUtils.isNotEmpty((String)map.get("CODE"))
						&& map.get("TEXT") != null && StringUtils.isNotEmpty((String)map.get("TEXT"))
						) {
					adminManageMapper.insertMsgProp(map);
				}
			}
		}
	}

	/**
	 * DB에서 언어별 메시지 정보를 읽어서 메시지 프로퍼티 파일을 특정 폴더 밑에 생성하는 메소드
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> toMsgPropfromDB() throws Exception{
		Map<String, Object> retMap = Maps.newHashMap();

		String[] arrLang = {"KO","EN","ES"};
		String destFilePath = null;
		for(String lang : arrLang) {
			// DB 데이터 조회
			Map<String, Object> map = Maps.newHashMap();
			map.put("LANG", lang);
			List<Map<String, Object>> msgPropList = adminManageMapper.getMsgPropList(map);

			// 프로퍼티 파일 생성
			destFilePath = FILE_UPLOAD_DIR+"/message"+(StringUtils.isNotEmpty(lang) ? "_" + lang.toLowerCase() : "")+".properties";
			CommonUtils.createProperties(msgPropList, destFilePath, ("Created by DB[TB_MSG_PROP] in " + LocalDateTime.now()));
			retMap.put(lang, destFilePath);

		}

		return retMap;
	}

	/**
	 *  메세지 프로퍼티 조회. 코드 기준으로  언어별 pivot 쿼리 형태로 조회
	 */
	public List<Map<String, Object>> getMsgPropGrpCodeList() {
		return adminManageMapper.getMsgPropGrpCodeList();
	}

	/**
	 *	mysql 테이블 스키마 정보 조회
	 */
	public List<Map<String, Object>> getMysqlTableSchema(Map<String, Object> map) {
		return adminManageMapper.getMysqlTableSchema(map);
	}

	/**
	 *	프로젝트 이미지 리스트 조회. 실제 파일 존재 여부 체크도 함께.
	 */
	public List<Map<String, Object>> getProjectImageListForExcel() {
		List<Map<String, Object>> imgList = adminManageMapper.getProjectImageListForExcel();
		if(imgList != null) {
			for(Map<String, Object> img : imgList) {
				img.put("FILE_EXIST", FileUtils.fileExists(FILE_UPLOAD_DIR + String.valueOf(img.get("FILE_PATH"))));
			}
		}

		return imgList;
	}

	/**
	 * 엑셀 템플릿으로 프로젝트 정보 임포트 1.
	 * @param retMap
	 * @param filePath
	 * @param uploadId
	 */
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void importProjectExcel(Map<String, Object> retMap, String filePath, String uploadId) {

		// 엑셀 파일 로드 성공 여부 판단.
		if("OK".equals(retMap.get("RSLT"))) {
			// 등록일시	프로젝트명	부제목	Market 1차	Market 2차	Service	Region 1차	Region 2차	발주처	준공연도	PC이미지경로	PC이미지	Mobile이미지경로	Mobile이미지	프로젝트 설명
			// REG_DT	TITLE	SUB_TITLE	TYPE_1	TYPE_2	TYPE_3	TYPE_4	TYPE_5	CLIENT	YEAR	PC_IMG_PATH	PC_IMG	M_IMG_PATH	M_IMG	CONT
			List<Map<String, Object>> dataList = (List<Map<String, Object>>)retMap.get("DATA_LIST_0");
			List<Map<String, Object>> enDataList = (List<Map<String, Object>>)retMap.get("DATA_LIST_1");
			List<Map<String, Object>> esDataList = (List<Map<String, Object>>)retMap.get("DATA_LIST_2");

			if(dataList != null && !dataList.isEmpty()) {

				//항목 코드 리스트를 조회한 후 타입별로 리스트를 정리한다.
				Map<String, String> type1Map = Maps.newHashMap();
				Map<String, String> type2Map = Maps.newHashMap();
				Map<String, String> type3Map = Maps.newHashMap();
				Map<String, String> type4Map = Maps.newHashMap();
				Map<String, String> type5Map = Maps.newHashMap();
				List<CodeVO> projectItemList = codeMapper.getProjectItemList();
				if(projectItemList != null && !projectItemList.isEmpty()) {
					for(CodeVO codeVO : projectItemList) {
						// type4
						if(!StringUtils.isEmpty(codeVO.getParentCode()) && codeVO.getParentCode().startsWith("MARKET_")) {
							type4Map.put(StringUtils.trimToEmpty(codeVO.getKoText()), StringUtils.trimToEmpty(codeVO.getCode()));
						}
						// type1
						else if(StringUtils.isNotEmpty(codeVO.getParentCode()) && codeVO.getParentCode().startsWith("MARKET")) {
							type1Map.put(StringUtils.trimToEmpty(codeVO.getKoText()), StringUtils.trimToEmpty(codeVO.getCode()));
						}
						// type2
						else if(StringUtils.isNotEmpty(codeVO.getParentCode()) && codeVO.getParentCode().startsWith("SERVICE")) {
							type2Map.put(StringUtils.trimToEmpty(codeVO.getKoText()), StringUtils.trimToEmpty(codeVO.getCode()));
						}
						// type5
						else if(StringUtils.isNotEmpty(codeVO.getParentCode()) && codeVO.getParentCode().startsWith("REGION_")) {
							type5Map.put(StringUtils.trimToEmpty(codeVO.getKoText()), StringUtils.trimToEmpty(codeVO.getCode()));
						}
						// type3
						else if(StringUtils.isNotEmpty(codeVO.getParentCode()) && codeVO.getParentCode().startsWith("REGION")) {
							type3Map.put(StringUtils.trimToEmpty(codeVO.getKoText()), StringUtils.trimToEmpty(codeVO.getCode()));
						}
					}
				}

				// 엑셀에서 읽어들인 dataList를 루프돌려서 프로젝트 VO에 값을 셋팅한 후 리스트에 추가한다.
				List<ProjectVO> projectList = new ArrayList<ProjectVO>();
				int rowIdx = 0;
				for(Map<String, Object> rowMap : dataList) {
					ProjectVO projectVO = new ProjectVO();
					projectVO.setStrRegDt((String)rowMap.get("REG_DT"));
					projectVO.setRegDt(LocalDateTime.parse((String)rowMap.get("REG_DT"), DateTimeFormatter.ofPattern("yyyy-MM-dd-HH:mm")));	//yyyy-mm-dd-00:00
					projectVO.setType1(toCodeFromKoTypeText((String)rowMap.get("TYPE_1"), type1Map));
					projectVO.setType4(toCodeFromKoTypeText((String)rowMap.get("TYPE_2"), type4Map));
					projectVO.setType2(toCodeFromKoTypeText((String)rowMap.get("TYPE_3"), type2Map));
					projectVO.setType3(toCodeFromKoTypeText((String)rowMap.get("TYPE_4"), type3Map));
					projectVO.setType5(toCodeFromKoTypeText((String)rowMap.get("TYPE_5"), type5Map));
					projectVO.setDispYn("Y");
					projectVO.setYear((String)rowMap.get("YEAR"));
					projectVO.setLoginId("EXCEL_UPLOAD_"+uploadId);
					projectVO.setKoTitle((String)rowMap.get("TITLE"));
					projectVO.setKoSubTitle((String)rowMap.get("SUB_TITLE"));
					projectVO.setKoClient((String)rowMap.get("CLIENT"));
					projectVO.setKoCont((String)rowMap.get("CONT"));
					projectVO.setPcImgNm((String)rowMap.get("PC_IMG"));
					projectVO.setMbImgNm((String)rowMap.get("M_IMG"));
					projectVO.setPcImgPath((String)rowMap.get("PC_IMG_PATH"));
					projectVO.setMbImgPath((String)rowMap.get("M_IMG_PATH"));
					log.debug("PC_IMG_PATH " + projectVO.getPcImgPath());
					log.debug("PC_IMG_PATH " + projectVO.getMbImgPath());
					if(enDataList != null && enDataList.size() > rowIdx) {
						projectVO.setEnTitle((String)(enDataList.get(rowIdx)).get("TITLE"));
						projectVO.setEnSubTitle((String)(enDataList.get(rowIdx)).get("SUB_TITLE"));
						projectVO.setEnClient((String)(enDataList.get(rowIdx)).get("CLIENT"));
						projectVO.setEnCont((String)(enDataList.get(rowIdx)).get("CONT"));
					}
					if(esDataList != null && esDataList.size() > rowIdx) {
						projectVO.setEsTitle((String)(esDataList.get(rowIdx)).get("TITLE"));
						projectVO.setEsSubTitle((String)(esDataList.get(rowIdx)).get("SUB_TITLE"));
						projectVO.setEsClient((String)(esDataList.get(rowIdx)).get("CLIENT"));
						projectVO.setEsCont((String)(esDataList.get(rowIdx)).get("CONT"));
					}
					projectList.add(projectVO);
					rowIdx++;
				}
				// 프로젝트 리스트 저장.
				this.importProject(projectList);
			}
		}
	}

	/**
	 * 엑셀 템플릿으로 프로젝트 정보 임포트 2. 포르젝트 정보를 담은 리스트 DB에 저장
	 * @param projectList 포르젝트 정보를 담은 리스트
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void importProject(List<ProjectVO> projectList) {

		// 기존에 저장된 데이터 삭제.
		adminManageMapper.resetProjectMl();
		adminManageMapper.resetProjectMast();
		adminManageMapper.resetProjectFile();

		// 포르젝트 데이터 인서트.
		Map<String, Object> map = null;
		for(ProjectVO projectVO : projectList) {
			// 마스터 테이블
			projectMapper.insertProject(projectVO);

			// 프로젝트 다국어
			List<ProjectMlVO> mls = Lists.newArrayList();
			List<FileVO> files = new ArrayList<FileVO>();
			for (String lang : Constant.LANG_CODES) {
				ProjectMlVO projectMlVO = new ProjectMlVO();

				if(lang.equals("KO")) {
					// ML 테이블 정보
					projectMlVO.setSeq(projectVO.getSeq());
					projectMlVO.setLang(lang);
					projectMlVO.setTitle(projectVO.getKoTitle());
					projectMlVO.setSubTitle(projectVO.getKoSubTitle());
					projectMlVO.setCont(projectVO.getKoCont());
					projectMlVO.setClient(projectVO.getKoClient());
					mls.add(projectMlVO);

					// PC 이미지
					String[] arrPcFileNm = projectVO.getPcImgNm() != null ? projectVO.getPcImgNm().split("\\n") : new String[]{};
					if(arrPcFileNm.length > 0) {
						for(int pcOrd = 1; pcOrd <= arrPcFileNm.length; pcOrd++) {
							FileVO pcFile = new FileVO();
							pcFile.setId( LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS")) + fileUploader.generateFileRegKey(13));
							pcFile.setAttSeq(projectVO.getSeq());
							pcFile.setAttType("PROJECT");
							pcFile.setAttOrder(pcOrd);
							pcFile.setNewName(StringUtils.trimToEmpty(arrPcFileNm[pcOrd-1]));
							pcFile.setOrgName(StringUtils.trimToEmpty(arrPcFileNm[pcOrd-1]));
							pcFile.setPath(PROJECT_IMAGE_IMPORT_ROOT + StringUtils.trimToEmpty(projectVO.getPcImgPath()));
							pcFile.setType("PC");
							files.add(pcFile);
						}
					}


					// 모바일 이미지
					String[] arrMbFileNm = projectVO.getMbImgNm() != null ? projectVO.getMbImgNm().split("\\n") : new String[]{};
					if(arrMbFileNm.length > 0) {
						for(int mbOrd = 1; mbOrd <= arrMbFileNm.length; mbOrd++) {
							FileVO pcFile = new FileVO();
							pcFile.setId( LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS")) + fileUploader.generateFileRegKey(13));
							pcFile.setAttSeq(projectVO.getSeq());
							pcFile.setAttType("PROJECT");
							pcFile.setAttOrder(mbOrd);
							pcFile.setNewName(StringUtils.trimToEmpty(arrMbFileNm[mbOrd-1]));
							pcFile.setOrgName(StringUtils.trimToEmpty(arrMbFileNm[mbOrd-1]));
							pcFile.setPath(PROJECT_IMAGE_IMPORT_ROOT + StringUtils.trimToEmpty(projectVO.getMbImgPath()));
							pcFile.setType("MO");
							files.add(pcFile);

						}
					}

				} else if(lang.equals("EN")) {
					// ML 테이블 정보
					projectMlVO.setSeq(projectVO.getSeq());
					projectMlVO.setLang(lang);
					projectMlVO.setTitle(StringUtils.isEmpty(projectVO.getEnTitle()) ? projectVO.getKoTitle() + "(EN)" : projectVO.getEnTitle());
					projectMlVO.setSubTitle(projectVO.getEnSubTitle());
					projectMlVO.setCont(StringUtils.isEmpty(projectVO.getEnCont()) ? projectVO.getKoCont() + "(EN)" : projectVO.getEnCont());
					projectMlVO.setClient(StringUtils.isEmpty(projectVO.getEnClient()) ? projectVO.getKoClient() + "(EN)" : projectVO.getEnClient());
					mls.add(projectMlVO);

				} else if(lang.equals("ES")) {
					// ML 테이블 정보
					projectMlVO.setSeq(projectVO.getSeq());
					projectMlVO.setLang(lang);
					projectMlVO.setTitle(StringUtils.isEmpty(projectVO.getEsTitle()) ? projectVO.getKoTitle() + "(ES)" : projectVO.getEsTitle());
					projectMlVO.setSubTitle(projectVO.getEsSubTitle());
					projectMlVO.setCont(StringUtils.isEmpty(projectVO.getEsCont()) ? projectVO.getKoCont() + "(ES)" : projectVO.getEsCont());
					projectMlVO.setClient(StringUtils.isEmpty(projectVO.getEsClient()) ? projectVO.getKoClient() + "(ES)" : projectVO.getEsClient());
					mls.add(projectMlVO);
				}

			}

			// 마스터 테이블에 등록일자 업데이트
			if(!StringUtils.isEmpty(projectVO.getStrRegDt()) && projectVO.getRegDt() != null) {
				projectMapper.updateProject(projectVO);
			}

			// ML 테이블 등록
			map = Maps.newHashMap();
			map.put("list", mls);
			projectMapper.insertProjectMl(map);

			// 파일 등록
			map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}
	}

	/**
	 * 프로젝트 리스트 엑셀 템플릿으로 저장하기 위한 데이터 조회
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> exportProject(Map<String, Object> map) {
		map.put("DEL_DIR", PROJECT_IMAGE_IMPORT_ROOT);
		return adminManageMapper.getProjectListForExcelByLang(map);
	}
	
	/**
	 * 검증용 프로젝트 리스트 엑셀 템플릿으로 저장하기 위한 데이터 조회
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> exportProjectForCheck(Map<String, Object> map) {
		map.put("DEL_DIR", PROJECT_IMAGE_IMPORT_ROOT);
		return adminManageMapper.getProjectListForExcelForCheck(map);
	}

	/**
	 * 프로젝트 항목관리 값 변경. 한글명을 기준으로 code를 구한다.
	 * @param KoTypeText	타입 한글명
	 * @param typeCodeMap	키가 타입한글명이고 값이 코드인 map
	 * @return
	 */
	private String toCodeFromKoTypeText(String KoTypeText, Map<String, String> typeCodeMap) {
		String code = KoTypeText;
		if(!StringUtils.isEmpty(KoTypeText)) {
			if(typeCodeMap.get(KoTypeText) != null) {
				code = String.valueOf(typeCodeMap.get(KoTypeText));
			}
		}
		return code;
	}
}

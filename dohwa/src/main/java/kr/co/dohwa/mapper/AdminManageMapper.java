package kr.co.dohwa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 코드 관련 Mapper
 *
 * @author PARK
 *
 */
@Mapper
public interface AdminManageMapper {

	/**
	 * 메세지 프로퍼티 인서트
	 * @param map
	 */
	int insertMsgProp(Map<String, Object> map);
	
	/**
	 * 메세지 프로퍼티 인서트. 머지가 아닌 추가만 하고 싶은 경우
	 * @param map
	 */
	int insertMsgPropOnlyAdd(Map<String, Object> map);

	/**
	 * 코드별 메세지 프로퍼티 조회
	 * @param map
	 */
	List<Map<String, Object>> getMsgPropList(Map<String, Object> map);

	/**
	 *  메세지 프로퍼티 조회. 코드 기준으로  언어별 pivot 쿼리 형태로 조회
	 */
	List<Map<String, Object>> getMsgPropGrpCodeList();

	/**
	 * mysql 테이블 스키마 정보 조회
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getMysqlTableSchema(Map<String, Object> map);

	/**
	 * 프로젝트 이미지 리스트 조회.
	 * @return
	 */
	List<Map<String, Object>> getProjectImageListForExcel();

	/**
	 * 프로젝트 초기화 1. 다국어 테이블 삭제
	 * @return
	 */
	int resetProjectMl();
	/**
	 * 프로젝트 초기화 2. 마스터 테이블 삭제
	 * @return
	 */
	int resetProjectMast();
	/**
	 * 프로젝트 초기화 3. 파일 테이블 삭제. 이미지같은 경우 초기에는 FTP로 파일을 정해진 경로에 업로드 하므로 파일 자체를 삭제할 필요는 없음.
	 * @return
	 */
	int resetProjectFile();

	/**
	 * 엑셀로 언어벌 프로젝트 리스트 정보를 조회하기 위한 쿼리.
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getProjectListForExcelByLang(Map<String, Object> map);
	
	/**
	 * 엑셀로 검증용 프로젝트 리스트 정보를 조회하기 위한 쿼리.
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getProjectListForExcelForCheck(Map<String, Object> map);
	
	/**
	 * 엑셀로 프로젝트 이미지 리스트 정보를 조회하기 위한 쿼리.
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getProjectImageListForExcelByLang(Map<String, Object> map);

}
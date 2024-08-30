package kr.co.dohwa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.CodeVO;

/**
 * 코드 관련 Mapper
 *
 * @author PARK
 *
 */
@Mapper
public interface CodeMapper {

	/**
	 * 코드 리스트 조회
	 * @param codeVO
	 * @return
	 */
	List<CodeVO> getCodeList(CodeVO codeVO);

	/**
	 * 코드 insert merge
	 * @param map
	 */
	int insertMerge(Map<String, Object> map);

	/**
	 * 프로젝트 항목 조회
	 * @param map
	 */
	List<CodeVO> getProjectItemList();

}
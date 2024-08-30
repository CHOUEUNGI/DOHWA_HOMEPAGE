package kr.co.dohwa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.ProjectMlVO;
import kr.co.dohwa.vo.ProjectVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 프로젝트 관련 Mapper
 *
 * @author PARK
 *
 */
@Mapper
public interface ProjectMapper {

	/**
	 * 프로젝트 건수 조회
	 * @param projectVO
	 * @return
	 */
	int getProjectCnt(SearchVO searchVO);

	/**
	 * 프로젝트 건수 조회
	 * @param projectVO
	 * @return
	 */
	List<ProjectVO> getProjectList(SearchVO searchVO);

	/**
	 * 프로젝트 단건 조회
	 * @param projectVO
	 * @return
	 */
	ProjectVO getProject(ProjectVO projectVO);

	/**
	 * 프로젝트 다국어 리스 조회
	 * @param projectVO
	 * @return
	 */
	List<ProjectMlVO> getProjectMlList(ProjectMlVO projectMlVO);

	/**
	 * 프로젝트 등록
	 * @param projectVO
	 * @return
	 */
	int insertProject(ProjectVO projectVO);

	/**
	 * 프로젝트 다국어 등록
	 * @param projectMlVO
	 */
	int insertProjectMl(Map<String, Object> map);

	/**
	 * 프로젝트 변경
	 * @param projectVO
	 */
	int updateProject(ProjectVO projectVO);

	/**
	 * 프로젝트 다국어 삭제
	 */
	int deleteProjectMl(ProjectMlVO projectMlVO);

	/**
	 * 프로젝트 다중 삭제
	 * @param seqs
	 */
	int deleteProjectForeach(List<Integer> seqs);

	/**
	 * 프로젝트 다국어 다중 삭제
	 * @param seqs
	 */
	int deleteProjectMlForeach(List<Integer> seqs);

	/**
	 * 프로젝트 조회(홈페이지)
	 * @param searchVO
	 * @return
	 */
	int getProjectFrontCount(SearchVO searchVO);
	
	/**
	 * 프로젝트 조회(홈페이지)
	 * @param projectVO
	 * @return
	 */
	List<ProjectVO> getProjectFrontList(SearchVO searchVO);

	/**
	 * 프로젝트 상세(홈페이지)
	 * @param searchVO
	 * @return
	 */
	ProjectVO getProjectFront(SearchVO searchVO);

	/**
	 * 프로젝트 썸네일 리스트 조회(홈페이지)
	 * @param projectVO
	 * @return
	 */
	List<ProjectVO> getProjectThumList(SearchVO searchVO);

}
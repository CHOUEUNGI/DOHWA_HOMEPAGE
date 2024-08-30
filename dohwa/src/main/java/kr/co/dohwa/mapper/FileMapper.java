package kr.co.dohwa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.FileVO;

/**
 * 파일 관련 Mapper
 *
 * @author PARK
 *
 */
@Mapper
public interface FileMapper {

	/**
	 * 파일 단건 등록
	 * @param fileVO
	 * @return
	 */
	int insert(FileVO fileVO);

	/**
	 * 파일 리스트 등록
	 * @param map
	 * @return
	 */
	int insertForeach(Map<String, Object> map);

	/**
	 * 파일 리스트 등록
	 * @param files
	 * @return
	 */
	int insertForeachToList(List<FileVO> files);

	/**
	 * 파일 조회
	 * @param fileVO
	 * @return
	 */
	FileVO getFile(FileVO fileVO);

	/**
	 * 파일 리스트 조회
	 * @param fileVO
	 * @return
	 */
	List<FileVO> getFileList(FileVO fileVO);

	/**
	 * * 파일 리스트 조회
	 * 목록에서 checkbox로 row를 삭제할때 사용한다.
	 * @param paramMap
	 *	- seqs : 조회할 시퀀스
	 *	- attType : 조회할 프로그램 Type
	 * @return
	 */
	List<FileVO> getFileListByInSeq(Map<String, Object> paramMap);

	/**
	 * 파일 삭제(첨부 정보)
	 * ID로 삭제
	 * @param fileVO
	 * @return
	 */
	int deleteFileId(FileVO fileVO);

	/**
	 * 첨부된 상위 게시글 기준으로 파일 삭제
	 * @param fileVO
	 * @return
	 */
	int deleteFileAttSeqType(FileVO fileVO);

	/**
	 * 파일 수정(첨부 정보)
	 * People 관리에서 delete > insert 시 파일정보만 변경을 위해 사용한다.
	 * @param fileVO
	 * @return
	 */
	int update(FileVO fileVO);
	
	/**
	 * 파일 정보 변경
	 */
	int updateFileInfo(FileVO fileVO);
}
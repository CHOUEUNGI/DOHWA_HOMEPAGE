package kr.co.dohwa.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Alias("peopleVO")
@EqualsAndHashCode(callSuper=false)
public class PeopleVO extends CommonVO {

	/**
	 * 일련번호
	 */
	private int seq;
	
	/**
	 * 삭제할 일련번호
	 */
	private List<Integer> seqs;
	
	/**
	 * 순서 
	 */
	private String order;
	
	/**
	 * 공개여부 
	 */
	private String dispYn;
	
	/**
	 * 검색용 언어 코드
	 */
	private String lang = "KO";
	
	/**
	 * 이미지 파일 VO 
	 */
	private FileVO fileVO;
	
	/**
	 * file
	 */
	private MultipartFileVO multipartFileVO;
	
	/**
	 * People 다국어 VO 
	 */
	private PeopleMlVO peopleMlVO;
	
	/**
	 * People List
	 */
	private List<PeopleVO> peoples;
}

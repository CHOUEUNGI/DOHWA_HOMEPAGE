package kr.co.dohwa.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Alias("peopleMlVO")
@EqualsAndHashCode(callSuper=false)
public class PeopleMlVO extends CommonVO {

	/**
	 * People 일련번호
	 */
	private int peopleSeq;
	
	/**
	 * 언어코드 
	 */
	private String lang;
	
	/**
	 * 이름
	 */
	private String name;
	
	/**
	 * 직급
	 */
	private String staffLevel;
	
	/**
	 * 부서명
	 */
	private String partname;
	
	/**
	 * Interview
	 */
	private String interview;
}

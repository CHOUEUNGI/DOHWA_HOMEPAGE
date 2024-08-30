package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("invRefVO")
public class InvRefVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 페이지 구분
	 */
	private String pageType = "eAnno";
	/**
	 * 일련번호
	 */
	private int seq;
	/**
	 * 구분코드
	 */
	private String typeCode;
	/**
	 * 언어코드
	 */
	private String lang;
	/**
	 * 년도
	 */
	private String yyyy;
	/**
	 * 공개여부
	 */
	private String dispYn;
	/**
	 * 공개여부 한글명
	 */
	private String dispYnNm;
	/**
	 * 제목
	 */
	private String title;
	/**
	 * 파일경로
	 */
	private String filePath;
	/**
	 * 파일명
	 */
	private String fileNewName;
	/**
	 * 파일원본명
	 */
	private String fileOrgName;
	/**
	 * 파일알트값
	 */
	private String fileAlt;
	/**
	 * 파일 일련번호
	 */
	private String fileId;
	/**
	 * 파일 유효성 메시지
	 */
	private String message;
	/**
	 * 첨부파일
	 */
	private MultipartFile file;

	/**
	 * 발간일
	 */
	private String pblDt;

}

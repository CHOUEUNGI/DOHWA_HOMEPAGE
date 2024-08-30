package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("speakVO")
public class SpeakVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 페이지 구분
	 */
	private String pageType = "";

	/**
	 * 실명(N), 익명(Y)
	 */
	private String anonymous;
	/**
	 *
	 */
	private String id;
	/**
	 *
	 */
	private String agreeAt;
	/**
	 *
	 */
	private String name;
	/**
	 *
	 */
	private String mobile1;
	/**
	 *
	 */
	private String mobile2;
	/**
	 *
	 */
	private String mobile3;
	/**
	 *
	 */
	private String email1;
	/**
	 *
	 */
	private String email2;
	/**
	 *
	 */
	private String returnWay;
	/**
	 *
	 */
	private String password;
	/**
	 * 
	 */
	private String passwordConfirm;
	/**
	 * 제목
	 */
	private String title;
	/**
	 * 대상
	 */
	private String who;
	/**
	 * 일시
	 */
	private String wherewhen;
	/**
	 * 내용
	 */
	private String speakContent;
	/**
	 * 결과
	 */
	private String result;
	/**
	 *
	 */
	private String insertDate;
	/**
	 *
	 */
	private String updateDate;
	/**
	 *
	 */
	private String state;

	/**
	 * 첨부파일 리스트
	 */
	private MultipartFile[] file;

	/**
	 * 첨부파일 리스트
	 */
	private List<SpeakFileVO> speakFileList;

	private String message;

}

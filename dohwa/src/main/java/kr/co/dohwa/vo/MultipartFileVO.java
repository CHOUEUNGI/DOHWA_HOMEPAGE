package kr.co.dohwa.vo;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("multipartFileVO")
public class MultipartFileVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4708678759616604143L;
	/**
	 * req
	 */
	private HttpServletRequest request;
	/**
	 * 파일
	 */
	private MultipartFile file;
	/**
	 * 시퀀스
	 */
	private int seq;
	/**
	 * 파일 등록된 게시판 시퀀스
	 */
	private String attSeq;
	/**
	 * 파일 등록된 게시판 종류
	 */
	private String attType;
	/**
	 * 등록 순서
	 */
	private int attOrder;
	/**
	 * 파일 설명
	 */
	private String alt;
	/**
	 * Validator 메시지
	 */
	private String message;
	/**
	 * Validator 확장자
	 */
	private String fileExt;
	/**
	 *  파일유무 필수 여부
	 */
	private String checkRequiredFileYn = "Y";
}

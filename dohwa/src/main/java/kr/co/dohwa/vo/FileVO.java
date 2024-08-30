package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("fileVO")
public class FileVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3925029159856216084L;
	/**
	 * 파일 아이디
	 */
	private String id;
	/**
	 * 파일 등록된 게시판 시퀀스
	 */
	private Integer attSeq;
	/**
	 * 파일 등록된 게시판 종류
	 */
	private String attType;
	/**
	 * 등록 순서
	 */
	private int attOrder;
	/**
	 * 원본 파일명
	 */
	private String orgName;
	/**
	 * 서버 파일명
	 */
	private String newName;
	/**
	 * 저장 경로
	 */
	private String path;
	/**
	 * 파일 설명
	 */
	private String alt;
	/**
	 * 타입
	 */
	private String type;
	/**
	 * 언어코드
	 */
	private String lang;
	/**
	 * 비고1
	 */
	private String etc1;
	/**
	 * 비고2
	 */
	private String etc2;
	/**
	 * 비고3
	 */
	private String etc3;
	/**
	 * 에디터 용(토큰)
	 */
	private String ckToken;
	/**
	 * Validator 메시지
	 */
	private String fileMessage;
}

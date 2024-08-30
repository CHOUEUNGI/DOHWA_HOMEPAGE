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
@Alias("custInqrVO")
public class CustInqrVO extends CommonVO implements Serializable {

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
	 * 제목
	 */
	private String title;

	/**
	 * 내용
	 */
	private String cont;
	/**
	 * 이메일
	 */
	private String email;
	/**
	 * 이메일 도메인
	 */
	private String emailDomain;
	/**
	 * 연락처
	 */
	private String tel;
	/**
	 * 연락처1
	 */
	private String tel1;
	/**
	 * 연락처2
	 */
	private String tel2;
	/**
	 * 연락처3
	 */
	private String tel3;
	/**
	 * 질문자 이름
	 */
	private String regNm;
	/**
	 * 답변내용
	 */
	private String answ;
	/**
	 * 답변여부
	 */
	private String answYn;
	/**
	 * 답변이메일발송여부
	 */
	private String answEmailSendYn;
	/**
	 * 답변자 IP
	 */
	private String updIp;

	/**
	 * 파일 유효성 메시지
	 */
	private String message;
	/**
	 * 첨부파일
	 */
	private MultipartFile file;

	/**
	 * 파일 원본명
	 */
	private String fileOrgName;
	/**
	 * 파일 ID
	 */
	private String fileId;

	/**
	 * 개인정보 수집 및 이용에 대한 안내 약관 동의 여부
	 */
	private String prvtTermsAgree;

	/**
	 * 개인정보 제3자 제공에 대한 안내 약관 동의 여부
	 */
	private String cptpTermsAgree;
	
	/**
	 * 문의사항 등록시 언어셋
	 */
	private String lang;

}

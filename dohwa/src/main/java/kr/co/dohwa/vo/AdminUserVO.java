package kr.co.dohwa.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("adminUserVO")
public class AdminUserVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1586447354562845044L;
	/**
	 * 아이디
	 */
	private String id;
	/**
	 * 이름
	 */
	private String name;
	/**
	 * 비밀번호
	 */
	private String pswd;
	/**
	 * 변경 비밀번호
	 */
	private String updPswd;
	/**
	 * 변경 비밀번호 확인
	 */
	private String updPswdRe;
	/**
	 * 이메일
	 */
	private String email;
	/**
	 * 부서
	 */
	private String dept;
	/**
	 * 로그인일
	 */
	private LocalDateTime loginDt;
	/**
	 * 만료일
	 */
	private LocalDateTime expireDt;
	/**
	 * 비밀번호 변경일
	 */
	private LocalDateTime pswdUpdDt;
	/**
	 * 잠김 여부
	 */
	private String lockYn;
	/**
	 * 사용 여부
	 */
	private String useYn;
	/**
	 * 임시 비밀번호 사용 여부
	 */
	private String tempPswdYn;
	/**
	 * 비밀번호 실패 건 수
	 */
	private int pswdFailCount;
	/**
	 * 로그인 아이피
	 */
	private String loginIp;
	/**
	 * 생성일
	 */
	private LocalDateTime regDt;
	/**
	 * 생성 아이디
	 */
	private String regId;
	/**
	 * 변경일
	 */
	private LocalDateTime updDt;
	/**
	 * 변경 아이디
	 */
	private String updId;
}

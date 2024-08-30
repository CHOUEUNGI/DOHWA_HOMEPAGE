package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("fileEditorVO")
public class FileEditorVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6215798269328676011L;
	/**
	 * 에디터 Func Name
	 */
	private String ckCsrfToken;
	/**
	 * 업로드 파일
	 */
	private MultipartFile upload;
	/**
	 * 서버 파일명
	 */
	private String newFilename;
	/**
	 * 서버 이미지 경로
	 */
	private String imageUrl;
	/**
	 * 메시지
	 */
	private String message;
}

package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Alias("pressVO")
public class PressVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5189073947445811019L;

	/**
	 * 일련번호
	 */
	private int seq; 

	/**
	 * 등록일자
	 */
	private String writeDt;
	
	private String searchText;
	
	@JsonIgnore
	private String Title;

	@JsonIgnore
	private String TitleMo;

	
	@JsonIgnore
	private String Cont;

	private String dispYn;

	/**
	 * 서버 파일명
	 */
	private String newName;
	/**
	 * 저장 경로
	 */
	private String path;
	
	/**
	 * PC 파일 
	 */
	private FileVO pcFile;
	
	/**
	 * MO 파일 
	 */
	private FileVO moFile;
	
	private String mainFileName1;

	private String mainFileName2;
	
	/**
	 * PC File Message
	 */
	private String pcMessage;
	
	/**
	 * MO File Message 
	 */
	private String moMessage;
	
	/**
	 * MultipartFile 
	 */
	private MultipartFileVO multipartFileVO;
	
	/**
	 * 파일 조회용 Method.
	 * FileVO 목록을 받아 pcFile, moFile 을 설정한다.
	 * 
	 * @param fileList
	 */
	public void setFiles(List<FileVO> fileList) {
		
		fileList.forEach(file -> {
			if ( "PC".equals(file.getType()) )		this.pcFile = file;
			else if ( "MO".equals(file.getType()) ) this.moFile = file;
		});
	}
	
	/**
	 * 이전, 이후(홈페이지 용)
	 */
	@JsonIgnore
	private String btnNm;
}

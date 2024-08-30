package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Alias("licenseVO")
@EqualsAndHashCode(callSuper=false)
public class LicenseVO extends CommonVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5189073947445811019L;

	/**
	 * 일련번호
	 */
	private int seq;
	
	/**
	 * 공개여부 
	 */
	private String dispYn;
	
	/**
	 * 제목 (국문,영문,스페인어)
	 */
	private String koTitle;
	private String enTitle;
	private String esTitle;
	
	/**
	 * 취득일자
	 */
	private String acquireDt;
	
	/**
	 * 발급기관 (국문,영문,스페인어)
	 */
	private String koIssueAgency;
	private String enIssueAgency;
	private String esIssueAgency;
	
	/**
	 * PC 파일 (국문)
	 */
	private FileVO pcFile;
	
	/**
	 * MO 파일 (국문) 
	 */
	private FileVO moFile;
	
	/**
	 * PC 파일 (영문)
	 */
	private String pcFileEn;
	
	/**
	 * PC 파일 (영문)
	 */
	private String pcFileEnId;
	
	
	/**
	 * MO 파일 (영문)
	 */
	private String moFileEn;
	
	/**
	 * MO 파일 (영문)
	 */
	private String moFileEnId;
	
	
	/**
	 * PC 파일 (스페인)
	 */
	private String pcFileEs;
	
	/**
	 * MO 파일 (스페인)
	 */
	private String moFileEs;
	
	/**
	 * PC 파일 (스페인)
	 */
	private String pcFileEsId;
	
	/**
	 * MO 파일 (스페인)
	 */
	private String moFileEsId;
	

	
	private String pcFileEnPath;
	private String pcFileEnNewName;
	private String moFileEnPath;
	private String moFileEnNewName;
	
	private String pcFileEsPath;
	private String pcFileEsNewName;
	private String moFileEsPath;
	private String moFileEsNewName;	
	
	
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
}

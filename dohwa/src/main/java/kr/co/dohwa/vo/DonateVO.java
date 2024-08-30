package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Alias("donateVO")
@EqualsAndHashCode(callSuper=false)
public class DonateVO extends CommonVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5189073947445811019L;

	/**
	 * 일련번호
	 */
	private int seq;
	
	/**
	 * 구분코드
	 */
	@JsonIgnore
	private String typeCode = "01";
	
	/**
	 * 공개여부 
	 */
	private String dispYn;
	
	private String typeCd;
	
	/**
	 * 제목 (국문,영문,스페인어)
	 */
	private String koTitle;
	private String enTitle;
	private String esTitle;
	
	private String koTitleMo;
	private String enTitleMo;
	private String esTitleMo;
	
	/**
	 * 등록일자
	 */
	private String writeDt;
	private String writeDtEn;
	
	/**
	 * 내용 (국문,영문,스페인어)
	 */
	private String koCont;
	private String enCont;
	private String esCont;
	
	@JsonIgnore
	private List<FileVO> files;

	@JsonIgnore
	private MultipartFile file;

	@JsonIgnore
	private List<String> fileOrders;

	@JsonIgnore
	private String message;

	@JsonIgnore
	private String strRegDt;

	@JsonIgnore
	private MultipartFile main_file_1;

	@JsonIgnore
	private MultipartFile main_file_2;

	private String mainFileName1;

	private String mainFileName2;

	@JsonIgnore
	private String mainFileId1;

	@JsonIgnore
	private String mainFileId2;

	@JsonProperty("image")
	private String filePath;

	
	/**
	 * MultipartFile 
	 */
	private MultipartFileVO multipartFileVO;
	
}

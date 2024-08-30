package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Alias("boardVO")
@EqualsAndHashCode(callSuper=false)
public class BoardVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3744357337319889824L;
	
	/**
	 * 일련번호
	 */
	private int seq; 
	
	/**
	 * 언어코드 
	 */
	private String lang = "KO"; 
	
	/**
	 * 구분코드
	 */
	@JsonIgnore
	private String typeCode = "01";
	
	/**
	 * 구분코드
	 */
	private String typeCd;
	
	/**
	 * 제목 
	 */
	private String title;
	
	/**
	 * 등록일자
	 */
	private String createDt;
	
	/**
	 * 설명 
	 */
	@JsonIgnore
	private String cont;
	
	/**
	 * 출처 
	 */
	private String refr; 
	
	/**
	 * URL 
	 */
	private String url;
	
	/**
	 * 공개여부 
	 */
	@JsonIgnore
	private String dispYn;
	
	/**
	 * 메인노출여부
	 */
	@JsonIgnore
	private String mainYn;
	
	/**
	 * 메인노출시작일
	 */
	@JsonIgnore
	private String mainDispSdt;
	
	/**
	 * 메인노출종료일
	 */
	@JsonIgnore
	private String mainDispEdt; 
	
	/**
	 * 메인노출일 Message 
	 */
	@JsonIgnore
	private String mainDispMessage;
	
	/**
	 * PC 이미지 Message
	 */
	@JsonIgnore
	private String pcMessage;
	
	/**
	 * Mobile 이미지 Message
	 */
	@JsonIgnore
	private String moMessage;

	/**
	 * PC 파일 목록
	 */
	@JsonIgnore
	private List<FileVO> pcFileList;
	
	/**
	 * MO 파일 목록
	 */
	@JsonIgnore
	private List<FileVO> moFileList;
	
	/**
	 * MultipartFile 
	 */
	@JsonIgnore
	private MultipartFileVO multipartFileVO;
	
	/**
	 * 파일 조회용 Method.
	 * FileVO 목록을 받아 pcFileList, moFileList 를 설정한다.
	 * 
	 * @param fileList
	 */
	@JsonIgnore
	public void setFiles(List<FileVO> fileList) {
		
		this.pcFileList = fileList.stream()
							.filter(file -> "PC".equals(file.getType()))
							.collect(Collectors.toList());
		
		this.moFileList = fileList.stream()
							.filter(file -> "MO".equals(file.getType()))
							.collect(Collectors.toList());
	}
	
	@JsonIgnore
	private Integer idx;
	
	/**
	 * 이전, 이후(홈페이지 용)
	 */
	@JsonIgnore
	private String btnNm;
	
	private String strRegDt;
}

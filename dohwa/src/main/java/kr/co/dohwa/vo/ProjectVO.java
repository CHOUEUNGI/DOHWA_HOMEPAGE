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
@EqualsAndHashCode(callSuper = false)
@Alias("projectVO")
public class ProjectVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8290038472156054280L;

	private Integer seq;

	@JsonIgnore
	private String type1;

	@JsonIgnore
	private String type2;

	@JsonIgnore
	private String type3;

	@JsonIgnore
	private String type4;

	@JsonIgnore
	private String type5;

	@JsonIgnore
	private String year;

	@JsonIgnore
	private String koTitle;

	@JsonIgnore
	private String koSubTitle;

	@JsonIgnore
	private String koCont;

	@JsonIgnore
	private String koClient;

	@JsonIgnore
	private String enTitle;

	@JsonIgnore
	private String enSubTitle;

	@JsonIgnore
	private String enCont;

	@JsonIgnore
	private String enClient;

	@JsonIgnore
	private String esTitle;

	@JsonIgnore
	private String esSubTitle;

	@JsonIgnore
	private String esCont;

	@JsonIgnore
	private String esClient;

	private String dispYn;

	@JsonProperty("ml")
	private ProjectMlVO projectMlVO;

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
	 *	엑셀 임포트용으로 추가한 변수.
	 */
	@JsonIgnore
	private String pcImgNm;

	@JsonIgnore
	private String mbImgNm;

	@JsonIgnore
	private String pcImgPath;

	@JsonIgnore
	private String mbImgPath;

	@JsonIgnore
	private String saeopCode;

}

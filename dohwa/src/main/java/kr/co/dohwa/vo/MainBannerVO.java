package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Alias("mainBannerVO")
public class MainBannerVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5297682815537584156L;
	
	private Integer seq;
	
	private String bannerType;
	
	private Integer bannerOrder;
	
	private Integer typeOrder;
	
	private int fileOrder;
	
	private String fileName;
	
	private String dispYn;
	
	private String koWebTitle;
	
	private String koWebSubTitle;
	
	private String koWebUrl;
	
	private String enWebTitle;
	
	private String enWebSubTitle;
	
	private String enWebUrl;
	
	private String esWebTitle;
	
	private String esWebSubTitle;
	
	private String esWebUrl;
	
	private String koMoTitle;
	
	private String koMoSubTitle;
	
	private String koMoUrl;
	
	private String enMoTitle;
	
	private String enMoSubTitle;
	
	private String enMoUrl;
	
	private String esMoTitle;
	
	private String esMoSubTitle;
	
	private String esMoUrl;
	
	private String koLinkBtnName;
	
	private String enLinkBtnName;
	
	private String esLinkBtnName;
	
	
	private MultipartFile pc_file_1_ko;
	
	private MultipartFile pc_file_2_en;
	
	private MultipartFile pc_file_3_es;
	
	private MultipartFile mo_file_1_ko;
	
	private MultipartFile mo_file_2_en;
	
	private MultipartFile mo_file_3_es;
	
	private String pcFileName1;
	
	private String pcFileName2;
	
	private String pcFileName3;
	
	private String moFileName1;
	
	private String moFileName2;
	
	private String moFileName3;
	
	private String imgName;
	
	private MainBannerMlVO mainBannerMlVO;
	
	private List<FileVO> files;
}

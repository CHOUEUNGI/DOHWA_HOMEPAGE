package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mainBannerMlVO")
public class MainBannerMlVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4382571986264686738L;

	private Integer seq;
	
	private String lang;
	
	private String webTitle;
	
	private String webSubTitle;
	
	private String webUrl;
	
	private String moTitle;
	
	private String moSubTitle;
	
	private String moUrl;
	
	private String linkBtnName;
}

package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Alias("adminUserLogVO")
public class AdminUserLogVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7302829132180065713L;

	private Integer seq;
	
	private String action;
	
	private String menuNm;
	
	private String url;
	
	private String ip;
	
	private String param;
}

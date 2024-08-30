package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Alias("codeVO")
public class CodeVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3031504716396743851L;
	
	private Integer seq;
	
	private String code;
	
	private String parentCode;
	
	private String value;
	
	private String koText;
	
	private String enText;
	
	private String esText;
	
	private int order;
	
	private String useYn;
	
	private String etc1;
	
	private String etc2;
	
	private String etc3;
	
	private String etc4;
	
	private String etc5;
}

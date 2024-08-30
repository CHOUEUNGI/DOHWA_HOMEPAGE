package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Alias("projectMlVO")
public class ProjectMlVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7916509686975271963L;
	
	@JsonIgnore
	private int seq;
	
	@JsonIgnore
	private String lang;
	
	private String title;
	
	@JsonIgnore
	private String subTitle;
	
	@JsonIgnore
	private String cont;
	
	@JsonIgnore
	private String client;
}

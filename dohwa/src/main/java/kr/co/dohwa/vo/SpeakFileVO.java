package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("speakFileVO")
public class SpeakFileVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String filename;
	private String uploadDate;
	private String uploadFilePath;

}

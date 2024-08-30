package kr.co.dohwa.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Alias("mainPopupVO")
public class MainPopupVO extends CommonVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6239919658473285100L;

	private Integer seq;

	private String lang;

	private String title;

	private String strDispStDt;

	private String strDispEdDt;

	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime dispStDt;

	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime dispEdDt;

	private String dispYn;

	private String pcLinkUrl;

	private String pcLinkYn;

	private String moLinkUrl;

	private String moLinkYn;

	private String linkBtnNm;

	private MultipartFile pc_file_1;

	private MultipartFile mo_file_1;

	private String pcFileName;

	private String moFileName;

	private List<FileVO> files;

	private String newName;

	private String path;
}

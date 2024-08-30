package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("stockMeetVO")
public class StockMeetVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 일련번호
	 */
	private int seq;
	/**
	 * 마스터 일련번호
	 */
	private int stockMastSeq;
	/**
	 * 의안내용
	 */
	private String agnd;
	/**
	 * 결의내용
	 */
	private String rslt;
	/**
	 * 노출순서
	 */
	private String dispOrd;

}

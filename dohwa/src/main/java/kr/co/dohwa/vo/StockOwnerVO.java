package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("stockOwnerVO")
public class StockOwnerVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int seq;
	private int stockMastSeq;
	private String name;
	private String showCnt;
	private String showRatio;
	private String dispOrd;

}

package kr.co.dohwa.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("financeVO")
public class FinanceVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 년도
	 */
	private String yyyy;
	/**
	 * 공개여부
	 */
	private String dispYn;
	/**
	 * 공개여부 명
	 */
	private String dispYnNm;
	/**
	 * 매출액
	 */
	private Long salesAmt;
	/**
	 * 영업이익
	 */
	private Long oprtIncmAmt;
	/**
	 * 신규수주
	 */
	private Long newOrdrAmt;
	/**
	 * 수주잔고
	 */
	private Long ordrBcklAmt;
	/**
	 * 기타금액
	 */
	private Long etcAmt1;
	/**
	 * 기타금액
	 */
	private Long etcAmt2;
	/**
	 * 기타금액
	 */
	private Long etcAmt3;
	/**
	 * 영업수익
	 */
	private Long oprtRvnsAmt;
	/**
	 * 영업비용
	 */
	private Long oprtAmt;
	/**
	 * 법인세비용 차감전순이익
	 */
	private Long incmBftxExpnAmt;
	/**
	 * 당기순이익
	 */
	private Long netIncmAmt;
	/**
	 * 유동자산
	 */
	private Long currAsstAmt;
	/**
	 * 비유동자산(억원)
	 */
	private Long nonCurrAsstAmt;
	/**
	 * 자산총계
	 */
	private Long totAsstAmt;
	/**
	 * 유동부채
	 */
	private Long currLbltAmt;
	/**
	 *비유동부채
	 */
	private Long nonCurrLbltAmt;
	/**
	 * 부채총계
	 */
	private Long totLbltAmt;
	/**
	 * 자본총계
	 */
	private Long totCptlAmt;
	/**
	 * ROE
	 */
	private Double roe;
	/**
	 * PER
	 */
	private Double per;
	/**
	 * PBR
	 */
	private Double pbr;
	/**
	 * 영업이익률
	 */
	private Double oprtMrgn;
	/**
	 * 페이지 구분
	 */
	private String pageType = "main";

}

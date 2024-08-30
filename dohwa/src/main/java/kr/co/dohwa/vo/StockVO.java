package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@Alias("stockVO")
public class StockVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 일련번호
	 */
	private int seq;
	/**
	 * 구분코드
	 */
	private String typeCode;
	/**
	 * 언어
	 */
	private String lang;
	/**
	 * 구분(연도)
	 */
	private String yyyy;
	/**
	 * 공개여부
	 */
	private String dispYn;
	/**
	 * 공개여부 명칭
	 */
	private String dispYnNm;
	/**
	 * 제목
	 */
	private String title;
	/**
	 * 최대주주/특수관계인
	 */
	private String lgshRatio;
	/**
	 * 기타주주
	 */
	private String otshRatio;
	/**
	 * 주요주주(10%)/1인
	 */
	private String mjshRatio;
	/**
	 * 자기주식
	 */
	private String trshRatio;
	/**
	 * 우리주식
	 */
	private String orshRatio;
	/**
	 *주당액면가액
	 */
	private String pvpsAmt;
	/**
	 *당기순이익
	 */
	private String nticAmt;
	/**
	 *주당순이익
	 */
	private String ntpsAmt;
	/**
	 *현금배당금총액
	 */
	private String tcdvAmt;
	/**
	 *현금배당성향
	 */
	private String cdpoRatio;
	/**
	 *현금배당수익률
	 */
	private String cdpoRate;
	/**
	 *주당 현금배당금
	 */
	private String cdpsAmt;
	/**
	 *기준일
	 */
	private String stdDate;
	/**
	 * 주주총회일시
	 */
	private String meetDate;
	/**
	 *주주총회장소
	 */
	private String meetPlace;
	/**
	 * 주주 구성 리스트
	 */
	private List<StockOwnerVO> stockOwnerList;
	/**
	 * 주주총회 안건 리스트
	 */
	private List<StockMeetVO> stockMeetList;

	/**
	 * 주식소유현황 기준일
	 */
	private String ownStdDate;
	/**
	 * 파일 유효성 검증
	 */
	private String message;

	/**
	 * 원본파일명
	 */
	private String fileOrgName;

	/**
	 * 파일 ID
	 */
	private String fileId;

	/**
	 * 첨부파일
	 */
	private MultipartFile file;

}

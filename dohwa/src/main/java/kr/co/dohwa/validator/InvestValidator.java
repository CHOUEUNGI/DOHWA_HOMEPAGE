package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.service.InvestService;
import kr.co.dohwa.util.ValidationUtil;
import kr.co.dohwa.vo.FinanceVO;
import kr.co.dohwa.vo.InvRefVO;
import kr.co.dohwa.vo.StockMeetVO;
import kr.co.dohwa.vo.StockOwnerVO;
import kr.co.dohwa.vo.StockVO;

/**
 * 투자정보 관리 Validator
 *
 * @author PARK
 *
 */
@Component
public class InvestValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private ValidationUtil validationUtil;

	@Override
	public boolean supports(Class<?> clazz) {
		return InvestService.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		if(target instanceof FinanceVO) {
			FinanceVO financeVO = (FinanceVO) target;

			validationUtil.checkOnlyNumber(financeVO.getYyyy(), 4, errors, "yyyy", new String[] { "구분(연도)", "4" });

			if("main".equalsIgnoreCase(financeVO.getPageType())) {
				validationUtil.checkOnlyNumber(financeVO.getSalesAmt(), 0, errors, "salesAmt", new String[] { "매출액(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getOprtIncmAmt(), 0, errors, "oprtIncmAmt", new String[] { "영업이익(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getNewOrdrAmt(), 0, errors, "newOrdrAmt", new String[] { "신규수주(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getOrdrBcklAmt(), 0, errors, "ordrBcklAmt", new String[] { "수주잔고(억원)" });

			} else {
				validationUtil.checkOnlyNumber(financeVO.getOprtRvnsAmt(), 0, errors, "oprtRvnsAmt", new String[] { "영업수익(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getOprtIncmAmt(), 0, errors, "oprtIncmAmt", new String[] { "영업이익(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getOprtAmt(), 0, errors, "oprtAmt" ,new String[] { "영업비용(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getIncmBftxExpnAmt(), 0, errors, "incmBftxExpnAmt",new String[] { "법인세비용 차감전순이익(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getNetIncmAmt(), 0, errors, "netIncmAmt",new String[] { "당기순이익(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getCurrAsstAmt(), 0, errors, "currAsstAmt", new String[] { "유동자산(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getNonCurrAsstAmt(), 0, errors, "nonCurrAsstAmt", new String[] { "비유동자산(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getTotAsstAmt(), 0, errors, "totAsstAmt", new String[] { "자산총계(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getCurrLbltAmt(), 0, errors, "currLbltAmt", new String[] { "유동부채(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getNonCurrLbltAmt(), 0, errors, "nonCurrLbltAmt", new String[] { "비유동부채(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getTotLbltAmt(), 0, errors, "totLbltAmt", new String[] { "부채총계(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getTotCptlAmt(), 0, errors, "totCptlAmt", new String[] { "자본총계(억원)" });
				validationUtil.checkOnlyNumber(financeVO.getRoe(), 0, errors, "roe", new String[] { "ROE" });
				validationUtil.checkOnlyNumber(financeVO.getPer(), 0, errors, "per", new String[] { "PER" });
				validationUtil.checkOnlyNumber(financeVO.getPbr(), 0, errors, "pbr", new String[] { "PBR" });
				validationUtil.checkOnlyNumber(financeVO.getOprtMrgn(), 0, errors, "oprtMrgn", new String[] { "영업이익률" });
			}

		} else if(target instanceof InvRefVO) {
			InvRefVO invRefVO = (InvRefVO) target;

			// 첨부파일 유효성 검증
			if(!StringUtils.isEmpty(invRefVO.getMessage())) {
				errors.rejectValue("file", "error.file", invRefVO.getMessage());
			}

			// 입력값 유효성 검증
			validationUtil.checkNotEmpty(invRefVO.getLang(), errors, "lang", new String[] { "영업수익(억원)" });
			if(!"INV_REF_ANAR".equals(invRefVO.getTypeCode())) {
				validationUtil.checkOnlyNumber(invRefVO.getYyyy(), 4, errors, "yyyy", new String[] { "구분(연도)", "4" });
			} else {
				validationUtil.checkNotEmpty(invRefVO.getPblDt(), errors, "pblDt", new String[] { "발간일" });
			}

			validationUtil.checkNotEmpty(invRefVO.getDispYn(), errors, "dispYn", new String[] { "공개여부" });
			validationUtil.checkNotEmpty(invRefVO.getTitle(), errors, "title", new String[] { "제목" });

		} else if(target instanceof StockVO) {
			StockVO stockVO = (StockVO) target;

			validationUtil.checkOnlyNumber(stockVO.getYyyy(), 4, errors, "yyyy", new String[] { "구분(연도)", "4" });

			// 마스터 + 주식소유현황
			if("STOCK_SHCP".equals(stockVO.getTypeCode())) {
				validationUtil.checkNotEmpty(stockVO.getStdDate(), errors, "stdDate", new String[] { "기준일" });
				validationUtil.checkOnlyNumberLimit(stockVO.getLgshRatio(), 100, errors, "lgshRatio", new String[] { "최대주주/특수관계인", "100" });
				validationUtil.checkOnlyNumberLimit(stockVO.getOtshRatio(), 100, errors, "otshRatio", new String[] { "기타주주", "100" });
				validationUtil.checkOnlyNumberLimit(stockVO.getMjshRatio(), 100, errors, "mjshRatio", new String[] { "주요주주(10%)/1인", "100" });
				validationUtil.checkOnlyNumberLimit(stockVO.getTrshRatio(), 100, errors, "trshRatio", new String[] { "자기주식", "100" });
				validationUtil.checkOnlyNumberLimit(stockVO.getOrshRatio(), 100, errors, "orshRatio", new String[] { "우리주식", "100" });
				validationUtil.checkNotEmpty(stockVO.getOwnStdDate(), errors, "ownStdDate", new String[] { "기준일" });
				if(stockVO.getStockOwnerList() == null || stockVO.getStockOwnerList().isEmpty()) {
					errors.rejectValue("stockOwnerList", "error.stockOwnerList", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] {"주식소유 현황"}, Locale.KOREA));
				} else {
					StockOwnerVO stockOwnerVO  = null;
					int emptyCnt = 0;
					for(int i = 0; i < stockVO.getStockOwnerList().size(); i++) {
						stockOwnerVO = stockVO.getStockOwnerList().get(i);
						if(StringUtils.isEmpty(stockOwnerVO.getName()) && StringUtils.isEmpty(stockOwnerVO.getShowCnt()) && StringUtils.isEmpty(stockOwnerVO.getShowRatio())) {
							emptyCnt++;
							continue;
						}
						validationUtil.checkNotEmpty(stockOwnerVO.getName(), errors, "stockOwnerList["+i+"].name", new String[] { "성명" });
						validationUtil.checkNotEmpty(stockOwnerVO.getShowCnt(), errors, "stockOwnerList["+i+"].showCnt", new String[] { "소유주식주" });
						validationUtil.checkOnlyNumberLimit(stockOwnerVO.getShowRatio(), 100, errors, "stockOwnerList["+i+"].showRatio", new String[] { "지분율", "100" });

					}
					// 모든 변수값이 없는 vo의 갯수가 전체 리스트의 갯수와 같다면 하나도 입력안 안했으니...
					if(emptyCnt == stockVO.getStockOwnerList().size()) {
						errors.rejectValue("stockOwnerList", "error.stockOwnerList", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] {"주식소유 현황"}, Locale.KOREA));
					}
				}

			} else if("STOCK_SHMT".equals(stockVO.getTypeCode())) {	//주주총회 + 총회안건

				validationUtil.checkNotEmpty(stockVO.getTitle(), errors, "title", new String[] { "제목" });
				validationUtil.checkNotEmpty(stockVO.getMeetDate(), errors, "meetDate", new String[] { "주주총회 일시" });
				validationUtil.checkNotEmpty(stockVO.getMeetPlace(), errors, "meetPlace", new String[] { "주주총회 장소" });

				// 총회안건
				if(stockVO.getStockMeetList() == null || stockVO.getStockMeetList().isEmpty()) {
					errors.rejectValue("stockMeetList", "error.stockMeetList", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] {"주주총회 안건 리스트"}, Locale.KOREA));
				} else {
					StockMeetVO stockMeetVO  = null;
					int emptyCnt = 0;
					for(int i = 0; i < stockVO.getStockMeetList().size(); i++) {
						stockMeetVO = stockVO.getStockMeetList().get(i);
						if(StringUtils.isEmpty(stockMeetVO.getAgnd()) && StringUtils.isEmpty(stockMeetVO.getRslt())) {
							emptyCnt++;
							continue;
						}
						validationUtil.checkNotEmpty(stockMeetVO.getAgnd(), errors, "stockMeetList["+i+"].agnd", new String[] { "의안내용" });
						validationUtil.checkNotEmpty(stockMeetVO.getRslt(), errors, "stockMeetList["+i+"].rslt", new String[] { "결의내용" });

					}
					// 모든 변수값이 없는 vo의 갯수가 전체 리스트의 갯수와 같다면 하나도 입력안 안했으니...
					if(emptyCnt == stockVO.getStockMeetList().size()) {
						errors.rejectValue("stockMeetList", "error.stockMeetList", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] {"주주총회 안건 리스트"}, Locale.KOREA));
					}
				}

				// 첨부파일 유효성 검증
				if(!StringUtils.isEmpty(stockVO.getMessage())) {
					errors.rejectValue("file", "error.file", stockVO.getMessage());
				}


			} else if("STOCK_DVST".equals(stockVO.getTypeCode())) {	//배당현황
				validationUtil.checkOnlyNumber(stockVO.getPvpsAmt(), 0, errors, "pvpsAmt", new String[] { "주당액면가액(원)" });
				validationUtil.checkOnlyNumber(stockVO.getNticAmt(), 0, errors, "nticAmt", new String[] { "당기순이익 (백만원)" });
				validationUtil.checkOnlyNumber(stockVO.getNtpsAmt(), 0, errors, "ntpsAmt", new String[] { "주당순이익 (원)" });
				validationUtil.checkOnlyNumber(stockVO.getTcdvAmt(), 0, errors, "tcdvAmt", new String[] { "현금배당금총액 (백만원)" });
				validationUtil.checkOnlyNumber(stockVO.getCdpoRatio(), 0, errors, "cdpoRatio", new String[] { "현금배당성향 (%)" });
				validationUtil.checkOnlyNumber(stockVO.getCdpoRate(), 0, errors, "cdpoRate", new String[] { "현금배당수익률 (%)" });
				validationUtil.checkOnlyNumber(stockVO.getCdpsAmt(), 0, errors, "cdpsAmt", new String[] { "주당 현금배당금 (원)" });
			}

		}

	}

}

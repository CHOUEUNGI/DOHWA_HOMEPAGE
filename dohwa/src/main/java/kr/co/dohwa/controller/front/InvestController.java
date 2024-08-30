package kr.co.dohwa.controller.front;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.google.gson.Gson;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.constants.PathType;
import kr.co.dohwa.service.InvestService;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.vo.FinanceVO;
import kr.co.dohwa.vo.SearchVO;
import kr.co.dohwa.vo.StockVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 투자정보 관련
 *
 * @author PARK
 *
 */
@Slf4j
@Controller
@RequestMapping({"invest", Constant.MOBILE_START_PATH+"invest"})
public class InvestController extends BaseController {

	@Autowired
	InvestService investService;

	@Value("#{config['file.upload-refer-ext']}")
	private String FILE_UPLOAD_REFER_EXT;

	/**
	 * 투자정보 > 재무정보
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/finance"})
	public String finance(HttpServletRequest request, Model model) {
		SearchVO searchVO = new SearchVO();
		// 주요 경영실적
		searchVO.setOffsetStartNumber(0);
		searchVO.setRowPerPage(3);
		searchVO.setDispYn("Y");
		List<FinanceVO> list = investService.getFinanceMainList(searchVO);
		model.addAttribute("listJson", (new Gson()).toJson(list));

		// 요약 재무제표
		searchVO.setOffsetStartNumber(0);
		searchVO.setRowPerPage(3);
		searchVO.setDispYn("Y");
		List<FinanceVO> summaryList = investService.getFinanceSummaryList(searchVO);
		if(summaryList != null && !summaryList.isEmpty()) {
			model.addAttribute("summaryListJson", (new Gson()).toJson(summaryList));
			model.addAttribute("lastVO", summaryList.get(0));
			model.addAttribute("secondVO", summaryList.size() > 1 ? summaryList.get(1) : new FinanceVO());
			model.addAttribute("firstVO", summaryList.size() > 2 ? summaryList.get(2) : new FinanceVO());
		}

		return frontViewPath() + "/finance";
	}

	/**
	 * 투자정보 > 재무 정보
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/eAnno"})
	public String eanno(HttpServletRequest request, Model model) {
		return frontViewPath() + "/eAnno";
	}

	/**
	 * 투자정보 > ir 자료실
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/ir"})
	public String ir(HttpServletRequest request, Model model) {
		return frontViewPath() + "/ir";
	}

	/**
	 * 투자정보 > 주식 및 주주 정보
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping({"/stock"})
	public String stock(HttpServletRequest request, Model model, Locale locale) {

		SearchVO searchVO = new SearchVO();
		// 주주구성
		searchVO.setOffsetStartNumber(0);
		searchVO.setRowPerPage(1);
		searchVO.setDispYn("Y");
		searchVO.setTypeCode(PathType.getPathTypeCode(Optional.of("shcp")));
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		List<StockVO> shcpList = investService.getStockMastList(searchVO, "front");
		model.addAttribute("shcp", shcpList.isEmpty() ? new StockVO() : shcpList.get(0));

		// 주주총회
		searchVO.setOffsetStartNumber(0);
		searchVO.setRowPerPage(3);
		searchVO.setDispYn("Y");
		searchVO.setTypeCode(PathType.getPathTypeCode(Optional.of("shmt")));
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		List<StockVO> shmtList = investService.getStockMastList(searchVO, "front");
		model.addAttribute("shmtList", shmtList);

		// 배당현황
		searchVO.setOffsetStartNumber(0);
		searchVO.setRowPerPage(3);
		searchVO.setDispYn("Y");
		searchVO.setTypeCode(PathType.getPathTypeCode(Optional.of("dvst")));
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		List<StockVO> dvstList = investService.getStockMastList(searchVO, "front");
		if(dvstList != null && !dvstList.isEmpty()) {
			model.addAttribute("lastDvst", dvstList.get(0));
			model.addAttribute("secondDvst", dvstList.size() > 1 ? dvstList.get(1) : null);
			model.addAttribute("firstDvst", dvstList.size() > 2 ? dvstList.get(2) : null);
			model.addAttribute("dvstCnt", dvstList.size());
		} else {
			model.addAttribute("lastDvst", null);
			model.addAttribute("secondDvst", null);
			model.addAttribute("firstDvst", null);
			model.addAttribute("dvstCnt", 0);
		}

		DateTimeFormatter format1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		DateTimeFormatter format2 = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		DateTimeFormatter format3 = DateTimeFormatter.ofPattern("MMM/dd/yyyy", Locale.ENGLISH);
		
		String baseDate1 = "2023-05-12 00:00:00";
		String baseDate2 = !shcpList.isEmpty() && 0 < shcpList.size() ? shcpList.get(0).getStdDate() + " 00:00:00" : ""; 
		String convetDate1 = "";
		String convetDate2 = "";
		
		if("KO".equals(locale.getLanguage().toUpperCase())) {
			convetDate1 = format2.format(LocalDate.parse(baseDate1, format1));
			convetDate2 = StringUtils.isEmpty(baseDate2) ? "" : format2.format(LocalDate.parse(baseDate2, format1));
		} else {
			convetDate1 = format3.format(LocalDate.parse(baseDate1, format1));
			convetDate2 = StringUtils.isEmpty(baseDate2) ? "" : format3.format(LocalDate.parse(baseDate2, format1));
		}
		
		model.addAttribute("baseDate1", convetDate1);
		model.addAttribute("baseDate2", convetDate2);
		
		return frontViewPath() + "/stock";
	}


	/**
	 * 투자정보 레퍼런스 정보
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/refer/{pathType}/getInvRefAjax"})
	@ResponseBody
	public Map<String, Object> getInvRefAjax(@PathVariable Optional<String> pathType, HttpServletRequest request, SearchVO searchVO) {
		Map<String, Object> retMap = Maps.newHashMap();
		// 구분코드 셋팅.
		searchVO.setTypeCode(PathType.getPathTypeCode(pathType));
		searchVO.setDispYn("Y");
		if(StringUtils.isEmpty(searchVO.getSearchLangType())) {
			searchVO.setSearchLangType("KO");
		}
		if(StringUtils.isEmpty(searchVO.getTypeCode())) {
			retMap.put("success", false);
		} else {
			Paging paging = new Paging(5);	// 기본 목록 10개씩
			int count = investService.getInvestReferTotCnt(searchVO);	// 카운트 쿼리
			paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
			paging.setTotalCount(count);	// 전체 건 수
			retMap.put("success", true);
			retMap.put("page", paging);
			retMap.put("list", investService.getInvestReferList(searchVO));
		}
		return retMap;
	}

	/**
	 * 투자정보 주가정보 조회
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/getKRXDataAjax"})
	@ResponseBody
	public Map<String, Object> getKRXDataAjax(HttpServletRequest request, SearchVO searchVO) {
		Map<String, Object> retMap = Maps.newHashMap();
		retMap.put("krxResponse", investService.getKRXData());
		retMap.put("success", true);
		return retMap;
	}

}


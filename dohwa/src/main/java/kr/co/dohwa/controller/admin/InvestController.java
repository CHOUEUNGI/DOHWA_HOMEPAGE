package kr.co.dohwa.controller.admin;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dohwa.aop.AdminKeepCondtion;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.constants.PathType;
import kr.co.dohwa.service.InvestService;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.validator.FileUploadValidator;
import kr.co.dohwa.validator.InvestValidator;
import kr.co.dohwa.vo.FinanceVO;
import kr.co.dohwa.vo.InvRefVO;
import kr.co.dohwa.vo.MultipartFileVO;
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
@Controller("adminInvestController")
@RequestMapping("/admin/invest")
public class InvestController {

	@Autowired
	InvestService investService;

	@Autowired
	private InvestValidator investValidator;

	@Autowired
	private FileUploadValidator fileUploadValidator;

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-refer-ext']}")
	private String FILE_UPLOAD_REFER_EXT;

	/**
	 *  투자정보관리 > 재무관리 > 주요경영실적 리스트 조회
	 * @return
	 */
	@AdminKeepCondtion
	@RequestMapping({"/finance/main"})
	public String getFinanceMainList(HttpServletRequest request, SearchVO searchVO, Model model) {

		Paging paging = new Paging(5);	// 기본 목록 10개씩
		int count = investService.getFinanceMainTotCnt(searchVO);	// 카운트 쿼리
		paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
		paging.setTotalCount(count);	// 전체 건 수
		model.addAttribute("page", paging);

		//searchVO.setOffsetStartNumber(paging.getStartRowNum());
		//searchVO.setRowPerPage(paging.getPageSize());
		model.addAttribute("list", investService.getFinanceMainList(searchVO));

		model.addAttribute("searchVO", searchVO);
		return "admin/invest/finance_main_list";
	}

	/**
	 *  투자정보관리 > 재무관리 > 주요경영실적 상세 조회/삭제/수정
	 * @return
	 * @throws IOException
	 */
	@RequestMapping({"/finance/main/{pathYyyy}"})
	public String getFinanceMainDetail(@PathVariable Optional<String> pathYyyy, HttpServletRequest request, FinanceVO financeVO, BindingResult result, Model model, Principal principal) throws IOException {

		//set page type
		financeVO.setPageType("main");

		//_method
		String _method = request.getParameter("_method");
		log.debug("getFinanceMainDetail _method " + _method);

		if("update".equals(_method)) {
			investValidator.validate(financeVO, result);
			if(result.hasErrors()) {
				return "admin/invest/finance_main_detail";
			} else {
				log.debug("getFinanceMainDetail financeVO " + financeVO.toString());
				financeVO.setUpdId(principal.getName());
				investService.updateFinanceMain(financeVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
				log.debug("getFinanceMainDetail msg " + messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
				return "redirect:/admin/invest/finance/main";
			}

		} else if("insert".equals(_method)) {
			investValidator.validate(financeVO, result);
			if(result.hasErrors()) {
				return "admin/invest/finance_main_detail";
			} else {
				financeVO.setRegId(principal.getName());
				investService.insertFinanceMain(financeVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
				return "redirect:/admin/invest/finance/main";
			}

		} else {
			if(pathYyyy.isPresent() && Integer.parseInt(pathYyyy.get()) > 0) {
				SearchVO searchVO = new SearchVO();
				searchVO.setYyyy(pathYyyy.get());
				searchVO.setRowPerPage(0);
				searchVO.setOffsetStartNumber(-1);
				model.addAttribute("financeVO", investService.getFinanceMainList(searchVO).get(0));
				return "admin/invest/finance_main_detail";
			} else {
				FinanceVO retVO = new FinanceVO();
				retVO.setYyyy("");
				model.addAttribute("financeVO", retVO);
				return "admin/invest/finance_main_detail";
			}
		}
	}

	@PostMapping("/finance/main/delete")
	@ResponseBody
	public Map<String, Object> getFinanceMainDelete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			investService.deleteFinanceMain(request.getParameter("arrYyyy").split(","));
			map.put("success", true);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		}catch(Exception e) {
			map.put("success", false);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] { "삭제" }, Locale.KOREA));
		}
		return map;
	}

	/**
	 *  투자정보관리 > 재무관리 > 요약재무재표 리스트 조회
	 * @return
	 */
	@AdminKeepCondtion
	@RequestMapping({"/finance/summary"})
	public String getFinanceSummaryList(HttpServletRequest request, SearchVO searchVO, Model model) {

		Paging paging = new Paging(5);	// 기본 목록 10개씩
		int count = investService.getFinanceSummaryTotCnt(searchVO);	// 카운트 쿼리
		paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
		paging.setTotalCount(count);	// 전체 건 수
		model.addAttribute("page", paging);

		//searchVO.setOffsetStartNumber(paging.getStartRowNum());
		//searchVO.setRowPerPage(paging.getPageSize());
		model.addAttribute("list", investService.getFinanceSummaryList(searchVO));

		model.addAttribute("searchVO", searchVO);
		return "admin/invest/finance_summary_list";
	}

	/**
	 *  투자정보관리 > 재무관리 > 요약재무재표 상세 조회/삭제/수정
	 * @return
	 * @throws IOException
	 */
	@RequestMapping({"/finance/summary/{pathYyyy}"})
	public String getFinanceSummaryDetail(@PathVariable Optional<String> pathYyyy, HttpServletRequest request, FinanceVO financeVO, BindingResult result, Model model, Principal principal) throws IOException {

		//set page type
		financeVO.setPageType("summary");

		//_method
		String _method = request.getParameter("_method");
		if("update".equals(_method)) {
			investValidator.validate(financeVO, result);
			if(result.hasErrors()) {
				return "admin/invest/finance_summary_detail";
			} else {
				financeVO.setUpdId(principal.getName());
				investService.updateFinanceSummary(financeVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
				return "redirect:/admin/invest/finance/summary";
			}

		} else if("insert".equals(_method)) {
			investValidator.validate(financeVO, result);
			if(result.hasErrors()) {
				return "admin/invest/finance_summary_detail";
			} else {
				financeVO.setRegId(principal.getName());
				investService.insertFinanceSummary(financeVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
				return "redirect:/admin/invest/finance/summary";
			}

		} else {
			if(pathYyyy.isPresent() && Integer.parseInt(pathYyyy.get()) > 0) {
				SearchVO searchVO = new SearchVO();
				searchVO.setYyyy(pathYyyy.get());
				searchVO.setRowPerPage(0);
				searchVO.setOffsetStartNumber(-1);
				model.addAttribute("financeVO", investService.getFinanceSummaryList(searchVO).get(0));
				return "admin/invest/finance_summary_detail";
			} else {
				FinanceVO retVO = new FinanceVO();
				retVO.setYyyy("");
				model.addAttribute("financeVO", retVO);
				return "admin/invest/finance_summary_detail";
			}
		}
	}

	@PostMapping("/finance/summary/delete")
	@ResponseBody
	public Map<String, Object> getFinanceSummaryDelete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			investService.deleteFinanceSummary(request.getParameter("arrYyyy").split(","));
			map.put("success", true);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		}catch(Exception e) {
			map.put("success", false);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] { "삭제" }, Locale.KOREA));
		}
		return map;
	}

	/**
	 *  투자정보관리 > 재무관리 > 자료실 리스트 조회
	 * @return
	 * @throws IOException
	 */
	@AdminKeepCondtion
	@RequestMapping({"/refer/{pathType}"})
	public String getInvestReferList(@PathVariable Optional<String> pathType, HttpServletRequest request, SearchVO searchVO, Model model) throws IOException {

		// 구분코드 셋팅.
		searchVO.setTypeCode(PathType.getPathTypeCode(pathType));
		if(StringUtils.isEmpty(searchVO.getTypeCode())) {
			return "error:404";
		} else {
			Paging paging = new Paging(5);	// 기본 목록 10개씩
			int count = investService.getInvestReferTotCnt(searchVO);	// 카운트 쿼리
			log.debug("Integer.parseInt(searchVO.getPage()) " + Integer.parseInt(searchVO.getPage()));
			paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
			paging.setTotalCount(count);	// 전체 건 수
			model.addAttribute("page", paging);

			model.addAttribute("list", investService.getInvestReferList(searchVO));

			model.addAttribute("searchVO", searchVO);
			model.addAttribute("currURI", "/admin/invest/refer/"+pathType.orElse(""));

			return "admin/invest/invest_refer_list";
		}


	}

	/**
	 *  투자정보관리 > 재무관리 > 주요경영실적 삭제
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/refer/{pathType}/delete")
	@ResponseBody
	public Map<String, Object> getInvestReferDelete(@PathVariable Optional<String> pathType, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			investService.deleteInvestRefer(request.getParameter("arrSeq").split(","), pathType.orElseThrow(() -> new NoSuchElementException("pathType is null!")));
			map.put("success", true);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		}catch(Exception e) {
			map.put("success", false);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] { "삭제" }, Locale.KOREA));
		}
		return map;
	}

	/**
	 *  투자정보관리 > 재무관리 > 주요경영실적 상세 조회/삭제/수정
	 * @return
	 * @throws IOException
	 */
	@RequestMapping({"/refer/{pathType}/{pathSeq}"})
	public String getInvestReferDetail(
			@PathVariable Optional<String> pathType, @PathVariable Optional<String> pathSeq,
			HttpServletRequest request, InvRefVO invRefVO,
			BindingResult fileResult, BindingResult result,
			Model model, Principal principal) throws IOException {

		// pathType 유효성 체크
		String pathTypeCode = PathType.getPathTypeCode(pathType);
		if(StringUtils.isEmpty(pathTypeCode)) {
			return "error:404";
		}

		// 리스트 화면 uri
		String parentURI = "/admin/invest/refer/"+pathType.orElse("");

		// 구분코드 셋팅
		invRefVO.setPageType(pathTypeCode);
		invRefVO.setTypeCode(pathTypeCode);

		//_method
		String _method = request.getParameter("_method");

		// 파일 업로드 유효성 체크
		if("update".equals(_method) || "insert".equals(_method)) {
			MultipartFileVO multipartFileVO = new MultipartFileVO();
			multipartFileVO.setRequest(request);
			multipartFileVO.setFileExt(FILE_UPLOAD_REFER_EXT);

			// 파일 체크
			fileUploadValidator.validate(multipartFileVO, fileResult);

			if(fileResult.hasErrors()) {
				for (Object object : fileResult.getFieldErrors()) {
				    if(object instanceof FieldError) {
				        FieldError fieldError = (FieldError) object;
				        if(fieldError.getField().equals("message")) {
				        	invRefVO.setMessage(fieldError.getCode());
				        }
				    }
				}
			}
		}

		if("update".equals(_method)) {	// 수정 진행
			invRefVO.setSeq(Integer.parseInt(pathSeq.orElse("0")));
			investValidator.validate(invRefVO, result);
			if(result.hasErrors()) {
				return "admin/invest/invest_refer_detail";
			} else {
				invRefVO.setUpdId(principal.getName());
				investService.updateInvestRefer(request, invRefVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
				return "redirect:"+parentURI;
			}

		} else if("insert".equals(_method)) {	//등록 진행
			investValidator.validate(invRefVO, result);
			if(result.hasErrors()) {
				return "admin/invest/invest_refer_detail";
			} else {
				invRefVO.setRegId(principal.getName());
				investService.insertInvestRefer(request, invRefVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
				return "redirect:"+parentURI;
			}

		} else {
			// uri setting
			model.addAttribute("parentURI", parentURI);
			model.addAttribute("currURI", parentURI+"/"+pathSeq.orElse(""));

			if(pathSeq.isPresent() && Integer.parseInt(pathSeq.get()) > 0) {	// 상세 조회
				SearchVO searchVO = new SearchVO();
				searchVO.setSeq(pathSeq.get());
				searchVO.setTypeCode(pathTypeCode);
				searchVO.setSearchLangType("");
				searchVO.setRowPerPage(0);
				searchVO.setOffsetStartNumber(-1);
				List<InvRefVO> list = investService.getInvestReferList(searchVO);
				if(list != null && !list.isEmpty()) {
					model.addAttribute("invRefVO", investService.getInvestReferList(searchVO).get(0));
					return "admin/invest/invest_refer_detail";
				} else {
					return "error:404";
				}

			} else {	//등록폼
				InvRefVO retVO = new InvRefVO();
				retVO.setSeq(0);
				retVO.setLang("KO");
				retVO.setDispYn("N");
				retVO.setPageType(pathTypeCode);
				retVO.setTypeCode(pathTypeCode);
				model.addAttribute("invRefVO", retVO);
				return "admin/invest/invest_refer_detail";
			}
		}
	}

	/**
	 *  투자정보관리 > 주식및 주주정보 리스트 조회
	 * @return
	 * @throws IOException
	 */
	@AdminKeepCondtion
	@RequestMapping({"/stock/{pathType}"})
	public String getStockList(@PathVariable Optional<String> pathType, HttpServletRequest request, SearchVO searchVO, Model model) throws IOException {

		// 구분코드 셋팅.
		searchVO.setTypeCode(PathType.getPathTypeCode(pathType));
		if(StringUtils.isEmpty(searchVO.getTypeCode())) {
			return "error:404";
		} else {
			Paging paging = new Paging(5);	// 기본 목록 10개씩
			int count = investService.getStockMastTotCnt(searchVO);	// 카운트 쿼리
			paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
			paging.setTotalCount(count);	// 전체 건 수
			model.addAttribute("page", paging);

			model.addAttribute("list", investService.getStockMastList(searchVO, "adminList"));

			model.addAttribute("searchVO", searchVO);
			model.addAttribute("currURI", "/admin/invest/stock/"+pathType.orElse(""));

			return "admin/invest/stock_list";
		}


	}
	
	/**
	 *  투자정보관리 > 재무관리 > 주요경영실적 삭제
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/stock/{pathType}/delete")
	@ResponseBody
	public Map<String, Object> getStockDetailDelete(@PathVariable Optional<String> pathType, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			investService.deleteStock(request, request.getParameter("arrSeq").split(","), pathType.orElseThrow(() -> new NoSuchElementException("pathType is null!")));
			map.put("success", true);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		}catch(Exception e) {
			map.put("success", false);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] { "삭제" }, Locale.KOREA));
		}
		return map;
	}


	/**
	 *  투자정보관리 > 주식및 주주정보 상세 조회/수정
	 * @return
	 * @throws IOException
	 */
	@RequestMapping({"/stock/{pathType}/{pathSeq}"})
	public String getStockDetail(
			@PathVariable Optional<String> pathType, @PathVariable Optional<String> pathSeq,
			HttpServletRequest request, StockVO stockVO,
			BindingResult fileResult, BindingResult result,
			Model model, Principal principal) throws IOException {

		// pathType 유효성 체크
		String pathTypeCode = PathType.getPathTypeCode(pathType);
		if(StringUtils.isEmpty(pathTypeCode)) {
			return "error:404";
		}

		// 리스트 화면 uri
		String parentURI = "/admin/invest/stock/"+pathType.orElse("");

		// 구분코드 셋팅
		stockVO.setTypeCode(pathTypeCode);

		//_method
		String _method = request.getParameter("_method");

		// 주주총회이면서 수정/등록인 경우 파일 업로드 유효성 체크
		if("STOCK_SHMT".equals(stockVO.getTypeCode())) {
			if("update".equals(_method) || "insert".equals(_method)) {
				MultipartFileVO multipartFileVO = new MultipartFileVO();
				multipartFileVO.setRequest(request);
				multipartFileVO.setFileExt(FILE_UPLOAD_REFER_EXT);

				// 파일 체크
				fileUploadValidator.validate(multipartFileVO, fileResult);

				if(fileResult.hasErrors()) {
					for (Object object : fileResult.getFieldErrors()) {
					    if(object instanceof FieldError) {
					        FieldError fieldError = (FieldError) object;
					        if(fieldError.getField().equals("message")) {
					        	stockVO.setMessage(fieldError.getCode());
					        }
					    }
					}
				}
			}
		}

		if("update".equals(_method)) {	// 수정 진행
			stockVO.setSeq(Integer.parseInt(pathSeq.orElse("0")));
			investValidator.validate(stockVO, result);
			if(result.hasErrors()) {
				return "admin/invest/stock_"+pathType.get()+"_detail";
			} else {
				stockVO.setUpdId(principal.getName());
				investService.updateStock(request, stockVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
				return "redirect:"+parentURI;
			}

		} else if("insert".equals(_method)) {	//등록 진행

			investValidator.validate(stockVO, result);
			if(result.hasErrors()) {
				return "admin/invest/stock_"+pathType.get()+"_detail";
			} else {
				stockVO.setRegId(principal.getName());
				investService.insertStock(request, stockVO);
				addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
				return "redirect:"+parentURI;
			}

		} else {
			// uri setting
			model.addAttribute("parentURI", parentURI);
			model.addAttribute("currURI", parentURI+"/"+pathSeq.orElse(""));

			if(pathSeq.isPresent() && Integer.parseInt(pathSeq.get()) > 0) {	// 상세 조회
				SearchVO searchVO = new SearchVO();
				searchVO.setSeq(pathSeq.get());
				searchVO.setTypeCode(pathTypeCode);
				searchVO.setSearchLangType("");
				searchVO.setRowPerPage(0);
				searchVO.setOffsetStartNumber(-1);
				List<StockVO> list = investService.getStockMastList(searchVO, "adminDetail");
				if(list != null && !list.isEmpty()) {
					model.addAttribute("stockVO", list.get(0));
					return "admin/invest/stock_"+pathType.get()+"_detail";
				} else {
					return "error:404";
				}

			} else {	//등록폼
				StockVO retVO = new StockVO();
				retVO.setSeq(0);
				retVO.setLang("KO");
				retVO.setDispYn("N");
				retVO.setTypeCode(pathTypeCode);
				model.addAttribute("stockVO", retVO);
				return "admin/invest/stock_"+pathType.get()+"_detail";
			}
		}
	}

	/**
	 * 화면에 메시지 전달
	 * @param request
	 * @param message
	 */
	private void addMessage(HttpServletRequest request, String message) {
		request.getSession().setAttribute(Constant.DOHWA_MESSAGE_KEY, message);
	}

}


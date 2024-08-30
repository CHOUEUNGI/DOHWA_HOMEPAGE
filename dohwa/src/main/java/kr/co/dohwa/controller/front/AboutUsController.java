package kr.co.dohwa.controller.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.AboutUsService;
import kr.co.dohwa.service.ContentsService;
import kr.co.dohwa.validator.CustInqrValidator;
import kr.co.dohwa.validator.FileUploadValidator;
import kr.co.dohwa.vo.BoardVO;
import kr.co.dohwa.vo.CustInqrVO;
import kr.co.dohwa.vo.LicenseVO;
import kr.co.dohwa.vo.MultipartFileVO;
import kr.co.dohwa.vo.PeopleVO;
import kr.co.dohwa.vo.PressVO;
import kr.co.dohwa.vo.SearchVO;
import kr.co.dohwa.vo.DonateVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 회사소개
 * @author PARK
 */
@Slf4j
@Controller
@RequestMapping({"aboutus", Constant.MOBILE_START_PATH+"aboutus"})
public class AboutUsController extends BaseController {

	@Autowired
	private AboutUsService aboutUsService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CustInqrValidator custInqrValidator;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private FileUploadValidator fileUploadValidator;

	@Value("#{config['file.upload-custInqr-ext']}")
	private String FILE_UPLOAD_CUST_INQR_EXT;

	/**
	 * 회사소개 > Overview 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/overview"}, method = RequestMethod.GET)
	public String overview(Model model) {

		SearchVO searchVO = new SearchVO();
		searchVO.setSearchDispYn("Y");

		// 면허 목록
		List<LicenseVO> licenseList = contentsService.getLicenseListFront(searchVO);

		model.addAttribute("licenseList", licenseList);

		return frontViewPath() + "/overview";
	}


	/**
	 * 회사소개 > Vision 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/vision"}, method = RequestMethod.GET)
	public String vision(Model model) {

		return frontViewPath() + "/vision";
	}


	/**
	 * 회사소개 > People 화면
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/people"}, method = RequestMethod.GET)
	public String people(Locale locale, Model model) {

		PeopleVO peopleVO = new PeopleVO();
		peopleVO.setLang(locale.getLanguage());
		peopleVO.setDispYn("Y");

		List<PeopleVO> peopleList = contentsService.getPeopleList(peopleVO);
		model.addAttribute("peopleList", peopleList);

		return frontViewPath() + "/people";
	}


	/**
	 * 회사소개 > History 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"history"}, method = RequestMethod.GET)
	public String history(Model model) {

		return frontViewPath() + "/history";
	}


	/**
	 * 회사소개 > CSR (나눔경영) 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"csr_01"}, method = RequestMethod.GET)
	public String csr01(Model model) {
		return frontViewPath() + "/csr_01";
	}
	
	/**
	 * CSR(사회공헌) 리스트
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@PostMapping("donate/list")
	@ResponseBody
	public Map<String, Object> donateList(@RequestBody SearchVO searchVO, Model model, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		int count = contentsService.getDonateCount(searchVO);
		List<DonateVO> donateList = contentsService.getDonateListFront(searchVO);
		map.put("count", count);
		map.put("list", donateList);

		return map;
	}

	/**
	 * 보도자료 더보기
	 * @param searchVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@PostMapping("donate/more")
	@ResponseBody
	public Map<String, Object> donateMore(@RequestBody SearchVO searchVO, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());

		int count = contentsService.getDonateCount(searchVO);
		List<DonateVO> donateList = contentsService.getDonateListFront(searchVO);

		map.put("count", count);
		map.put("list", donateList);

		return map;
	}

	

	/**
	 * 회사소개 > CSR (안전품질경영) 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"csr_02"}, method = RequestMethod.GET)
	public String csr02(Model model) {

		return frontViewPath() + "/csr_02";
	}


	/**
	 * 회사소개 > CSR (윤리준법경영) 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"csr_03"}, method = RequestMethod.GET)
	public String csr03(Model model) {

		return frontViewPath() + "/csr_03";
	}


	/**
	 * 회사소개 > Contact us > 연락처.본사 위치 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"contactus"}, method = RequestMethod.GET)
	public String contactus(Model model) {
		
		return frontViewPath() + "/contactus";
	}
	
	
	/**
	 * 회사소개 > Contact us > 해외 지사 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"overseas"}, method = RequestMethod.GET)
	public String overseas(Model model) {

		return frontViewPath() + "/overseas";
	}


	/**
	 * 회사 소개 > contact us > 문의하기
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/custInqr"})
	public String custInqr(HttpServletRequest request, CustInqrVO custInqrVO, Model model, Locale locale) {
		return frontViewPath() + "/custInqr";
	}


	/**
	 * 회사 소개 > contact us > 문의하기 등록
	 * @param request
	 * @param custInqrVO
	 * @param fileResult
	 * @param result
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@PostMapping({"/custInqr/reg"})
	@ResponseBody
	public Map<String, Object> regCustInqr(HttpServletRequest request, CustInqrVO custInqrVO, BindingResult fileResult, BindingResult result, Model model, Locale locale) throws IOException {
		Map<String, Object> retMap = Maps.newHashMap();
		
		custInqrVO.setPageType("front");
		custInqrVO.setTypeCode("CUST_INQR");
		
		// 파일 체크 (필수인지 확인 필요)
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_CUST_INQR_EXT);
		multipartFileVO.setCheckRequiredFileYn("N");
		fileUploadValidator.validate(multipartFileVO, fileResult);
		if(fileResult.hasErrors()) {
			for (Object object : fileResult.getFieldErrors()) {
			    if(object instanceof FieldError) {
			        FieldError fieldError = (FieldError) object;
			        if(fieldError.getField().equals("message")) {
			        	custInqrVO.setMessage(fieldError.getCode());
			        }
			    }
			}
		}

		// 문의하기 등록
		custInqrValidator.validate(custInqrVO, result);
		
		if(result.hasErrors()) {
			retMap.put("result", false);
			List<Map<String, Object>> errorList = new ArrayList<Map<String, Object>>();
			for(FieldError fe : result.getFieldErrors()) {
				Map<String, Object> errMap = Maps.newHashMap();
				errMap.put("field", fe.getField());
				errMap.put("msg", fe.getDefaultMessage());
				errorList.add(errMap);
			}
			retMap.put("errorList", errorList);
			return retMap;
			
		} else {
			custInqrVO.setRegNm(XssPreventer.escape(custInqrVO.getRegNm()));
			custInqrVO.setTitle(XssPreventer.escape(custInqrVO.getTitle()));
			custInqrVO.setCont(XssPreventer.escape(custInqrVO.getCont()));
			custInqrVO.setEmail(custInqrVO.getEmail()+"@"+custInqrVO.getEmailDomain());
			aboutUsService.insertCustInqr(request, custInqrVO);
			retMap.put("result", true);
		}
		
		retMap.put(Constant.DOHWA_MESSAGE_KEY, messageSource.getMessage("FRONT.ALERT.001", new String[] {}, locale));
		return retMap;
		
	}
}

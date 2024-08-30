package kr.co.dohwa.controller.front;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.CodeService;
import kr.co.dohwa.service.ContentsService;
import kr.co.dohwa.service.MainService;
import kr.co.dohwa.service.ProjectService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({"/", "/main", "/"+Constant.MOBILE_START_KEYWORD, Constant.MOBILE_START_PATH + "main"})
public class MainController extends BaseController {

	@Autowired
	SessionLocaleResolver localeResolver;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private MainService mainService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private ProjectService projectService;

	@GetMapping
	public String main(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		// 코드 조회
		CodeVO codeVO = new CodeVO();
		codeVO.setUseYn("Y");
		codeVO.setParentCode("MARKET_001");
		model.addAttribute("market001", codeService.getCodeList(codeVO));
		codeVO.setParentCode("MARKET_002");
		model.addAttribute("market002", codeService.getCodeList(codeVO));
		codeVO.setParentCode("MARKET_003");
		model.addAttribute("market003", codeService.getCodeList(codeVO));
		codeVO.setParentCode("MARKET_004");
		model.addAttribute("market004", codeService.getCodeList(codeVO));

		// 관리 요소 조회
		// 메인 비쥬얼 영역 조회
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchBoardType("BANNER");
		if(CommonUtils.isMobileDevice(request) && !request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("MO");
		} else if(!CommonUtils.isMobileDevice(request) && request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("PC");
		} else {
			searchVO.setSearchDeviceType(getCurrentDeviceType());
		}
		model.addAttribute("bannerList", mainService.getMainBannerList(searchVO));

		// 프로젝트 리스트 조회
		searchVO = new SearchVO();
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setTypeCode("PROJECT");
		searchVO.setSearchDispYn("Y");
		if(CommonUtils.isMobileDevice(request) && !request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("MO");
		} else if(!CommonUtils.isMobileDevice(request) && request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("PC");
		} else {
			searchVO.setSearchDeviceType(getCurrentDeviceType());
		}
		model.addAttribute("projectList", projectService.getProjectFrontList(searchVO));

		// 최신뉴스 리스트 조회
		searchVO = new SearchVO();
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDispYn("Y");
		searchVO.setDispYn("Y");
		searchVO.setSearchStartDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd", Locale.getDefault())));	//한국시간 기준
		model.addAttribute("newsList", contentsService.getFrontMainNewsList(searchVO));

		// 메인 팝업 리스트 조회
		searchVO = new SearchVO();
		if(CommonUtils.isMobileDevice(request) && !request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("MO");
		} else if(!CommonUtils.isMobileDevice(request) && request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			searchVO.setSearchDeviceType("PC");
		} else {
			searchVO.setSearchDeviceType(getCurrentDeviceType());
		}
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchStartDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss", Locale.getDefault())));	//한국시간 기준
		model.addAttribute("popupList", mainService.getFrontMainPopupList(searchVO));
		
		// 디바이스에 맞춰서 리다이렉트
		if(CommonUtils.isMobileDevice(request) && !request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			return "mobile/main";
		} else if(!CommonUtils.isMobileDevice(request) && request.getRequestURI().startsWith(Constant.MOBILE_START_PATH)) {
			return "front/main";
		} else {
			return frontViewPath() + "main";
		}

		
	}

}

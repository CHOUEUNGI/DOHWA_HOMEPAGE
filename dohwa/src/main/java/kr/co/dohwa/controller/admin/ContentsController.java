package kr.co.dohwa.controller.admin;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.CodeService;
import kr.co.dohwa.service.ContentsService;
import kr.co.dohwa.service.FileService;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.validator.BoardValidator;
import kr.co.dohwa.validator.LicenseValidator;
import kr.co.dohwa.validator.PeopleValidator;
import kr.co.dohwa.validator.PressValidator;
import kr.co.dohwa.validator.DonateValidator;
import kr.co.dohwa.vo.BoardVO;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.DonateVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.LicenseVO;
import kr.co.dohwa.vo.MultipartFileVO;
import kr.co.dohwa.vo.PeopleVO;
import kr.co.dohwa.vo.PressVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 컨텐츠 관리 Controller
 * @author KYoung
 */
@Slf4j
@Controller
@RequestMapping("/admin/contents")
public class ContentsController {
	
	@Autowired
	ContentsService contentsService;
	
	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private PeopleValidator peopleValidator;
	
	@Autowired
	private LicenseValidator licenseValidator;

	@Autowired
	private BoardValidator boardValidator;
	
	@Autowired
	private PressValidator pressValidator;

	@Autowired
	private DonateValidator donateValidator;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private CodeService codeService;
	
	
	/**
	 * 컨텐츠관리 > People 관리 > 목록 화면
	 * @return
	 */
	@RequestMapping(value = {"","/people","/people/list"}, method = RequestMethod.GET)
	public String peopleList(PeopleVO peopleVO, Model model) {
		
		List<PeopleVO> peopleList = contentsService.getPeopleList(peopleVO);
		model.addAttribute("peopleList", peopleList);
		
		return "admin/contents/people_list";
	}

	
	/**
	 * 컨텐츠 관리 > People 관리 > 저장 화면
	 * @return
	 */
	@RequestMapping(value = {"/people/save"}, method = RequestMethod.GET)
	public String peopleSave(HttpServletRequest request, PeopleVO peopleVO, Model model) {
		
		String _method = request.getParameter("_method");
		if ("update".equals(_method)) {
			
			List<PeopleVO> peopleList = contentsService.getPeopleList(peopleVO);
			peopleVO.setPeoples(peopleList);
		}
		
		return "admin/contents/people_save";
	}

	
	/**
	 * 컨텐츠 관리 > People 관리 > 저장 처리
	 * @param peopleVO
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = {"/people/save"}, method = RequestMethod.POST)
	public String insertPeople(HttpServletRequest request, PeopleVO peopleVO, BindingResult result) throws Exception {
		
		String _method = request.getParameter("_method");
		
		// field 유효성 체크
		peopleValidator.validate(peopleVO, result);
		
		if (result.hasErrors()) {
			
			return "admin/contents/people_save";
		}
		
		if ("insert".equals(_method)) {
			
			contentsService.insertPeople(peopleVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
		} else if ("update".equals(_method)) {
			
			contentsService.updatePeople(peopleVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
		}
		
		return "redirect:/admin/contents/people";
	}

	
	/**
	 * 컨텐츠 관리 > People 관리 > 삭제 처리
	 * @param request
	 * @param peopleVO
	 * @return
	 */
	@RequestMapping(value = {"/people/delete"}, method = RequestMethod.POST)
	public String deletePeople(HttpServletRequest request, @RequestParam(value = "seq", required = true) List<Integer> seqs) {
		
		contentsService.deletePeople(seqs);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		return "redirect:/admin/contents/people";
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록 화면
	 * @return
	 */
	@RequestMapping(value = {"/license","/license/list"}, method = RequestMethod.GET)
	public String licenseList(SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(20);
		
		Paging paging = new Paging(10);
		paging.setPageSize(20);
		
		int count = contentsService.getLicenseCount(searchVO);
		
		paging.setPageNo(Integer.parseInt(Optional.ofNullable(searchVO.getPage()).orElse("0")));
		paging.setTotalCount(count);
		model.addAttribute("page", paging);
		
		List<LicenseVO> licenseList = contentsService.getLicenseList(searchVO);
		model.addAttribute("licenseList", licenseList);
		
		return "admin/contents/license_list";
	}

	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 저장 화면
	 * 
	 * @param licenseVO
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/license/save", "/license/save/{seq}"}, method = RequestMethod.GET)
	public String licenseSave(@PathVariable(value = "seq") Optional<String> seq,
			LicenseVO licenseVO, SearchVO searchVO, Model model) {

		searchVO.setPage("1");
		
		if (seq.isPresent()) {
			
			licenseVO = contentsService.getLicense(Integer.parseInt(seq.get()));
			model.addAttribute("licenseVO", licenseVO);
		}
		
		return "admin/contents/license_save";
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 저장 처리
	 * @param peopleVO
	 * @return
	 */
	@RequestMapping(value = {"/license/save", "/license/save/{seq}"}, method = RequestMethod.POST)
	public String insertLicense(@PathVariable(value = "seq") Optional<String> seq,
			HttpServletRequest request, LicenseVO licenseVO, BindingResult result, SearchVO searchVO,
			RedirectAttributes redirectAttributes) {
		
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_IMAGE_EXT);
		
		licenseVO.setMultipartFileVO(multipartFileVO);

		// field 유효성 체크
		licenseValidator.validate(licenseVO, result);
		
		if (result.hasErrors()) {
			
			// 수정일때 파일 목록 유지
			if (seq.isPresent()) {
				
				FileVO fileVO = new FileVO();
				fileVO.setAttSeq(Integer.parseInt(seq.orElse("0")));
				fileVO.setAttType("LICENSE");
				
				licenseVO.setFiles(fileService.getFileList(fileVO));
			}
			
			return "admin/contents/license_save";
		}
		
		if (seq.isPresent()) {
			
			contentsService.updateLicense(request, licenseVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
			
			redirectAttributes.addAttribute("page", request.getParameter("page"));
			redirectAttributes.addAttribute("searchText", request.getParameter("searchText"));
		} else {
			contentsService.insertLicense(request, licenseVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
		}
		return "redirect:/admin/contents/license";
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 삭제 처리
	 * @param request
	 * @param seqs
	 * @return
	 */
	@RequestMapping(value = {"/license/delete"}, method = RequestMethod.POST)
	public String deleteLicense(HttpServletRequest request,
			@RequestParam(value = "seq", required = true) List<Integer> seqs) {
		
		contentsService.deleteLicense(seqs);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		return "redirect:/admin/contents/license";
	}
	
	
	/**
	 *  컨텐츠 관리 > 게시판 관리 > 목록 화면
	 * @return
	 */
	@RequestMapping(value = {"/board","/board/list"}, method = RequestMethod.GET)
	public String boardList(HttpServletRequest request, SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(20);
		
		Paging paging = new Paging(10);
		paging.setPageSize(20);
		
		int count = contentsService.getBoardCount(searchVO);
		
		paging.setPageNo(Integer.parseInt(Optional.ofNullable(searchVO.getPage()).orElse("0")));
		paging.setTotalCount(count);
		model.addAttribute("page", paging);

		// 기본 검색 언어코드
		searchVO.setSearchLangType(Optional.ofNullable(searchVO.getSearchLangType()).orElse("KO"));
		
		List<BoardVO> boardList = contentsService.getBoardList(searchVO);
		model.addAttribute("boardList", boardList);
		
		return "admin/contents/board_list";
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 저장 화면
	 * @param seq
	 * @param boardVO
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/board/save", "/board/save/{seq}"}, method = RequestMethod.GET)
	public String boardSave(@PathVariable(value = "seq") Optional<String> seq,
			BoardVO boardVO, SearchVO searchVO, Model model) {

		searchVO.setPage("1");
		boardVO.setLang(searchVO.getSearchLangType());
		
		if (seq.isPresent()) {
			
			boardVO = contentsService.getBoard(Integer.parseInt(seq.get()));
			model.addAttribute("boardVO", boardVO);
		}

		CodeVO codeVO = new CodeVO();
		codeVO.setParentCode("BOARD_TYPE");
		
		// 구분코드 목록
		model.addAttribute("typeList", codeService.getCodeList(codeVO));
		
		return "admin/contents/board_save";
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 등록 처리 
	 * @param seq
	 * @param request
	 * @param boardVO
	 * @param result
	 * @param redirectAttributes
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/board/save", "/board/save/{seq}"}, method = RequestMethod.POST)
	public String insertBoard(@PathVariable(value = "seq") Optional<String> seq,
			HttpServletRequest request, BoardVO boardVO, BindingResult result, SearchVO searchVO,
			RedirectAttributes redirectAttributes, Model model) {
		
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_IMAGE_EXT);
		
		boardVO.setMultipartFileVO(multipartFileVO);
		
		// field 유효성 체크
		boardValidator.validate(boardVO, result);
		
		if (result.hasErrors()) {
			
			// 수정일때 파일 목록 유지
			if (seq.isPresent()) {
				
				FileVO fileVO = new FileVO();
				fileVO.setAttSeq(Integer.parseInt(seq.orElse("0")));
				fileVO.setAttType("BOARD");
				
				boardVO.setFiles(fileService.getFileList(fileVO));
			}
			
			CodeVO codeVO = new CodeVO();
			codeVO.setParentCode("BOARD_TYPE");
			
			// 구분코드 목록
			model.addAttribute("typeList", codeService.getCodeList(codeVO));
			
			return "admin/contents/board_save";
		}
		
		if (seq.isPresent()) {
			
			contentsService.updateBoard(request, boardVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
			
			redirectAttributes.addAttribute("page", request.getParameter("page"));
			redirectAttributes.addAttribute("searchText", request.getParameter("searchText"));
			redirectAttributes.addAttribute("searchLangType", boardVO.getLang());
			
			return "redirect:/admin/contents/board/save/{seq}";
		} else {
			
			contentsService.insertBoard(request, boardVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
			
			redirectAttributes.addAttribute("searchLangType", boardVO.getLang());
			
			return "redirect:/admin/contents/board";
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 삭제 처리
	 * @param request
	 * @param seqs
	 * @return
	 */
	@RequestMapping(value = {"/board/delete"}, method = RequestMethod.POST)
	public String deleteBoard(HttpServletRequest request, SearchVO searchVO,
			@RequestParam(value = "seq", required = true) List<Integer> seqs,
			RedirectAttributes redirectAttributes) {
		
		contentsService.deleteBoard(seqs);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		redirectAttributes.addAttribute("searchLangType", searchVO.getSearchLangType());
		
		return "redirect:/admin/contents/board";
	}
	
	/////////////////////////////////////보도자료 신규 개발 시작//////////////////////////////////////////////////////////////////
	
	/**
	 *  컨텐츠 관리 > 보도자료 관리 > 목록 화면
	 * @return
	 */
	@RequestMapping(value = {"/press","/press/list"}, method = RequestMethod.GET)
	public String pressList(HttpServletRequest request, SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(20);
		
		Paging paging = new Paging(10);
		paging.setPageSize(20);
		
		int count = contentsService.getPressCount(searchVO);
		
		paging.setPageNo(Integer.parseInt(Optional.ofNullable(searchVO.getPage()).orElse("0")));
		paging.setTotalCount(count);
		model.addAttribute("page", paging);

		// 기본 검색 언어코드
		searchVO.setSearchLangType(Optional.ofNullable(searchVO.getSearchLangType()).orElse("KO"));
		
		List<PressVO> pressList = contentsService.getPressList(searchVO);
		model.addAttribute("pressList", pressList);
		
		return "admin/contents/press_list";
	}
	
	/**
	 * 컨텐츠 관리 > 보도관리 관리 > 저장 화면
	 * @param seq
	 * @param pressVO
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/press/save", "/press/save/{seq}"}, method = RequestMethod.GET)
	public String pressSave(@PathVariable(value = "seq") Optional<String> seq,
			PressVO pressVO, SearchVO searchVO, Model model) {

		searchVO.setPage("1");
		
		if (seq.isPresent()) {
			pressVO = contentsService.getPress(Integer.parseInt(seq.get()));
			model.addAttribute("pressVO", pressVO);
		}
		
		return "admin/contents/press_save";
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 등록 처리 
	 * @param seq
	 * @param request
	 * @param pressVO
	 * @param result
	 * @param redirectAttributes
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/press/save", "/press/save/{seq}"}, method = RequestMethod.POST)
	public String insertPress(@PathVariable(value = "seq") Optional<String> seq,
			HttpServletRequest request, PressVO pressVO, BindingResult result, SearchVO searchVO,
			RedirectAttributes redirectAttributes) {
		
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_IMAGE_EXT);
		
		pressVO.setMultipartFileVO(multipartFileVO);
		
		
		// field 유효성 체크
		pressValidator.validate(pressVO, result);
		
		if (result.hasErrors()) {
			
			// 수정일때 파일 목록 유지
			if (seq.isPresent()) {
				
				FileVO fileVO = new FileVO();
				fileVO.setAttSeq(Integer.parseInt(seq.orElse("0")));
				fileVO.setAttType("PRESS");
				
				pressVO.setFiles(fileService.getFileList(fileVO));
			}
			
			return "admin/contents/press_save";
		}
		
		if (seq.isPresent()) {
			contentsService.updatePress(request, pressVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
			
			redirectAttributes.addAttribute("page", request.getParameter("page"));
			redirectAttributes.addAttribute("searchText", request.getParameter("searchText"));
		} else {
			contentsService.insertPress(request, pressVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
		}
		return "redirect:/admin/contents/press";
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 삭제 처리
	 * @param request
	 * @param seqs
	 * @return
	 */
	@RequestMapping(value = {"/press/delete"}, method = RequestMethod.POST)
	public String deletePress(HttpServletRequest request,
			@RequestParam(value = "seq", required = true) List<Integer> seqs) {
		
		contentsService.deletePress(seqs);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		return "redirect:/admin/contents/press";
	}
	
	
	/////////////////////////////////////보도자료 신규 개발 끝 //////////////////////////////////////////////////////////////////
	
	////////////////////////////////////CSR(사회공헌) 신규 개발 시작/////////////////////////////////////////////////////////////
	/**
	 *  컨텐츠 관리 > CSR(사회공헌) 관리 > 목록 화면
	 * @return
	 */
	@RequestMapping(value = {"/donate","/donate/list"}, method = RequestMethod.GET)
	public String donateList(HttpServletRequest request, SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(20);
		
		Paging paging = new Paging(10);
		paging.setPageSize(20);
		
		int count = contentsService.getDonateCount(searchVO);
		
		paging.setPageNo(Integer.parseInt(Optional.ofNullable(searchVO.getPage()).orElse("0")));
		paging.setTotalCount(count);
		model.addAttribute("page", paging);

		// 기본 검색 언어코드
		searchVO.setSearchLangType(Optional.ofNullable(searchVO.getSearchLangType()).orElse("KO"));
		
		List<DonateVO> donateList = contentsService.getDonateList(searchVO);
		model.addAttribute("donateList", donateList);
		
		return "admin/contents/donate_list";
	}
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 저장 화면
	 * @param seq
	 * @param donateVO
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/donate/save", "/donate/save/{seq}"}, method = RequestMethod.GET)
	public String donateSave(@PathVariable(value = "seq") Optional<String> seq,
			DonateVO donateVO, SearchVO searchVO, Model model) {

		searchVO.setPage("1");
		
		if (seq.isPresent()) {
			donateVO = contentsService.getDonate(Integer.parseInt(seq.get()));
			model.addAttribute("donateVO", donateVO);
		}
		return "admin/contents/donate_save";
	}
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 등록 처리 
	 * @param seq
	 * @param request
	 * @param pressVO
	 * @param result
	 * @param redirectAttributes
	 * @param model
	 * @return
	 */
	/**
	 * 컨텐츠 관리 > 면허 관리 > 저장 처리
	 * @param peopleVO
	 * @return
	 */
	@RequestMapping(value = {"/donate/save", "/donate/save/{seq}"}, method = RequestMethod.POST)
	public String insertDonate(@PathVariable(value = "seq") Optional<String> seq,
			HttpServletRequest request, DonateVO donateVO, BindingResult result, SearchVO searchVO,
			RedirectAttributes redirectAttributes) {
		
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_IMAGE_EXT);
		
		donateVO.setMultipartFileVO(multipartFileVO);
		
		// field 유효성 체크
		donateValidator.validate(donateVO, result);
		
		if (result.hasErrors()) {
			
			// 수정일때 파일 목록 유지
			if (seq.isPresent()) {
				
				FileVO fileVO = new FileVO();
				fileVO.setAttSeq(Integer.parseInt(seq.orElse("0")));
				fileVO.setAttType("DONATE");
				
				donateVO.setFiles(fileService.getFileList(fileVO));
			}
			
			return "admin/contents/donate_save";
		}
		
		if (seq.isPresent()) {
			
			contentsService.updateDonate(request, donateVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
			
			redirectAttributes.addAttribute("page", request.getParameter("page"));
			redirectAttributes.addAttribute("searchText", request.getParameter("searchText"));
		} else {
			contentsService.insertDonate(request, donateVO);
			addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "등록" }, Locale.KOREA));
		}
		return "redirect:/admin/contents/donate";
	}
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 삭제 처리
	 * @param request
	 * @param seqs
	 * @return
	 */
	@RequestMapping(value = {"/donate/delete"}, method = RequestMethod.POST)
	public String deleteDonate(HttpServletRequest request,
			@RequestParam(value = "seq", required = true) List<Integer> seqs) {
		contentsService.deleteDonate(seqs);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		return "redirect:/admin/contents/donate";
	}
	
	
	//////////////////////////////////CSR(사회공헌) 신규 개발 끝////////////////////////////////////////////////////////////////
	
	
	
	/**
	 * 컨텐츠 관리 > 이미지 파일 삭제
	 * @param request	
	 * @param type	 
	 * @param seq
	 * @param fileVO
	 * @return
	 */
	@RequestMapping(value = {"/{type}/deleteFile/{seq}"}, method = RequestMethod.POST)
	public String deleteFileBoard(HttpServletRequest request, @PathVariable(value = "type") String type,
			@PathVariable(value = "seq") Optional<String> seq, FileVO fileVO) {
		
		fileService.deleteFile(fileVO);
		addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		
		return "redirect:/admin/contents/{type}/save/{seq}";
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

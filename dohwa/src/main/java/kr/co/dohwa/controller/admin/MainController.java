package kr.co.dohwa.controller.admin;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;

import kr.co.dohwa.aop.Logging;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.FileService;
import kr.co.dohwa.service.MainService;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.validator.MainBannerValidator;
import kr.co.dohwa.validator.MainPopupValidator;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.MainBannerVO;
import kr.co.dohwa.vo.MainPopupVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 메인 관리
 *
 * @author PARK
 *
 */
@Slf4j
@Controller("adminMainController")
@RequestMapping("/admin/main")
public class MainController {

	@Autowired
	private MainBannerValidator mainBannerValidator;

	@Autowired
	private MainPopupValidator mainPopupValidator;

	@Autowired
	private MainService mainService;

	@Autowired
	private FileService fileService;

	/**
	 * 배너 리스트 화면
	 * @param model
	 * @return
	 */
	@Logging(menuNm = "배너")
	@GetMapping("banner")
	public String banner(Model model) {
		List<MainBannerVO> list = mainService.getMainBannerAdminList();
		Map<String, Object> map = list.stream().collect(Collectors.groupingBy(MainBannerVO::getBannerType,
							Collectors.collectingAndThen(Collectors.mapping(MainBannerVO::getTypeOrder, Collectors.toSet()), Set::size)));

		model.addAttribute("list", list);
		model.addAttribute("grouping", map);

		return "/admin/main/banner_list";
	}

	/**
	 * 배너 상세
	 * @param seq
	 * @param mainBannerVO
	 * @param model
	 * @return
	 */
	@GetMapping({"banner/view", "banner/{seq}"})
	public String bannerView(@PathVariable Optional<Integer> seq, MainBannerVO mainBannerVO, Model model) {

		// 신규
		if(!seq.isPresent()) {
			model.addAttribute("mainBannerVO", mainBannerVO);

		// 상세
		} else {
			mainBannerVO.setSeq(seq.get());
			model.addAttribute("mainBannerVO", mainService.getMainBanner(mainBannerVO));
		}

		return "/admin/main/banner_view";
	}

	/**
	 * 메인 배너 저장
	 * @param request
	 * @param mainBannerVO
	 * @param fileResult
	 * @param result
	 * @param model
	 * @return
	 */
	@Logging(menuNm = "배너")
	@PostMapping("banner/proc")
	public String bannerProc(HttpServletRequest request,
			MainBannerVO mainBannerVO, BindingResult result, Model model) {

		mainBannerValidator.validate(mainBannerVO, result);

		if(result.hasErrors()) {
			// 파일 조회
			FileVO fileVO = new FileVO();
			fileVO.setAttType("BANNER");
			fileVO.setAttSeq(mainBannerVO.getSeq());

			mainBannerVO.setFiles(fileService.getFileList(fileVO));

			return "/admin/main/banner_view";
		}

		String message = "";
		// 등록
		if(null == mainBannerVO.getSeq()) {
			message = mainService.insertMainBanner(request, mainBannerVO);
		// 변경
		} else {
			message = mainService.updateMainBanner(request, mainBannerVO);
		}

		addMessage(request, message);

		return "redirect:/admin/main/banner";
	}

	/**
	 * 메인 배너 정렬
	 * @param seq
	 * @return
	 */
	@PostMapping("banner/order")
	@ResponseBody
	public Map<String, Object> bannerOrder(@RequestBody List<MainBannerVO> list, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Map<String, Object> map = Maps.newHashMap();
		map.put("list", list);
		map.put("updId", userDetails.getUsername());

		String message = mainService.updateMainBannerOrder(map);

		map.clear();
		map.put("message", message);

		return map;
	}

	/**
	 * 메인 배너 노출/비노출 처리
	 * @param seq
	 * @return
	 */
	@PostMapping("banner/disp")
	@ResponseBody
	public Map<String, Object> bannerDisp(@RequestBody MainBannerVO mainBannerVO) {
		Map<String, Object> map = Maps.newHashMap();
		map.put("message", mainService.updateMainBannerDisp(mainBannerVO));

		return map;
	}

	/**
	 * 메인 배너 삭제
	 * @param request
	 * @param seqs
	 * @return
	 */
	@Logging(menuNm = "배너")
	@DeleteMapping("banner")
	public String bannerDelete(HttpServletRequest request, @RequestParam(value = "seqs") List<Integer> seqs) {
		addMessage(request, mainService.deleteMainBanner(seqs));

		return "redirect:/admin/main/banner";
	}

	/**
	 * 메인 팝업 조회
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@GetMapping("popup")
	public String popup(HttpServletRequest request, SearchVO searchVO, Model model) {
		Paging paging = new Paging(20);
		searchVO.setRowPerPage(20);

		int count = mainService.getMainPopupCount(searchVO);
		paging.setPageNo(Integer.parseInt(searchVO.getPage()));
		paging.setTotalCount(count);

		List<MainPopupVO> list = mainService.getMainPopupList(searchVO);

		model.addAttribute("page", paging);
		model.addAttribute("list", list);

		return "/admin/main/popup_list";
	}

	/**
	 * 메인 팝업 상세
	 * @param seq
	 * @param mainPopupVO
	 * @param model
	 * @return
	 */
	@GetMapping({"popup/view", "popup/{seq}"})
	public String popupView(@PathVariable Optional<Integer> seq, MainPopupVO mainPopupVO, Model model) {
		// 신규
		if(!seq.isPresent()) {
			mainPopupVO.setLang("KO");
			mainPopupVO.setPcLinkYn("N");
			mainPopupVO.setMoLinkYn("N");
			mainPopupVO.setDispYn("N");
			model.addAttribute("mainPopupVO", mainPopupVO);
		// 상세
		} else {
			mainPopupVO.setSeq(seq.get());
			model.addAttribute("mainPopupVO", mainService.getMainPopup(mainPopupVO));
		}

		return "/admin/main/popup_view";
	}

	/**
	 * 메인 팝업 저장
	 * @param request
	 * @param mainPopupVO
	 * @param result
	 * @param model
	 * @return
	 */
	@PostMapping("popup/proc")
	public String popupProc(HttpServletRequest request,
			MainPopupVO mainPopupVO, BindingResult result, Model model) {

		// 게시 시작일
		if(!StringUtils.isEmpty(mainPopupVO.getStrDispStDt()) && 12 == mainPopupVO.getStrDispStDt().length()) {
			mainPopupVO.setDispStDt(LocalDateTime.parse(mainPopupVO.getStrDispStDt() + "00", DateTimeFormatter.ofPattern("yyyyMMddHHmmss")));
		}

		// 게시 종료일
		if(!StringUtils.isEmpty(mainPopupVO.getStrDispEdDt()) && 12 == mainPopupVO.getStrDispEdDt().length()) {
			mainPopupVO.setDispEdDt(LocalDateTime.parse(mainPopupVO.getStrDispEdDt() + "00", DateTimeFormatter.ofPattern("yyyyMMddHHmmss")));
		}

		mainPopupValidator.validate(mainPopupVO, result);

		if(result.hasErrors()) {
			// 파일 조회
			FileVO fileVO = new FileVO();
			fileVO.setAttType("POPUP");
			fileVO.setAttSeq(mainPopupVO.getSeq());

			if(null != mainPopupVO.getSeq()) {
				List<FileVO> files = fileService.getFileList(fileVO);
				mainPopupVO.setFiles(files);
			}
			return "/admin/main/popup_view";
		}

		String message = "";
		// 등록
		if(null == mainPopupVO.getSeq()) {
			message = mainService.insertMainPopup(request, mainPopupVO);
		// 변경
		} else {
			message = mainService.updateMainPopup(request, mainPopupVO);
		}

		addMessage(request, message);

		return "redirect:/admin/main/popup";
	}

	/**
	 * 메인 팝업 삭제
	 * @param request
	 * @param seqs
	 * @return
	 */
	@DeleteMapping("popup")
	public String popupDelete(HttpServletRequest request, @RequestParam(value = "seqs") List<Integer> seqs) {
		addMessage(request, mainService.deleteMainPopup(seqs));

		return "redirect:/admin/main/popup";
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

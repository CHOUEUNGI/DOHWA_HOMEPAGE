package kr.co.dohwa.controller.front;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.ContentsService;
import kr.co.dohwa.vo.BoardVO;
import kr.co.dohwa.vo.PressVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 홍보센터
 * @author PARK
 */
@Controller
@RequestMapping({"prroom", Constant.MOBILE_START_PATH + "prroom"})
public class PrRoomController extends BaseController {

	@Autowired
	ContentsService contentsService;

	/**
	 * CI
	 * @return
	 */
	@GetMapping("ci")
	public String ci() {
		return frontViewPath() + "/ci";
	}

	/**
	 * 최신소식 페이지
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@GetMapping("news")
	public String news(HttpServletRequest request, HttpSession session, SearchVO searchVO, Model model, Locale locale) {

		if(null != session.getAttribute("newsPrevPageSeq")) {
			model.addAttribute("newsPrevPageSeq", session.getAttribute("newsPrevPageSeq"));
			session.removeAttribute("newsPrevPageSeq");
		}

		model.addAttribute("rpp", searchVO.getRowPerPage());

		return frontViewPath() + "/news_list";
	}

	/**
	 * 최신소식 리스트
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@PostMapping("news/list")
	@ResponseBody
	public Map<String, Object> newsList(@RequestBody SearchVO searchVO, Model model, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());

		int count = contentsService.getBoardCount(searchVO);
		List<BoardVO> boardList = contentsService.getBoardList(searchVO);

		map.put("count", count);
		map.put("list", boardList);

		return map;
	}

	/**
	 * 최신소식 더보기
	 * @param searchVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@PostMapping("news/more")
	@ResponseBody
	public Map<String, Object> newsMore(@RequestBody SearchVO searchVO, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());

		int count = contentsService.getBoardCount(searchVO);
		List<BoardVO> boardList = contentsService.getBoardList(searchVO);

		map.put("count", count);
		map.put("list", boardList);

		return map;
	}

	/**
	 * 최신소식 상세
	 * @param boardVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@GetMapping("news/{seq}")
	public String newsView(@PathVariable Optional<Integer> seq,
			HttpSession session,
			@PathVariable Optional<Integer> idx, SearchVO searchVO, Model model, Locale locale) {
		if(0 >= seq.get()) {
			if("PC".equals(getCurrentDeviceType())) {
				return "redirect:/prroom/news";
			} else {
				return "redirect:"+Constant.MOBILE_START_PATH+"prroom/news";
			}
		}

		BoardVO boardVO = new BoardVO();
		boardVO.setSeq(seq.get());
		boardVO.setDispYn("Y");
		boardVO.setLang(locale.getLanguage().toUpperCase());
		BoardVO board = contentsService.getBoardBy(boardVO);
		if(null == board) {
			if("PC".equals(getCurrentDeviceType())) {
				return "redirect:/prroom/news";
			} else {
				return "redirect:"+Constant.MOBILE_START_PATH+"prroom/news";
			}
			
		}

		searchVO.setSeq(Integer.toString(seq.get()));
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());

		List<BoardVO> boardByPrevNexts = contentsService.getBoardByPrevNext(searchVO);
		
		session.setAttribute("newsPrevPageSeq", seq.get());
		
		model.addAttribute("boardVO", board);
		model.addAttribute("boardPrev", boardByPrevNexts.stream().filter(x -> "PREV".equals(x.getBtnNm())).collect(Collectors.toList()));
		model.addAttribute("boardNext", boardByPrevNexts.stream().filter(x -> "NEXT".equals(x.getBtnNm())).collect(Collectors.toList()));

		return frontViewPath() + "/news_view";
	}
	
	/**
	 * 보도자료 페이지
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@GetMapping("press")
	public String press(HttpServletRequest request, HttpSession session, SearchVO searchVO, Model model, Locale locale) {
		if(null != session.getAttribute("pressPrevPageSeq")) {
			model.addAttribute("pressPrevPageSeq", session.getAttribute("pressPrevPageSeq"));
			session.removeAttribute("pressPrevPageSeq");
		}

		model.addAttribute("rpp", searchVO.getRowPerPage());

		return frontViewPath() + "/press_list";
	}

	/**
	 * 보도자료 리스트
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@PostMapping("press/list")
	@ResponseBody
	public Map<String, Object> pressList(@RequestBody SearchVO searchVO, Model model, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		//searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		int count = contentsService.getPressCount(searchVO);
		List<PressVO> pressList = contentsService.getPressListFront(searchVO);
		map.put("count", count);
		map.put("list", pressList);

		return map;
	}

	/**
	 * 보도자료 더보기
	 * @param searchVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@PostMapping("press/more")
	@ResponseBody
	public Map<String, Object> pressMore(@RequestBody SearchVO searchVO, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());

		int count = contentsService.getPressCount(searchVO);
		List<PressVO> pressList = contentsService.getPressListFront(searchVO);

		map.put("count", count);
		map.put("list", pressList);

		return map;
	}

	/**
	 * 보도자료 상세
	 * @param pressVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@GetMapping("press/{seq}")
	public String pressView(@PathVariable Optional<Integer> seq,
			HttpSession session,
			@PathVariable Optional<Integer> idx, SearchVO searchVO, Model model, Locale locale) {
		if(0 >= seq.get()) {
			if("PC".equals(getCurrentDeviceType())) {
				return "redirect:/prroom/press";
			} else {
				return "redirect:"+Constant.MOBILE_START_PATH+"prroom/press";
			}
		}

		PressVO pressVO = new PressVO();
		pressVO.setSeq(seq.get());
		pressVO.setDispYn("Y");
		//pressVO.setLang(locale.getLanguage().toUpperCase());
		
		PressVO press = contentsService.getPressBy(pressVO);
		if(null == press) {
			if("PC".equals(getCurrentDeviceType())) {
				return "redirect:/prroom/press";
			} else {
				return "redirect:"+Constant.MOBILE_START_PATH+"prroom/press";
			}
			
		}

		searchVO.setSeq(Integer.toString(seq.get()));
		searchVO.setSearchDispYn("Y");
		
		List<PressVO> pressByPrevNexts = contentsService.getPressByPrevNext(searchVO);
		
		session.setAttribute("pressPrevPageSeq", seq.get());
		
		model.addAttribute("pressVO", press);
		model.addAttribute("pressPrev", pressByPrevNexts.stream().filter(x -> "PREV".equals(x.getBtnNm())).collect(Collectors.toList()));
		model.addAttribute("pressNext", pressByPrevNexts.stream().filter(x -> "NEXT".equals(x.getBtnNm())).collect(Collectors.toList()));

		return frontViewPath() + "/press_view";
	}

	/**
	 * 기업브로슈어
	 * @return
	 */
	@GetMapping("brochure")
	public String brochure(Locale locale) {
		return frontViewPath() + "/brochure";
	}

	/**
	 * 홍보영상
	 * @return
	 */
	@GetMapping("promotional")
	public String promotional(Locale locale) {
		return frontViewPath() + "/promotional";
	}
}

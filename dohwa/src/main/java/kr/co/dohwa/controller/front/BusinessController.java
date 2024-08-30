package kr.co.dohwa.controller.front;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import kr.co.dohwa.service.CodeService;
import kr.co.dohwa.service.ProjectService;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.ProjectVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 사업 소개
 * @author PARK
 */
@Controller
@RequestMapping({"business", Constant.MOBILE_START_PATH + "business"})
public class BusinessController extends BaseController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private CodeService codeService;
	
	/**
	 * 프로젝트 overview
	 * @return
	 */
	@GetMapping
	public String overview() {
		return frontViewPath() + "/overview";
	}
	
	/**
	 * 프로젝트 리스트 페이지
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@GetMapping("project")
	public String project(HttpServletRequest request, HttpSession session, SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(8);
		List<CodeVO> projectItemList = codeService.getProjectItemList();
		
		if(null != session.getAttribute("projectPrevPageSeq")) {
			model.addAttribute("projectPrevPageSeq", session.getAttribute("projectPrevPageSeq"));
			session.removeAttribute("projectPrevPageSeq");
		}
		
		model.addAttribute("searchType", searchVO.getSearchType());
		model.addAttribute("rpp", searchVO.getRowPerPage());
		model.addAttribute("projectItemList", projectItemList);
		
		return frontViewPath() + "/project_list";
	}
	
	/**
	 * 프로젝트 리스트
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@PostMapping("project/list")
	@ResponseBody
	public Map<String, Object> projectList(@RequestBody SearchVO searchVO, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDeviceType(getCurrentDeviceType());
		
		int count = projectService.getProjectFrontCount(searchVO);
		List<ProjectVO> projectList = projectService.getProjectFrontList(searchVO);
		
		map.put("count", count);
		map.put("list", projectList);
		
		return map;
	}
	
	/**
	 * 프로젝트 리스트 더보기
	 * @param searchVO
	 * @param model
	 * @param locale
	 * @return
	 */
	@PostMapping("project/more")
	@ResponseBody
	public Map<String, Object> projectMore(@RequestBody SearchVO searchVO, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		searchVO.setSearchDispYn("Y");
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDeviceType(getCurrentDeviceType());

		int count = projectService.getProjectFrontCount(searchVO);
		List<ProjectVO> projectList = projectService.getProjectFrontList(searchVO);
		
		map.put("count", count);
		map.put("list", projectList);
		
		return map;
	}
	
	/**
	 * 프로젝트 상세
	 * @param seq
	 * @param projectVO
	 * @param model
	 * @return
	 */
	@GetMapping({"project/{seq}", "project/preview/{seq}"})
	public String projectView(@PathVariable Optional<Integer> seq, HttpServletRequest request, 
			HttpSession session,
			Locale locale, Model model) {
		String uri = request.getRequestURI();
		
		if(0 >= seq.get() && !uri.contains("/project/preview/")) {
			return "redirect:/business/project";
		}

		SearchVO searchVO = new SearchVO();
		searchVO.setSeq(Integer.toString(seq.get()));
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDeviceType(getCurrentDeviceType());
		
		// 관리자 화면에서 미리보기 할때는 노출 여부 체크 안함
		if(!StringUtils.isEmpty(uri) && uri.contains("/project/preview/")) {
			searchVO.setSearchDispYn("");
		} else {
			searchVO.setSearchDispYn("Y");
		}
		
		ProjectVO project = projectService.getProjectFront(searchVO);
		
		if(null == project) {
			return "redirect:/business/project";
		}
		
		session.setAttribute("projectPrevPageSeq", seq.get());
		
		model.addAttribute("projectVO", project);
		
		return frontViewPath() + "/project_view";
	}
	
	/**
	 * 프로젝트 썸네일 리스트
	 * @param code
	 * @param locale
	 * @return
	 */
	@ResponseBody
	@GetMapping("project/item/{code}")
	public Map<String, Object> projectThumList(@PathVariable Optional<String> code, Locale locale) {
		Map<String, Object> map = Maps.newHashMap();
		
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchLangType(locale.getLanguage().toUpperCase());
		searchVO.setSearchDeviceType(getCurrentDeviceType());
		searchVO.setSearchType1(code.get());
		
		List<ProjectVO> projectThumList = projectService.getProjectThumList(searchVO);
		
		map.put("list", projectThumList);
		
		return map;
	}
}

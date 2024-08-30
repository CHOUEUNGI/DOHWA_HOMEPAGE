package kr.co.dohwa.controller.admin;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.CodeService;
import kr.co.dohwa.service.FileService;
import kr.co.dohwa.service.ProjectService;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.validator.FileUploadValidator;
import kr.co.dohwa.validator.ProjectFileUploadValidator;
import kr.co.dohwa.validator.ProjectValidator;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.MultipartFileVO;
import kr.co.dohwa.vo.ProjectVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * Project 관련
 *
 * @author PARK
 *
 */
@Controller
@RequestMapping("/admin/project")
public class ProjectController {

	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;

	@Autowired
	private ProjectFileUploadValidator fileUploadValidator;

	@Autowired
	private ProjectValidator projectValidator;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private FileService fileService;

	@Autowired
	private CodeService codeService;

	/**
	 *  프로젝트 조회
	 * @return
	 */
	@GetMapping
	public String list(HttpServletRequest request, SearchVO searchVO, Model model) {
		searchVO.setRowPerPage(20);

		Paging paging = new Paging(10);
		paging.setPageSize(20);
		
		int count = projectService.getProjectCount(searchVO);
		paging.setPageNo(Integer.parseInt(searchVO.getPage()));
		paging.setTotalCount(count);

		List<CodeVO> projectItemList = codeService.getProjectItemList();

		model.addAttribute("page", paging);
		model.addAttribute("markets", projectItemList.stream().filter(x -> (x.getCode().equals("MARKET")  || x.getParentCode().equals("MARKET")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
		model.addAttribute("services", projectItemList.stream().filter(x -> (x.getCode().equals("SERVICE") || x.getParentCode().equals("SERVICE")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
		model.addAttribute("regions", projectItemList.stream().filter(x -> (x.getCode().equals("REGION")  || x.getParentCode().equals("REGION")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
		model.addAttribute("list", projectService.getProjectList(searchVO));

		return "/admin/project/list";
	}

	/**
	 *  프로젝트 상세 조회
	 * @return
	 */
	@GetMapping({"view", "view/{seq}"})
	public String view(@PathVariable Optional<Integer> seq, ProjectVO projectVO, Model model) {
		// 신규
		if(!seq.isPresent()) {
			model.addAttribute("projectVO", new ProjectVO());
		// 상세
		} else {
			projectVO.setSeq(seq.get());
			model.addAttribute("projectVO", projectService.getProject(projectVO));
		}

		List<CodeVO> projectItemList = codeService.getProjectItemList();

		model.addAttribute("markets", projectItemList.stream().filter(x -> (x.getCode().equals("MARKET")  || x.getParentCode().equals("MARKET")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
		model.addAttribute("services", projectItemList.stream().filter(x -> (x.getCode().equals("SERVICE") || x.getParentCode().equals("SERVICE")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
		model.addAttribute("regions", projectItemList.stream().filter(x -> (x.getCode().equals("REGION")  || x.getParentCode().equals("REGION")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));

		return "/admin/project/view";
	}

	/**
	 * 프로젝트 저장
	 * @return
	 */
	@PostMapping("proc")
	public String proc(HttpServletRequest request,
			ProjectVO projectVO,
			BindingResult fileResult, BindingResult result, Model model) {

		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_IMAGE_EXT);

		// 파일 체크
		fileUploadValidator.validate(multipartFileVO, fileResult);

		if(fileResult.hasErrors()) {
			for (Object object : fileResult.getFieldErrors()) {
			    if(object instanceof FieldError) {
			        FieldError fieldError = (FieldError) object;
			        if(fieldError.getField().equals("message")) {
			        	projectVO.setMessage(fieldError.getCode());
			        }
			    }
			}
		}

		// 프로젝트 관리 체크
		projectValidator.validate(projectVO, result);

		if(result.hasErrors()) {
			List<FileVO> reFileList = Lists.newArrayList();

			if(null != projectVO && null != projectVO.getSeq()) {
				FileVO fileVO = new FileVO();
				fileVO.setAttSeq(projectVO.getSeq());
				fileVO.setAttType("PROJECT");

				List<FileVO> fileList = fileService.getFileList(fileVO);

				for (FileVO file : fileList) {
					if(file.getType().equalsIgnoreCase("MAIN") && 1 == file.getAttOrder()) {
						projectVO.setMainFileName1(file.getOrgName());
						projectVO.setMainFileId1(file.getId());
					} else if(file.getType().equalsIgnoreCase("MAIN") && 2 == file.getAttOrder()) {
						projectVO.setMainFileName2(file.getOrgName());
						projectVO.setMainFileId2(file.getId());
					} else {
						reFileList.add(file);
					}
				}
			}

			if(null != projectVO.getFileOrders()) {
				for (int i = 0; i < projectVO.getFileOrders().size(); i++) {
					FileVO file = new FileVO();
					file.setAttOrder(Integer.parseInt(projectVO.getFileOrders().get(i)));

					reFileList.add(file);
					reFileList.add(file);
				}
			}

			reFileList = reFileList.stream().sorted(Comparator.comparingInt(FileVO::getAttOrder)).collect(Collectors.toList());

			projectVO.setFiles(reFileList);

			List<CodeVO> projectItemList = codeService.getProjectItemList();

			if(null != projectVO && null != projectVO.getSeq()) {
				ProjectVO detailProject = projectService.getProject(projectVO);
				projectVO.setRegDt(detailProject.getRegDt());
			}

			model.addAttribute("markets", projectItemList.stream().filter(x -> (x.getCode().equals("MARKET")  || x.getParentCode().equals("MARKET")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
			model.addAttribute("services", projectItemList.stream().filter(x -> (x.getCode().equals("SERVICE") || x.getParentCode().equals("SERVICE")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));
			model.addAttribute("regions", projectItemList.stream().filter(x -> (x.getCode().equals("REGION")  || x.getParentCode().equals("REGION")) && !x.getParentCode().equals("PROJECT_ITEM")).collect(Collectors.toList()));

			return "/admin/project/view";
		}

		String message = "";
		// 등록
		if(null == projectVO.getSeq()) {
			message = projectService.insertProject(request, projectVO);
		// 변경
		} else {
			message = projectService.updateProject(request, projectVO);
		}

		addMessage(request, message);

		return "redirect:/admin/project";
	}

	/**
	 * 프로젝트 노출/비노출 처리
	 * @param seq
	 * @return
	 */
	@PostMapping("/disp")
	@ResponseBody
	public Map<String, Object> disp(@RequestBody ProjectVO projectVO) {
		Map<String, Object> map = Maps.newHashMap();

		String message = projectService.updateProjectDisp(projectVO);

		map.put("message", message);

		return map;
	}

	/**
	 * 프로젝트 삭제
	 * @param seqs
	 * @return
	 */
	@DeleteMapping
	public String delete(HttpServletRequest request, @RequestParam(value = "seqs") List<Integer> seqs) {
		addMessage(request, projectService.deleteProject(seqs));

		return "redirect:/admin/project";
	}

	/**
	 * 프로젝트 항목 조회 화면
	 * @return
	 */
	@GetMapping("item")
	public String item(HttpServletRequest request, SearchVO searchVO, CodeVO codeVO, Model model) {
		// 프로젝트 항목 관리 코드 조회
		CodeVO parentCodeVO = new CodeVO();
		parentCodeVO.setParentCode("PROJECT_ITEM");

		List<CodeVO> parentCodeList = codeService.getCodeList(parentCodeVO);

		if(StringUtils.isEmpty(searchVO.getSearchType())) {
			searchVO.setSearchType("MARKET");
		}

		codeVO.setParentCode(searchVO.getSearchType());

		model.addAttribute("parentCodes", parentCodeList);
		model.addAttribute("codes", codeService.getCodeList(codeVO));

		return "/admin/project/item";
	}

	/**
	 * 프로젝트 항목 조회
	 * @param code
	 * @return
	 */
	@GetMapping("/item/{code}")
	@ResponseBody
	public Map<String, Object> getItem(@PathVariable Optional<String> code) {
		Map<String, Object> map = Maps.newHashMap();

		if(code.isPresent()) {
			CodeVO codeVO = new CodeVO();
			codeVO.setParentCode(code.get());

			map.put("codes", codeService.getCodeList(codeVO));
		}

		return map;
	}

	/**
	 * 프로젝트 항목 조회
	 * @param code
	 * @return
	 */
	@GetMapping("/item/get/{code}")
	@ResponseBody
	public Map<String, Object> getUseYnItem(@PathVariable Optional<String> code) {
		Map<String, Object> map = Maps.newHashMap();

		if(code.isPresent()) {
			CodeVO codeVO = new CodeVO();
			codeVO.setParentCode(code.get());
			codeVO.setUseYn("Y");

			map.put("codes", codeService.getCodeList(codeVO));
		}

		return map;
	}

	/**
	 * 프로젝트 항목 조회
	 * @param codeVOs
	 * @return
	 */
	@PostMapping("/item/proc")
	@ResponseBody
	public Map<String, Object> itemProc(@RequestBody List<CodeVO> codeVOs, Authentication authentication) {
		Map<String, Object> map = Maps.newHashMap();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		map.put("list", codeVOs);
		map.put("regId", userDetails.getUsername());

		String message = codeService.insertMerge(map);

		map.clear();
		map.put("message", message);

		return map;
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

package kr.co.dohwa.controller.admin;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dohwa.aop.AdminKeepCondtion;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.constants.PathType;
import kr.co.dohwa.service.AboutUsService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.util.Paging;
import kr.co.dohwa.validator.CustInqrValidator;
import kr.co.dohwa.vo.CustInqrVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 관련
 *
 * @author PARK
 *
 */
@Slf4j
@Controller
@RequestMapping("/admin/custInqr")
public class CustInqrController {

	@Value("#{config['dohwa.cust.inqr.answ.email']}")
	private String DOHWA_CUST_INQR_ANSW_EMAIL;

	@Autowired
	private AboutUsService aboutUsService;

	@Autowired
	private CustInqrValidator custInqrValidator;

	@Autowired
	private MessageSource messageSource;

	/**
	 *  고객문의 관리 > 리스트
	 * @return
	 */
	@AdminKeepCondtion
	@RequestMapping({"", "/"})
	public String getCustInqrList(HttpServletRequest request, SearchVO searchVO, Model model) {

		Paging paging = new Paging(5);	// 기본 목록 10개씩
		int count = aboutUsService.getCustInqrTotCnt(searchVO);	// 카운트 쿼리
		paging.setPageNo(Integer.parseInt(searchVO.getPage()));	// 현재 페이지
		paging.setTotalCount(count);	// 전체 건 수
		model.addAttribute("page", paging);

		//searchVO.setOffsetStartNumber(paging.getStartRowNum());
		//searchVO.setRowPerPage(paging.getPageSize());
		model.addAttribute("list", aboutUsService.getCustInqrList(searchVO));

		model.addAttribute("searchVO", searchVO);
		return "admin/custInqr/list";
	}

	/**
	 *  고객문의관리 > 삭제
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/delete")
	@ResponseBody
	public Map<String, Object> getInvestReferDelete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			aboutUsService.deleteCustInqr(request.getParameter("arrSeq").split(","), PathType.getPathTypeCode(Optional.of("custInqr")));
			map.put("success", true);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "삭제" }, Locale.KOREA));
		}catch(Exception e) {
			map.put("success", false);
			map.put("message", messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] { "삭제" }, Locale.KOREA));
		}
		return map;
	}

	/**
	 *  고객문의관리 > 수정
	 * @return
	 * @throws IOException
	 */
	@RequestMapping({"/{pathSeq}"})
	public String getCustInqrDetail(@PathVariable Optional<String> pathSeq, HttpServletRequest request, CustInqrVO custInqrVO, BindingResult result, Model model, Principal principal) throws IOException {
		if(pathSeq.isPresent() && Integer.parseInt(pathSeq.get()) > 0) {
			SearchVO searchVO = new SearchVO();
			searchVO.setSeq(pathSeq.get());
			searchVO.setRowPerPage(0);
			searchVO.setOffsetStartNumber(-1);
			List<CustInqrVO> list = aboutUsService.getCustInqrList(searchVO);
			if(list != null && !list.isEmpty()) {
				//_method
				String _method = request.getParameter("_method");
				if("update".equals(_method)) {
					custInqrValidator.validate(custInqrVO, result);
					if(result.hasErrors()) {
						return "admin/custInqr/detail";
					} else {
						custInqrVO.setSeq(Integer.parseInt(pathSeq.get()));
						custInqrVO.setEmail(list.get(0).getEmail());
						custInqrVO.setTitle(list.get(0).getTitle());
						custInqrVO.setUpdId(principal.getName());
						custInqrVO.setUpdIp(CommonUtils.getClientIP(request));
						custInqrVO.setRegNm(list.get(0).getRegNm());
						custInqrVO.setCont(list.get(0).getCont());
						custInqrVO.setLang(list.get(0).getLang());
						aboutUsService.updateCustInqr(request, custInqrVO);
						addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "수정" }, Locale.KOREA));
						return "redirect:/admin/custInqr";
					}
				} else if("sendEmail".equals(_method)) {
					aboutUsService.sendEmailForAnsw(request, list.get(0));
					addMessage(request, messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] { "이메일 발송" }, Locale.KOREA));
					return "redirect:/admin/custInqr";
				} else {
					model.addAttribute("custInqrVO", list.get(0));
					return "admin/custInqr/detail";
				}
			} else {
				return "error:404";
			}

		} else {
			return "error:404";
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

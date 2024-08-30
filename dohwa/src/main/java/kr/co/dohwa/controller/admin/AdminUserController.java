package kr.co.dohwa.controller.admin;

import java.time.LocalDateTime;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.validator.AdminUserAddValidator;
import kr.co.dohwa.validator.AdminUserPasswordValidator;
import kr.co.dohwa.vo.AdminUserVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 관련
 *
 * @author PARK
 *
 */
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminUserController {

	@Autowired
	private AdminUserAddValidator adminUserAddValidator;

	@Autowired
	private AdminUserPasswordValidator adminUserPasswordValidator;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MessageSource messageSource;
	
	/**
	 * 로그인 페이지
	 * @param authentication
	 * @return
	 */
	@RequestMapping(value = {"login", "loginProc"})
	public String login(HttpServletRequest request, Authentication authentication) {
		if(null != authentication && authentication.isAuthenticated()) {
			return "redirect:/admin/main/banner";
		}
		return "admin/login";
	}

	/**
	 * 사용자 비밀번호 변경
	 * 
	 * @return
	 */
	@PostMapping("/user/pswd")
	@ResponseBody
	public Map<String, Object> changePassword(AdminUserVO adminUserVO, BindingResult result, Authentication authentication) {
		Map<String, Object> map = Maps.newHashMap();
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		adminUserVO.setId(userDetails.getUsername());
		
		adminUserPasswordValidator.validate(adminUserVO, result);
		
		if(result.hasErrors()) {
			map.put("message", result.getFieldError("pswd").getCode());
			return map;
		}
		
		adminUserVO.setPswd(passwordEncoder.encode(adminUserVO.getUpdPswd()));
		adminUserVO.setPswdUpdDt(LocalDateTime.now());
		adminUserVO.setUpdDt(LocalDateTime.now());
		adminUserVO.setUpdId(userDetails.getUsername());
		
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"비밀번호 변경"}, Locale.KOREA);
		
		int resultCount = adminUserService.updateAdminUserChangePassword(adminUserVO);
		if(0 < resultCount) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"비밀번호 변경"}, Locale.KOREA);
		}
		
		map.put("message", message);
		map.put("success", 0 < resultCount ? true : false);
		
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

package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.vo.AdminUserVO;

/**
 * 관리자 비밀번호
 * 
 * @author PARK
 *
 */
@Component
public class AdminUserPasswordValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return AdminUserVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		AdminUserVO adminUserVO = (AdminUserVO) target;
		
		AdminUserVO findByVO = adminUserService.findById(adminUserVO.getId());
		if(null != findByVO) {
			
			// 기존 비밀번호 확인
			if(!passwordEncoder.matches(adminUserVO.getPswd(), findByVO.getPswd())) {
				errors.rejectValue("pswd", messageSource.getMessage("ADMIN.CHANGE.PASSWORD_WRONG", null, Locale.KOREA));
				
			// 변경 비밀번호 자리수
			} else if(!StringUtils.isEmpty(adminUserVO.getUpdPswd()) && 8 > adminUserVO.getUpdPswd().length()) {
				errors.rejectValue("pswd", messageSource.getMessage("ADMIN.CHANGE.PASSWORD_LENGTH", null, Locale.KOREA));
			
			// 비밀번호 확인
			} else if(StringUtils.isEmpty(adminUserVO.getUpdPswd()) || StringUtils.isEmpty(adminUserVO.getUpdPswdRe()) || 
					!adminUserVO.getUpdPswd().equals(adminUserVO.getUpdPswdRe())) {
				errors.rejectValue("pswd", messageSource.getMessage("ADMIN.CHANGE.PASSWORD_CONFIRM", null, Locale.KOREA));
			}
		}
	}
	
}

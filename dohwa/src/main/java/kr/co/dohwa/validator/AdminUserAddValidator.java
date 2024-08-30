package kr.co.dohwa.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.vo.AdminUserVO;

/**
 * 관리자 추가 체크
 * @author PARK
 *
 */
@Component
public class AdminUserAddValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return AdminUserVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		AdminUserVO adminUser = (AdminUserVO) target;
		
		AdminUserVO findByVO = adminUserService.findById(adminUser.getId());
		if(null != findByVO) {
			
		}
	}
	
}

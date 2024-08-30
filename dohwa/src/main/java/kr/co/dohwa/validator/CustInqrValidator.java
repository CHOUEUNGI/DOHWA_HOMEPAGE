package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.service.InvestService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.util.ValidationUtil;
import kr.co.dohwa.vo.CustInqrVO;

/**
 * 투자정보 관리 Validator
 *
 * @author PARK
 *
 */
@Component
public class CustInqrValidator implements Validator {

	@Autowired
	private ValidationUtil validationUtil;

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-custInqr-ext']}")
	private String FILE_UPLOAD_CUST_INQR_EXT;

	@Override
	public boolean supports(Class<?> clazz) {
		return InvestService.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Locale sessionLocale = CommonUtils.getSessionLocale();
		if(target instanceof CustInqrVO) {
			CustInqrVO custInqrVO = (CustInqrVO) target;
			if("front".equals(custInqrVO.getPageType())) {
				validationUtil.checkNotEmpty(custInqrVO.getRegNm(), errors, "regNm", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.NAME", null, sessionLocale) }, false);
				
				if(StringUtils.isEmpty(custInqrVO.getEmail()) || StringUtils.isEmpty(custInqrVO.getEmailDomain()) ) {
					validationUtil.checkNotEmpty("", errors, "email", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.EMAIL", null, sessionLocale) }, false);

				} else {
					if(!validationUtil.isEmailAddr(custInqrVO.getEmail()+"@"+custInqrVO.getEmailDomain())) {
						errors.rejectValue("email", "error.email", messageSource.getMessage("FRONT.VALIDATE.EMAIL.CHECK", null, sessionLocale));
					}
				}
				
				if(!StringUtils.isEmpty(custInqrVO.getTel1()) && !StringUtils.isEmpty(custInqrVO.getTel2()) && !StringUtils.isEmpty(custInqrVO.getTel3()) ) {
					custInqrVO.setTel(custInqrVO.getTel1()+custInqrVO.getTel2()+custInqrVO.getTel3());
				}
				validationUtil.checkNotEmpty(custInqrVO.getTel(), errors, "tel", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.TEL", null, sessionLocale) }, false);
				if(!StringUtils.isEmpty(custInqrVO.getTel()) && !validationUtil.isOnlyNumber(custInqrVO.getTel().replaceAll("-", ""), -1)) {
					errors.rejectValue("tel", "error.tel", messageSource.getMessage("FRONT.VALIDATE.ONLYNUMBER", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.TEL", null, sessionLocale) }, sessionLocale));
				}
				
				validationUtil.checkNotEmpty(custInqrVO.getTitle(), errors, "title", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.TITLE", null, sessionLocale) }, false);
				
				validationUtil.checkNotEmpty(custInqrVO.getCont(), errors, "cont", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.CONT", null, sessionLocale) }, false);

				// 첨부파일 유효성 검증
				if(!StringUtils.isEmpty(custInqrVO.getMessage())) {
					// 필수등록이 아니므로 예외 처리
					if(!custInqrVO.getMessage().equalsIgnoreCase(messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EMPTY", null, Locale.KOREA))) { //  등록 여부가 아니면 확장자 오류 이므로.
						errors.rejectValue("file", "error.file", messageSource.getMessage("FRONT.VALIDATE.FILE.UPLOAD.EXT", new String[] {FILE_UPLOAD_CUST_INQR_EXT}, sessionLocale).replace("\\n", " "));	// 확장자 오류
					}
				}

			} else {
				validationUtil.checkNotEmpty(custInqrVO.getAnsw(), errors, "answ", new String[] { "답변" });
			}


		}
	}

}

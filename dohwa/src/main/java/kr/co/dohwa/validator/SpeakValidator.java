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
import kr.co.dohwa.vo.SpeakVO;

/**
 * 윤리경영 제보라인 Validator
 *
 * @author PARK
 *
 */
@Component
public class SpeakValidator implements Validator {

	@Autowired
	private ValidationUtil validationUtil;

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-speak-ext']}")
	private String FILE_UPLOAD_SPEAK_EXT;

	@Override
	public boolean supports(Class<?> clazz) {
		return InvestService.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Locale sessionLocale = CommonUtils.getSessionLocale();
		if(target instanceof SpeakVO) {
			SpeakVO speakVO = (SpeakVO) target;

			// 실명 체크
			if("N".equals(speakVO.getAnonymous())) {
				validationUtil.checkNotEmpty(speakVO.getName(), errors, "name", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.NAME", null, sessionLocale) }, false);
				
				// 핸드폰번호 유형 체크
				String mobile = speakVO.getMobile1() + speakVO.getMobile2() + speakVO.getMobile3();
				boolean isMobileErr = false;
				if(!StringUtils.isEmpty(mobile) && !mobile.matches("^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$")) {
					errors.rejectValue("mobile1", "error.mobile1", messageSource.getMessage("FRONT.VALIDATE.MOBILE.CHECK", null, sessionLocale));
					isMobileErr = true;
				}
				if(!isMobileErr) {
					if(StringUtils.isEmpty(speakVO.getMobile1()) || StringUtils.isEmpty(speakVO.getMobile2()) || StringUtils.isEmpty(speakVO.getMobile3())) {
						errors.rejectValue("mobile1", "error.mobile1", messageSource.getMessage("FRONT.VALIDATE.REQUIRED", new String[] { messageSource.getMessage("FRONT.COMMON.MENU.SPEAK.002.001.032", null, sessionLocale) }, sessionLocale));
					}
				}
				
				if(StringUtils.isEmpty(speakVO.getEmail1()) || StringUtils.isEmpty(speakVO.getEmail2())) {
					errors.rejectValue("email1", "error.email1", messageSource.getMessage("FRONT.VALIDATE.REQUIRED", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.EMAIL", null, sessionLocale) }, sessionLocale));
				} else {
					// 이메일번호 유형 체크
					String email = speakVO.getEmail1() + "@" + speakVO.getEmail2();
					if(!validationUtil.isEmailAddr(email)) {
						errors.rejectValue("email1", "error.email1", messageSource.getMessage("FRONT.VALIDATE.EMAIL.CHECK", null, sessionLocale));
					}
				}
				
				// 비밀번호, 비밀번호 확인 체크
				if (!StringUtils.isEmpty(speakVO.getPassword()) && !StringUtils.isEmpty(speakVO.getPasswordConfirm())) {
					if (!speakVO.getPassword().equals(speakVO.getPasswordConfirm())) {
						errors.rejectValue("passwordConfirm", "error.passwordConfirm", messageSource.getMessage("FRONT.VALIDATE.PASSWORD.CHECK", null, sessionLocale));
					}
				} else {
					validationUtil.checkNotEmpty(speakVO.getPassword(), errors, "password", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.PASSWORD", null, sessionLocale) }, false);
					validationUtil.checkNotEmpty(speakVO.getPasswordConfirm(), errors, "passwordConfirm", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.PASSWORDCONFIRM", null, sessionLocale) }, false);
				}
			}
			validationUtil.checkNotEmpty(speakVO.getTitle(), errors, "title", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.TITLE", null, sessionLocale) }, false);
			validationUtil.checkNotEmpty(speakVO.getWho(), errors, "who", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.WHO", null, sessionLocale) }, false);
			validationUtil.checkNotEmpty(speakVO.getWherewhen(), errors, "wherewhen", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.WHEREWHEN", null, sessionLocale) }, false);
			validationUtil.checkNotEmpty(speakVO.getSpeakContent(), errors, "speakContent", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.CONT", null, sessionLocale) }, false);
			if(speakVO.getSpeakContent() == null)  {
				errors.rejectValue("speakContent", "error.speakContent", messageSource.getMessage("FRONT.VALIDATE.REQUIRED", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.CONT", null, sessionLocale) }, sessionLocale));
			} else if(speakVO.getSpeakContent().length() < 5 || speakVO.getSpeakContent().length() > 2000) {
				errors.rejectValue("speakContent", "error.speakContent", messageSource.getMessage("FRONT.VALIDATE.MINLEN.MAXLEN", new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME.CONT", null, sessionLocale), "5", "2000" }, sessionLocale));
			}

			// 첨부파일 유효성 검증
			if(!StringUtils.isEmpty(speakVO.getMessage())) {
				// 필수등록이 아니므로 예외 처리
				if(!speakVO.getMessage().equalsIgnoreCase(messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EMPTY", null, Locale.KOREA))) { //  등록 여부가 아니면 확장자 오류 이므로.
					errors.rejectValue("file", "error.file", messageSource.getMessage("FRONT.VALIDATE.FILE.UPLOAD.EXT", new String[] {FILE_UPLOAD_SPEAK_EXT}, sessionLocale).replace("\\n", " "));	// 확장자 오류
				}
			}
		}
	}

}

package kr.co.dohwa.util;

import java.util.Locale;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

@Component
public class ValidationUtil {

	@Autowired
	private MessageSource messageSource;

	/**
	 * (소수점포함)숫자만 있는  지 여부 체크.
	 * @param str	비교대상 문자열
	 * @param maxlength	문자열의 최대 허용 길이. 1보다 작으면 체크 안하고, 1 이상부터 길이체크람.
	 * @return true면 유효성검증성공, false면 유효성 검증 실패
	 */
	public boolean isOnlyNumber(String str, int maxlength) {
		boolean isRet = false;
		if(StringUtils.isNotEmpty(str)) {
			//String regExp = "^[0-9]+$";
			String regExp = "^[+\\-]?[0-9]*\\.?[0-9]*";

			if(str.matches(regExp)) {
				isRet = true;
				if(maxlength > 0) {
					if(str.length() > maxlength) {
						isRet = false;
					}
				}
			}
		}
		return isRet;
	}
	
	/**
	 * 이메일 주소 유효성 검증
	 * @param str
	 * @return
	 */
	public boolean isEmailAddr(String str) {
		boolean isRet = false;
		
		//정규식
//		if(str.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$")) {
//			isRet = true;
//		}
		
		// 아파치 방식
		try {
			InternetAddress emailAddr = new InternetAddress(str);
			emailAddr.validate();
			isRet = true;
		} catch (AddressException ex) {
			isRet = false;
		}
		
		return isRet;
	}

	/**
	 * 값 필수. 숫자값만 입력. 자릿수 체크
	 * @param value	필드값
	 * @param maxlength	문자열의 최대 허용 길이. 1보다 작으면 체크 안하고, 1 이상부터 길이체크함.
	 * @param errors	스프링 validation Errors 객체
	 * @param field	필드명
	 * @param msgParams	메시지프로퍼티에 대입할 치환 문자배열
	 */
	public void checkOnlyNumber(Object value, int maxlength, Errors errors, String field, String[] msgParams) {
		String str = String.valueOf(value);
		if(value == null) {
			str = "";
		}
		if(StringUtils.isEmpty(str)) {
			errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", msgParams, Locale.getDefault()));
		} else if(!this.isOnlyNumber(str, maxlength)) {
			if(maxlength > 0) {
				errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.ONLYNUMBER.MAXLENGTH", msgParams, Locale.getDefault()));
			} else {
				errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.ONLYNUMBER", msgParams, Locale.getDefault()));
			}
		}
	}

	/**
	 * 값 필수. 숫자값만 입력. 최대숫자크기 체크
	 * @param value	필드값
	 * @param maxvalue	최대숫자. 0이면 체크 안 함
	 * @param errors	스프링 validation Errors 객체
	 * @param field	필드명
	 * @param msgParams	메시지프로퍼티에 대입할 치환 문자배열
	 */
	public void checkOnlyNumberLimit(Object value, double maxvalue, Errors errors, String field, String[] msgParams) {
		String str = String.valueOf(value);
		if(value == null) {
			str = "";
		}
		if(StringUtils.isEmpty(str)) {
			errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", msgParams, Locale.getDefault()));
		} else if(!this.isOnlyNumber(str, 0)) {
			errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.ONLYNUMBER", msgParams, Locale.getDefault()));
		} else {
			if(maxvalue > 0 && Double.parseDouble(str) > maxvalue) {
				errors.rejectValue(field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.ONLYNUMBER.MAXVALUE", msgParams, Locale.getDefault()));
			}
		}
	}

	/**
	 * 필수값 체크(어드민 전용)
	 * @param value 필드값
	 * @param errors	스프링 validation Errors 객체
	 * @param field	필드명
	 * @param msgParams	메시지프로퍼티에 대입할 치환 문자배열
	 */
	public void checkNotEmpty(Object value, Errors errors, String field, String[] msgParams) {
		checkNotEmpty(value, errors, field, msgParams, true);
	}
	/**
	 * 필수값 체크
	 * @param value 필드값
	 * @param errors	스프링 validation Errors 객체
	 * @param field	필드명
	 * @param msgParams	메시지프로퍼티에 대입할 치환 문자배열
	 * @param isAdmin	true명 어드민, 아니면 프론트용 메시지 리턴
	 */
	public void checkNotEmpty(Object value, Errors errors, String field, String[] msgParams, boolean isAdmin) {

		Locale sessionLocale = CommonUtils.getSessionLocale();

		String str = String.valueOf(value);
		if(value == null) {
			str = "";
		}
		if(!isAdmin && (msgParams == null || msgParams.length == 0)) {
			msgParams = new String[] { messageSource.getMessage("FRONT.VALIDATE.VAR.NAME."+field, null, sessionLocale) };
		}
		if(StringUtils.isEmpty(str)) {
			errors.rejectValue(field, "error."+field, messageSource.getMessage((isAdmin ? "ADMIN" : "FRONT")+".VALIDATE.REQUIRED", msgParams, (isAdmin ? Locale.getDefault() : sessionLocale)));
		}
	}



}

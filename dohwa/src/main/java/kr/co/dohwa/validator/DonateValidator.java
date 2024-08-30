package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.co.dohwa.vo.DonateVO;

/**
 * 보도자료 관리 Validator
 * 
 * @author PARK
 *
 */
@Component
public class DonateValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return DonateVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		DonateVO donateVO = (DonateVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "typeCode", 	"error.typeCode",  	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "구분)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "koTitle", 	"error.koTitle",  	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(국문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "enTitle", 	"error.enTitle", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(영문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "esTitle", 	"error.esTitle", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(스페인)" }, Locale.KOREA));
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Cont", 		"error.Cont", 		messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "내용" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "writeDt",	"error.writeDt",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "등록일자" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispYn", 	"error.dispYn", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "공개여부" }, Locale.KOREA));
	}
}

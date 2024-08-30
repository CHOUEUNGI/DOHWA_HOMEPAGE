package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dohwa.vo.LicenseVO;

/**
 * 면허 관리 Validator
 * @author KYoung
 */
@Component
public class LicenseValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return LicenseVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispYn", "error.dispYn", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "공개여부" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "koTitle", "error.koTitle", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "업면허 명(국문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "enTitle", "error.enTitle", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "업면허 명(영문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "esTitle", "error.esTitle", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "업면허 명(스페인어)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "acquireDt", "error.acquireDt", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "취득일자" }, Locale.KOREA));
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "koIssueAgency", "error.koIssueAgency", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "발급기관(국문)" }, Locale.KOREA));
		
		LicenseVO licenseVO = (LicenseVO) target;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) licenseVO.getMultipartFileVO().getRequest();
		MultiValueMap<String, MultipartFile> fileMap = multipartRequest.getMultiFileMap();
		
		fileMap.forEach((key, list) -> {
			String field = key.equals("PC_FILE_1") ? "pcMessage" : "moMessage";
			
			if (key.contains("PC_FILE_1") && list.get(0).isEmpty()) {
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 첨부파일" }, Locale.KOREA));
			}
			
			String extName = list.get(0).getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if (!list.get(0).isEmpty() && !licenseVO.getMultipartFileVO().getFileExt().contains(extName)) {
				
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { licenseVO.getMultipartFileVO().getFileExt() }, Locale.KOREA));
			}
		});
	}
}

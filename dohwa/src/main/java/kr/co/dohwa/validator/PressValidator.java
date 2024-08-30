package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.co.dohwa.vo.PressVO;

/**
 * 보도자료 관리 Validator
 * 
 * @author PARK
 *
 */
@Component
public class PressValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return PressVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PressVO pressVO = (PressVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Title", 		"error.Title",  	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "제목)" }, Locale.KOREA));
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subTitle", 	"error.subTitle", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "부제목" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Cont", 		"error.Cont", 		messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "내용" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "writeDt",		"error.writeDt",		messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "등록일자" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispYn", 	"error.dispYn", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "공개여부" }, Locale.KOREA));
		
		/*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) pressVO.getMultipartFileVO().getRequest();
		MultiValueMap<String, MultipartFile> fileMap = multipartRequest.getMultiFileMap();
		
		fileMap.forEach((key, list) -> {
			
			String field = key.contains("PC") ? "pcMessage" : "moMessage";
			
			if (key.contains("PC") && list.get(0).isEmpty()) {
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 첨부파일" }, Locale.KOREA));
			}
			
			String extName = list.get(0).getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if (!list.get(0).isEmpty() && !pressVO.getMultipartFileVO().getFileExt().contains(extName)) {
				
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { pressVO.getMultipartFileVO().getFileExt() }, Locale.KOREA));
			}
		});*/
	}
}

package kr.co.dohwa.validator;

import java.util.Iterator;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dohwa.vo.MultipartFileVO;

/**
 * 파일 업로드 관리 Validator
 * 
 * @author PARK
 *
 */
@Component
public class ProjectFileUploadValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MultipartFileVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MultipartFileVO multipartFileVO = (MultipartFileVO) target;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) multipartFileVO.getRequest();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while (fileNames.hasNext()) {
			String fileName = (String) fileNames.next();
			
			if(!fileName.startsWith("main_")) {
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String extName = mFile.getOriginalFilename();
				extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
				
				if(0 == mFile.getSize()) {
					errors.rejectValue("message", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EMPTY", null, Locale.KOREA));
					break;
				} else if(!StringUtils.isEmpty(multipartFileVO.getFileExt()) && !multipartFileVO.getFileExt().contains(extName)) {
					errors.rejectValue("message", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { multipartFileVO.getFileExt() }, Locale.KOREA));
					break;
				}
			}
		}
	}
}

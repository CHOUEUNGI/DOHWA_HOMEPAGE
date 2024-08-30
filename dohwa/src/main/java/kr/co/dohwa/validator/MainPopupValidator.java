package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.co.dohwa.vo.MainPopupVO;

/**
 * 메인 팝업
 * 
 * @author PARK
 */
@Component
public class MainPopupValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MainPopupVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MainPopupVO mainPopupVO = (MainPopupVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "error.title", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "제목" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispStDt", "error.dispStDt", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "게시 시작일" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispEdDt", "error.dispEdDt", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "게시 종료일" }, Locale.KOREA));
		
		// 신규 일때 파일 체크
		if(null == mainPopupVO.getSeq() && (null == mainPopupVO.getPc_file_1() || StringUtils.isEmpty(mainPopupVO.getPc_file_1().getOriginalFilename()))) {
			errors.rejectValue("pc_file_1", "error.pc_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 팝업 이미지" }, Locale.KOREA));
			
		// 변경 일때 파일 체크
		} else if(null != mainPopupVO.getSeq() && StringUtils.isEmpty(mainPopupVO.getPcFileName()) && 
				(null == mainPopupVO.getPc_file_1() || StringUtils.isEmpty(mainPopupVO.getPc_file_1().getOriginalFilename()))) {
			errors.rejectValue("pc_file_1", "error.pc_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 팝업 이미지" }, Locale.KOREA));
			
		} else if(null != mainPopupVO.getPc_file_1() && !StringUtils.isEmpty(mainPopupVO.getPc_file_1().getOriginalFilename())) {
			String extName = mainPopupVO.getPc_file_1().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("pc_file_1", "error.pc_file_1", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}
		
		// 신규 인데 파일 등록 안함
		if(null == mainPopupVO.getSeq() && (null == mainPopupVO.getMo_file_1() || StringUtils.isEmpty(mainPopupVO.getMo_file_1().getOriginalFilename()))) {
			errors.rejectValue("mo_file_1", "error.mo_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "Mobile 팝업 이미지" }, Locale.KOREA));
			
		// 변경 일때 파일 체크
		} else if (null != mainPopupVO.getSeq() && StringUtils.isEmpty(mainPopupVO.getMoFileName()) && 
				(null == mainPopupVO.getMo_file_1() || StringUtils.isEmpty(mainPopupVO.getMo_file_1().getOriginalFilename()))) {
			errors.rejectValue("mo_file_1", "error.mo_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "Mobile 팝업 이미지" }, Locale.KOREA));
			
		} else if(null != mainPopupVO.getMo_file_1() && !StringUtils.isEmpty(mainPopupVO.getMo_file_1().getOriginalFilename())) {
			String extName = mainPopupVO.getMo_file_1().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("mo_file_1", "error.mo_file_1", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}
	}
}

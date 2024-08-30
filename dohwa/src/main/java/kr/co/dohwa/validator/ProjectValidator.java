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

import kr.co.dohwa.vo.ProjectVO;

/**
 * 프로젝트 관리 Validator
 * 
 * @author PARK
 *
 */
@Component
public class ProjectValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-image-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ProjectVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProjectVO projectVO = (ProjectVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "koTitle", 	"error.koTitle",  	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(국문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "enTitle", 	"error.enTitle", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(영문)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "esTitle", 	"error.esTitle", 	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트명(스페인)" }, Locale.KOREA));

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type1",	"error.type1",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "기본 정보(Market)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type2",	"error.type2",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "기본 정보(Service)" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type3",	"error.type3",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "기본 정보(Region)" }, Locale.KOREA));
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "koClient",	"error.enSubTitle",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "발주처(국문)" }, Locale.KOREA));
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "year",	"error.year",	messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "준공연도" }, Locale.KOREA));
		
		// 신규 일때 파일 체크
		if(null == projectVO.getSeq() && (null == projectVO.getMain_file_1() || StringUtils.isEmpty(projectVO.getMain_file_1().getOriginalFilename()))) {
			errors.rejectValue("main_file_1", "error.main_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 메인 이미지(직사각형)" }, Locale.KOREA));
			
		// 변경 일때 파일 체크
		} else if(null != projectVO.getSeq() && StringUtils.isEmpty(projectVO.getMainFileName1()) && 
				(null == projectVO.getMain_file_1() || StringUtils.isEmpty(projectVO.getMain_file_1().getOriginalFilename()))) {
			errors.rejectValue("main_file_1", "error.main_file_1", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 메인 이미지(직사각형)" }, Locale.KOREA));
			
		} else if(null != projectVO.getMain_file_1() && !StringUtils.isEmpty(projectVO.getMain_file_1().getOriginalFilename())) {
			String extName = projectVO.getMain_file_1().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("main_file_1", "error.main_file_1", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}
		
		// 신규 인데 파일 등록 안함
		if(null == projectVO.getSeq() && (null == projectVO.getMain_file_2() || StringUtils.isEmpty(projectVO.getMain_file_2().getOriginalFilename()))) {
			errors.rejectValue("main_file_2", "error.main_file_2", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 메인 이미지(정사각형)" }, Locale.KOREA));
			
		// 변경 일때 파일 체크
		} else if (null != projectVO.getSeq() && StringUtils.isEmpty(projectVO.getMainFileName2()) && 
				(null == projectVO.getMain_file_2() || StringUtils.isEmpty(projectVO.getMain_file_2().getOriginalFilename()))) {
			errors.rejectValue("main_file_2", "error.main_file_2", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 메인 이미지(정사각형)" }, Locale.KOREA));
			
		} else if(null != projectVO.getMain_file_2() && !StringUtils.isEmpty(projectVO.getMain_file_2().getOriginalFilename())) {
			String extName = projectVO.getMain_file_2().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
			
			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("main_file_2", "error.main_file_2", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}
		
		if(!StringUtils.isEmpty(projectVO.getMessage())) {
			errors.rejectValue("file", "error.file", projectVO.getMessage());
		}
	}
}

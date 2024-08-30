package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.vo.MainBannerVO;

/**
 * 메인 배너
 *
 * @author PARK
 */
@Component
public class MainBannerValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-image-mov-ext']}")
	private String FILE_UPLOAD_IMAGE_EXT;

	@Override
	public boolean supports(Class<?> clazz) {
		return MainBannerVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MainBannerVO mainBannerVO = (MainBannerVO) target;

		// 국문 이미지 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getPcFileName1()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getPcFileName1()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getPc_file_1_ko() || StringUtils.isEmpty(mainBannerVO.getPc_file_1_ko().getOriginalFilename())) {
			errors.rejectValue("pc_file_1_ko", "error.pc_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "국문 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getPc_file_1_ko().getSize()) {
			errors.rejectValue("pc_file_1_ko", "error.pc_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getPc_file_1_ko().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("pc_file_1_ko", "error.pc_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}

		// 국문 모바일 이미지 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getMoFileName1()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getMoFileName1()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getMo_file_1_ko() || StringUtils.isEmpty(mainBannerVO.getMo_file_1_ko().getOriginalFilename())) {
			errors.rejectValue("mo_file_1_ko", "error.mo_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "국문 Mobile 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getMo_file_1_ko().getSize()) {
			errors.rejectValue("mo_file_1_ko", "error.mo_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getMo_file_1_ko().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("mo_file_1_ko", "error.mo_file_1_ko", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}

		// 영문 이미지 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getPcFileName2()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getPcFileName2()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getPc_file_2_en() || StringUtils.isEmpty(mainBannerVO.getPc_file_2_en().getOriginalFilename())) {
			errors.rejectValue("pc_file_2_en", "error.pc_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "영문 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getPc_file_2_en().getSize()) {
			errors.rejectValue("pc_file_2_en", "error.pc_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getPc_file_2_en().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("pc_file_2_en", "error.pc_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}

		// 영문 모바일 이미지 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getMoFileName2()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getMoFileName2()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getMo_file_2_en() || StringUtils.isEmpty(mainBannerVO.getMo_file_2_en().getOriginalFilename())) {
			errors.rejectValue("mo_file_2_en", "error.mo_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "영문 Mobile 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getMo_file_2_en().getSize()) {
			errors.rejectValue("mo_file_2_en", "error.mo_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getMo_file_2_en().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("mo_file_2_en", "error.mo_file_2_en", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}

		// 스페인 이미지 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getPcFileName3()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getPcFileName3()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getPc_file_3_es() || StringUtils.isEmpty(mainBannerVO.getPc_file_3_es().getOriginalFilename())) {
			errors.rejectValue("pc_file_3_es", "error.pc_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "스페인 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getPc_file_3_es().getSize()) {
			errors.rejectValue("pc_file_3_es", "error.pc_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getPc_file_3_es().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("pc_file_3_es", "error.pc_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}

		// 스페인 모바일 이미치 첨부 파일 체크
		if(StringUtils.isEmpty(mainBannerVO.getMoFileName3()) && null == mainBannerVO.getSeq()) {
			// 신규 등록 일때는 체크 안한다.
		} else if(!StringUtils.isEmpty(mainBannerVO.getMoFileName3()) && null != mainBannerVO.getSeq()) {
			// 변경 일때는 체크 안한다.
		} else if(null == mainBannerVO.getMo_file_3_es() || StringUtils.isEmpty(mainBannerVO.getMo_file_3_es().getOriginalFilename())) {
			errors.rejectValue("mo_file_3_es", "error.mo_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "스페인 Mobile 이미지" }, Locale.KOREA));
		} else if(0 == mainBannerVO.getMo_file_3_es().getSize()) {
			errors.rejectValue("mo_file_3_es", "error.mo_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.SIZE.ZERO", null, Locale.KOREA));
		} else {
			String extName = mainBannerVO.getMo_file_3_es().getOriginalFilename();
			extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();

			if(!FILE_UPLOAD_IMAGE_EXT.contains(extName)) {
				errors.rejectValue("mo_file_3_es", "error.mo_file_3_es", messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { FILE_UPLOAD_IMAGE_EXT }, Locale.KOREA));
			}
		}
	}
}

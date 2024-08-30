package kr.co.dohwa.validator;

import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dohwa.util.StringUtil;
import kr.co.dohwa.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 면허 관리 Validator
 * @author KYoung
 */
@Slf4j
@Component
public class BoardValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return BoardVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		BoardVO boardVO = (BoardVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "error.title", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "제목" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "createDt", "error.createDt", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "등록일자" }, Locale.KOREA));
		
		// 국문 일때
		if ("KO".equals(boardVO.getLang())) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "refr", "error.refr", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "출처" }, Locale.KOREA));
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "url", "error.url", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "URL" }, Locale.KOREA));
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dispYn", "error.dispYn", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "공개여부" }, Locale.KOREA));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mainYn", "error.mainYn", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "메인노출" }, Locale.KOREA));
		
		// 메인노출 여부가 Y일때
		if ("Y".equals(boardVO.getMainYn())) {
			
			if (StringUtil.isEmpty(boardVO.getMainDispSdt()) || StringUtil.isEmpty(boardVO.getMainDispEdt())) {
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mainDispMessage", "error.mainDispMessage", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "노출기간" }, Locale.KOREA));
			}
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "typeCode", "error.typeCode", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "구분" }, Locale.KOREA));
		
		// 영문/스페인어 일때
		if (!"KO".equals(boardVO.getLang())) {
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) boardVO.getMultipartFileVO().getRequest();
			MultiValueMap<String, MultipartFile> fileMap = multipartRequest.getMultiFileMap();
			
			int pcRequired = 0;
			for (Entry<String, List<MultipartFile>> entry : fileMap.entrySet()) {
				
				String field = entry.getKey().contains("PC") ? "pcMessage" : "moMessage";
				
				if (entry.getKey().contains("PC") && !entry.getValue().get(0).isEmpty()) {
					pcRequired++;
				}
				
				String extName = entry.getValue().get(0).getOriginalFilename();
				extName = extName.substring(extName.lastIndexOf(".") + 1, extName.length()).toLowerCase();
				
				// 확장자 체크
				if (!entry.getValue().get(0).isEmpty() && !boardVO.getMultipartFileVO().getFileExt().contains(extName)) {
					
					ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, "error."+field, messageSource.getMessage("ADMIN.VALIDATE.FILE.UPLOAD.EXT", new String[] { boardVO.getMultipartFileVO().getFileExt() }, Locale.KOREA));
				}
			}
			
			// PC 이미지 유효성
			if (pcRequired <= 0) {
				
				// 등록
				if (boardVO.getSeq() == 0) {
					ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pcMessage", "error.pcMessage", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 이미지" }, Locale.KOREA));
				// 수정
				} else if (boardVO.getPcFileList() != null && boardVO.getPcFileList().size() <= 0) {
					ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pcMessage", "error.pcMessage", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "PC 이미지" }, Locale.KOREA));
				}
			}
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cont", "error.cont", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "프로젝트 설명" }, Locale.KOREA));
		}
		
	}
}

package kr.co.dohwa.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.dohwa.util.StringUtil;
import kr.co.dohwa.vo.PeopleVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 면허 관리 Validator
 * @author KYoung
 */
@Slf4j
@Component
public class PeopleValidator implements Validator {

	@Autowired
	private MessageSource messageSource;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return PeopleVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		PeopleVO peopleVO = (PeopleVO) target;
		
		boolean isFileValied = false;
		for (int i = 0; i < peopleVO.getPeoples().size(); i++) {
			
			PeopleVO pv = peopleVO.getPeoples().get(i);
			
			if(pv.getPeopleMlVO() != null) {
				if (StringUtil.isEmpty(pv.getOrder()) && "KO".equals(peopleVO.getLang()))
					errors.rejectValue("peoples["+i+"].order", "peoples["+i+"].order", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "순서" }, Locale.KOREA));
				
				if (StringUtil.isEmpty(pv.getPeopleMlVO().getName()))
					errors.rejectValue("peoples["+i+"].peopleMlVO.name", "peoples["+i+"].peopleMlVO.name", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "이름" }, Locale.KOREA));

				if (StringUtil.isEmpty(pv.getPeopleMlVO().getStaffLevel()))
					errors.rejectValue("peoples["+i+"].peopleMlVO.staffLevel", "peoples["+i+"].peopleMlVO.staffLevel", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "직급" }, Locale.KOREA));

				if (StringUtil.isEmpty(pv.getPeopleMlVO().getPartname()))
					errors.rejectValue("peoples["+i+"].peopleMlVO.partname", "peoples["+i+"].peopleMlVO.partname", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "부서명" }, Locale.KOREA));

				if (StringUtil.isEmpty(pv.getPeopleMlVO().getInterview()))
					errors.rejectValue("peoples["+i+"].peopleMlVO.interview", "peoples["+i+"].peopleMlVO.interview", messageSource.getMessage("ADMIN.VALIDATE.REQUIRED", new String[] { "Interview" }, Locale.KOREA));

				if (pv.getMultipartFileVO() != null && pv.getMultipartFileVO().getFile().isEmpty() && !isFileValied) {
					errors.rejectValue("peoples[0].multipartFileVO.message", "peoples[0].multipartFileVO.message", messageSource.getMessage("ADMIN.VALIDATE.FILE.READD", null, Locale.KOREA));
					isFileValied = true;
				}
			}
			
			
		}
		
		// 첨부파일 재업로드
		if (errors.getErrorCount() > 0 && !isFileValied) {
			errors.rejectValue("peoples[0].multipartFileVO.message", "peoples[0].multipartFileVO.message", messageSource.getMessage("ADMIN.VALIDATE.FILE.READD", null, Locale.KOREA));
		}
	}
}

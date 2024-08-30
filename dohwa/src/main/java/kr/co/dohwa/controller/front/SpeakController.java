package kr.co.dohwa.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.io.File;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.SpeakService;
import kr.co.dohwa.validator.FileUploadValidator;
import kr.co.dohwa.validator.SpeakValidator;
import kr.co.dohwa.vo.CustInqrVO;
import kr.co.dohwa.vo.MultipartFileVO;
import kr.co.dohwa.vo.SpeakVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 윤리경영 제보라인
 * @author PARK
 */
@Slf4j
@Controller
@RequestMapping({"speak", Constant.MOBILE_START_PATH+"speak"})
public class SpeakController extends BaseController {

	@Autowired
	private SpeakService speakService;

	@Autowired
	private FileUploadValidator fileUploadValidator;

	@Autowired
	private SpeakValidator speakValidator;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Value("#{config['file.upload-speak-ext']}")
	private String FILE_UPLOAD_SPEAK_EXT;

	/**
	 * 윤리경영 제보라인 인덱스(진입) 페이지
	 * @param request
	 * @param searchVO
	 * @param model
	 * @return
	 */
	@RequestMapping({""})
	public String index() {
		return frontViewPath() + "/index";
	}

	/**
	 * 윤리경영 제보라인 제보하기 페이지
	 * @param request
	 * @param speakVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/tipoff", "/tipoff/{anonymous}"}, method = RequestMethod.GET)
	public String reg(HttpServletRequest request, @PathVariable(value = "anonymous") Optional<String> anonymous,
			SpeakVO speakVO, Model model) {
		
		speakVO.setAnonymous(anonymous.orElse("N"));
		
		return frontViewPath() + "/tipoff";
	}

	/**
	 * 윤리경영 제보라인 조회 결과
	 * @param request
	 * @param speakVO
	 * @param model
	 * @return
	 */
	@RequestMapping({"/result"})
	public String result(HttpServletRequest request, Locale locale, SpeakVO speakVO, Model model) {
		
		Optional<SpeakVO> result = Optional.ofNullable(speakService.getSpeakInfo(speakVO));
		
		if (result.isPresent()) {
			
			model.addAttribute("result", result.get());
			return frontViewPath() + "/result";
		} else {
			
			request.getSession().setAttribute(Constant.DOHWA_MESSAGE_KEY, messageSource.getMessage("FRONT.COMMON.MENU.TIPOFF.002", new String[] {}, locale));
			return "redirect:" + request.getRequestURI().replace("/speak/result", "/speak");
		}
	}

	/**
	 * 윤리경영 제보라인 제보하기 처리
	 * @param request
	 * @param speakVO
	 * @param fileResult
	 * @param result
	 * @param model
	 * @param locale
	 * @return
	 * @throws Exception
	 */
	@PostMapping({"/tipoffProc"})
	@ResponseBody
	public Map<String, Object> tipoffProc(HttpServletRequest request, SpeakVO speakVO, BindingResult fileResult, BindingResult result, 
			RedirectAttributes redirectAttributes, Model model, Locale locale) throws Exception {
		Map<String, Object> retMap = Maps.newHashMap();
		
		speakVO.setPageType(getCurrentDeviceType());

		// 파일 체크 (필수인지 확인 필요)
		MultipartFileVO multipartFileVO = new MultipartFileVO();
		multipartFileVO.setRequest(request);
		multipartFileVO.setFileExt(FILE_UPLOAD_SPEAK_EXT);
		multipartFileVO.setCheckRequiredFileYn("N");
		fileUploadValidator.validate(multipartFileVO, fileResult);
		if(fileResult.hasErrors()) {
			for (Object object : fileResult.getFieldErrors()) {
			    if(object instanceof FieldError) {
			        FieldError fieldError = (FieldError) object;
			        if(fieldError.getField().equals("message")) {
			        	speakVO.setMessage(fieldError.getCode());
			        }
			    }
			}
		}

		// 제보하기 등록
		speakValidator.validate(speakVO, result);
		if(result.hasErrors()) {
			retMap.put("result", false);
			List<Map<String, Object>> errorList = new ArrayList<Map<String, Object>>();
			for(FieldError fe : result.getFieldErrors()) {
				Map<String, Object> errMap = Maps.newHashMap();
				errMap.put("field", fe.getField());
				errMap.put("msg", fe.getDefaultMessage());
				errorList.add(errMap);
			}
			retMap.put("errorList", errorList);
			return retMap;
		} else {
			speakService.insertSpeakInfo(request, speakVO);
			retMap.put("result", true);
		}

		retMap.put("id", speakVO.getId());
		retMap.put("anonymous", speakVO.getAnonymous());
		// 익명인 경우 agreeYn을 빈값을 변경
		if("Y".equals(speakVO.getAnonymous())) {
			retMap.put(Constant.DOHWA_MESSAGE_KEY, messageSource.getMessage("FRONT.ALERT.001", new String[] {}, locale));
		} else {
			retMap.put(Constant.DOHWA_MESSAGE_KEY, messageSource.getMessage("FRONT.COMMON.MENU.TIPOFF.001", new String[] {speakVO.getId()}, locale));
		}
		
	
		// 메일 발송
		try {
			// 메일 발송 https://offbyone.tistory.com/167 참고함
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("dohwa20200717@gmail.com");
					helper.setTo("dohwavm@dohwa.co.kr");
					
					String title = "윤리경영에 제보가 접수되었습니다. "; 
					String html = " 1. 제목 : " + speakVO.getTitle() + "<br><br>" + " 2. 대상 : " + speakVO.getWho() + "<br><br>"
		            		+ " 3. 일시 및 장소 : " + speakVO.getWherewhen() + "<br><br>" + " 4. 내용 : " + speakVO.getSpeakContent();
					helper.setSubject(title);
					helper.setText(html, true);
					log.info("메일발송완료 :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" );
					log.debug(title);
					log.debug(html);
				}
			};
			mailSender.send(preparator);
		}catch(Exception e) {
			log.error("insertCustInqr email sending error :: " + e.getMessage(), e);
		}
   
				
		return retMap;
		
	}

}

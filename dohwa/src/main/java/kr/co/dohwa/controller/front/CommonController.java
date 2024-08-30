package kr.co.dohwa.controller.front;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.plexus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.dohwa.constants.Constant;
import lombok.extern.slf4j.Slf4j;

/**
 * Front 공통 Controller
 * @author KYoung
 */
@Slf4j
@Controller
public class CommonController extends BaseController {

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;


	/**
	 * Client(js) 에서 사용하는 다국어 메세지
	 * @param response
	 * @param locale
	 * @throws IOException
	 */
	@GetMapping(value = "/inc/js/messageUtils.js")
	public void messageUtils(HttpServletResponse response, Locale locale) throws IOException {

		response.setHeader("Content-Type", "application/javascript");
		response.setContentType("text/javascript;charset=UTF-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter writer = response.getWriter();
		ObjectMapper objectMapper = new ObjectMapper();
		StringBuilder stringBuilder = new StringBuilder();

		stringBuilder.append("var messageUtils = messageUtils || (function() {\n");
		stringBuilder.append("    var __localMessage = ");

		ResourceBundle resourceBundle = ResourceBundle.getBundle("i18n.message_"+locale, locale);
		Map<String, String> messages = resourceBundle.keySet()
													.stream()
													.collect(Collectors.toMap(key -> key, key -> messageSource.getMessage(key, null, locale)));

		String jsonString = objectMapper.writeValueAsString(messages);

		stringBuilder.append(jsonString);

		stringBuilder.append(";\n");
		stringBuilder.append("    var module = {};\n");
		stringBuilder.append("\n");
		stringBuilder.append("    var _get = function(key) {\n");
		stringBuilder.append("        var message = __localMessage[key];\n");
		stringBuilder.append("        if(arguments.length > 1) {\n");
		stringBuilder.append("            var map = {};\n");
		stringBuilder.append("            for(i = 1; i < arguments.length; i++){\n");
		stringBuilder.append("                map[i-1] = arguments[i];\n");
		stringBuilder.append("            }\n");
		stringBuilder.append("\n");
		stringBuilder.append("            return message.replace(/\\{([0-9]+)\\}/gi,function(match, p1) {\n");
		stringBuilder.append("                return map[p1];\n");
		stringBuilder.append("            });\n");
		stringBuilder.append("        }\n");
		stringBuilder.append("        return message;\n");
		stringBuilder.append("    }\n");
		stringBuilder.append("\n");
		stringBuilder.append("    module.get = _get;\n");
		stringBuilder.append("\n");
		stringBuilder.append("    return module;\n");
		stringBuilder.append("})();\n");

		writer.println(stringBuilder.toString());
	}


	/**
	 * 개인정보 처리방침
	 * @param locale
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value = {"/privacy_policy_01", Constant.MOBILE_START_PATH + "privacy_policy_01"})
	public String privacyPolicy01(Locale locale) {

		return frontViewPath() + "/footer/privacy_policy_01_"+locale.getLanguage();
	}


	/**
	 * 개인정보 취급방침
	 * @param locale
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value = {"/privacy_policy_02", Constant.MOBILE_START_PATH + "privacy_policy_02"})
	public String privacyPolicy02(Locale locale) {

		return frontViewPath() + "/footer/privacy_policy_02_"+locale.getLanguage();
	}


	/**
	 * 영상정보처리기기운영관리방침
	 * @param locale
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value = {"/privacy_policy_03", Constant.MOBILE_START_PATH + "privacy_policy_03"})
	public String privacyPolicy03(Locale locale) {

		return frontViewPath() + "/footer/privacy_policy_03_"+locale.getLanguage();
	}

	
	/**
	 * 서버점검중 화면
	 * @param locale
	 * @return
	 */
	@GetMapping(value = {"/inspection", Constant.MOBILE_START_PATH + "inspection"})
	public String inspection() {
		
		return frontViewPath() + "/error/inspection";
	}
	

	/**
	 * 진척
	 * @param request
	 * @param response
	 * @param prgsRate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping({"/test/dev/prgsRateAjax"})
	@ResponseBody
	public String prgsRate(HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "prgsRate") String rgsRate) throws Exception {
		log.debug("rgsRate : " + rgsRate);
		log.debug("rgsRate : " + XssPreventer.unescape(rgsRate));
		FileUtils.fileWrite(FILE_UPLOAD_DIR + "/prgsRate.json", XssPreventer.unescape(rgsRate));

		return "ok";
	}

	/**
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping({"/test/dev/getPrgsRateAjax"})
	@ResponseBody
	public Map<String, Object> getPrgsRate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file = new File(FILE_UPLOAD_DIR + "/prgsRate.json");
		if(!file.exists()) {
			file.createNewFile();
		}
		Map<String, Object> map = Maps.newHashMap();
		map.put("prgsRate", FileUtils.fileRead(file));
		return map;
	}
}

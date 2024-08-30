/**
 *
 */
package kr.co.dohwa.util;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import kr.co.dohwa.constants.Constant;
import lombok.extern.slf4j.Slf4j;

/**
 * front용 스프링 인터셉터
 * @author 1010
 *
 */
@Slf4j
@Component
public class FrontInterception extends HandlerInterceptorAdapter {

	@Value("#{config['server.type']}")
	private String SERVER_TYPE;
	
	@Value("#{config['detect.lnag.es.nation.code']}")
	private String DETECT_LNAG_ES_NATION_CODE;
	
	@Value("#{config['detect.lnag.ko.nation.code']}")
	private String DETECT_LNAG_KO_NATION_CODE;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		log.debug("serverType " + SERVER_TYPE);
//		log.debug("getClientIP : " + CommonUtils.getClientIP(request));
//		log.debug("getIpLocation : " + CommonUtils.getIpLocation(CommonUtils.getClientIP(request)));
//		log.debug("getIpLocation(58.181.36.129) : " + CommonUtils.getIpLocation("58.181.36.129"));
//		log.debug("isMobileDevice : " + CommonUtils.isMobileDevice(request));
//		log.debug("getRequestURL : " + request.getRequestURL().toString());
//		log.debug("getRequestURI : " + request.getRequestURI());
//		log.debug("getServerPort : " + request.getServerPort());
//		log.debug("getRemotePort : " + request.getRemotePort());
//		log.debug("getScheme : " + request.getScheme());
//		log.debug("getServerName : " + request.getServerName());
		
		/**
		 * 1. IP기반으로 언어를 결정해야 하는 상황인지 판단.
		 * 메인 화면이면서 현재 요청 파라메터중 lang 파라메터 값이 없고, 현재 세션 로케일이 없고 ip 기준으로 구한 언어값이 세션에 없을 경우 ip기준으로 kisa api를 이용해서 국가 코드를 구한 후 언어코드를 결정한다. 
		 */
		String lang = "";
		boolean isDetectLang = false;
		if(request.getRequestURI().equals("/") || request.getRequestURI().equals("/main") || request.getRequestURI().equals("/main/") 
				|| request.getRequestURI().equals(Constant.MOBILE_START_PATH) || request.getRequestURI().equals(Constant.MOBILE_START_PATH+"main") 
				|| request.getRequestURI().equals(Constant.MOBILE_START_PATH+"main/") ) {
			if(StringUtils.isEmpty(request.getParameter("lang"))) {
				if(request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME) == null) {
					if(request.getSession().getAttribute("langByIp") == null || StringUtils.isEmpty( (String)request.getSession().getAttribute("langByIp") )) {
						isDetectLang = true;
					}
				}
			}
		}
		
		/**
		 * 2. IP기반으로 언어를 결정해야 하는 상황이거나 테스트용 IP가 파라메터로 담겨지 있는 경우
		 * 사용자의 IP를 구한 후 그 IP를 KISA API를 이용해서 국가코드를 구한 후 언어코드를 셋팅한다.
		 */
		if(isDetectLang || StringUtils.isNotEmpty(request.getParameter("test_ip_addr_test"))) {
			String clientIP = CommonUtils.getClientIP(request);
			
			// 테스트용 ip 주소를 받은 경우
			if(StringUtils.isNotEmpty(request.getParameter("test_ip_addr_test"))) {
				clientIP = request.getParameter("test_ip_addr_test");
				log.debug("param test_ip_addr_test exist : " + clientIP);
			}
			
			
			String natByIp = CommonUtils.getIpLocation(clientIP);
			log.debug("getClientIP : " + clientIP);
			log.debug("natByIp : " + natByIp);
			
			//1.스페인어를 채택해야 하는 국가인지 체크
			String[] arrNatCdForEs = DETECT_LNAG_ES_NATION_CODE.split(",");
			for(String natCd : arrNatCdForEs) {
				if(natCd.equalsIgnoreCase(natByIp)) {
					lang = "es";
					break;
				}
			}
			//2. 아니면 한국어를 채택해야 하는 국가인지 체크
			if(StringUtils.isEmpty(lang)) {
				String[] arrNatCdForKo = DETECT_LNAG_KO_NATION_CODE.split(",");
				for(String natCd : arrNatCdForKo) {
					if(natCd.equalsIgnoreCase(natByIp)) {
						lang = "ko";
						break;
					}
				}
			}
			//3. 아니면 무조건 영문
			if(StringUtils.isEmpty(lang)) {
				lang = "en";
			}
			
			//4. 세션에 langByIp 값을 저장함.
			request.getSession().setAttribute("langByIp", lang);
			log.debug("IP기반 언어 코드  : " + lang);
		}
		
		/**
		 * 3. IP기반으로 결정된 언어값으로 리다이텍트 한다.
		 * 	- 1순위 파라메터로 넘어온 언어
		 * 	- 2순위 IP기반으로 언어결정된 언어
		 */
		String paramLang = request.getParameter("lang");
		if(StringUtils.isNotEmpty(lang)) { // IP기반으로 언어결정된 값이 있는 경우
			log.debug("IP기반 언어 코드  : " + lang + ", paramLang  : " + paramLang);
			if(StringUtils.isNotEmpty(paramLang) && !lang.equalsIgnoreCase(paramLang)) {	// 1순위 파라메터로 넘어온 언어
				response.sendRedirect(request.getRequestURI() + "?lang="+paramLang);
			} else {	// 2순위 IP기반으로 언어결정된 언어
				response.sendRedirect(request.getRequestURI() + "?lang="+lang);
			}
		}
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}

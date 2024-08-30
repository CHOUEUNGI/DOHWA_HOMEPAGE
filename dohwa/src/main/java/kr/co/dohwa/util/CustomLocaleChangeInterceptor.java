/**
 * 
 */
package kr.co.dohwa.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 스페인어일때 es_es가 아닌 es_mx 멕시코로 적용하도록 처리함.
 * 스페인어는 숫자의 첫자리 구분값을 . 으로 하고, 소수점을 , 로 쓰는데
 * 고객이 영어권이나 한국처럼 바꿔 달라고 해서 지사가 있는 남미쪽 영어권 스페인어인 멕시코 스페인어로 적용되게 함. (참고로 볼리비아는 스페인과 같음)
 * @author 1010
 *
 */
@Slf4j
public class CustomLocaleChangeInterceptor extends LocaleChangeInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException {
		
		String newLocale = request.getParameter(getParamName());
		if (newLocale != null && newLocale.startsWith("es")) {
			if (checkHttpMethod(request.getMethod())) {
				LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
				if (localeResolver == null) {
					throw new IllegalStateException(
							"No LocaleResolver found: not in a DispatcherServlet request?");
				}
				try {
					localeResolver.setLocale(request, response, parseLocaleValue("es_mx"));	//멕시코 스페인어로 강제 변경
					return true;
				}
				catch (IllegalArgumentException ex) {
					if (isIgnoreInvalidLocale()) {
							log.debug("Ignoring invalid locale value [" + newLocale + "]: " + ex.getMessage());
					}
					else {
						throw ex;
					}
				}
			}
		}
		
		return super.preHandle(request, response, handler);
		
	}
	
	private boolean checkHttpMethod(String currentMethod) {
		String[] configuredMethods = getHttpMethods();
		if (ObjectUtils.isEmpty(configuredMethods)) {
			return true;
		}
		for (String configuredMethod : configuredMethods) {
			if (configuredMethod.equalsIgnoreCase(currentMethod)) {
				return true;
			}
		}
		return false;
	}

}

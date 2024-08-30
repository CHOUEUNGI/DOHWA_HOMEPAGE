package kr.co.dohwa.security;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.util.StringUtils;

import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.vo.AdminUserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	AdminUserService adminUserService;
	
	private String defaultFailureUrl;
	private String errormsg;
	
    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String id = request.getParameter("id");
		
		// 비밀번호가 일치하지 않은 경우
		if(exception instanceof BadCredentialsException) {
			// 비밀번호 실패 카운트 변경 및 잠금 설정
			AdminUserVO procAdminUserVO = adminUserService.increasePasswordErrorCountBy(id);
			if(null != procAdminUserVO) {
				if(procAdminUserVO.getPswdFailCount() < 5) {
					errormsg = messageSource.getMessage("ADMIN.ERROR.WRONG_PASSWORD", new String[] { procAdminUserVO.getPswdFailCount() + "" }, Locale.KOREA);
				} else {
					errormsg = messageSource.getMessage("ADMIN.ERROR.LOCKED", null, Locale.KOREA);
				}
			} else if(StringUtils.isEmpty(id)) {
				errormsg = messageSource.getMessage("ADMIN.ERROR.BADCREDENTIALS", null, Locale.KOREA);
			}
		}
		
		// 존재 하지 않는 아이디일 경우
		if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = messageSource.getMessage("ADMIN.ERROR.BADCREDENTIALS", null, Locale.KOREA);
        // 인증 거부 : 계정 비활성화
        } else if(exception instanceof DisabledException) {
            errormsg = messageSource.getMessage("ADMIN.ERROR.DISALED", null, Locale.KOREA);
        // 인증 거부 : 비밀번호 유효 기간 만료
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = messageSource.getMessage("ADMIN.ERROR.CREDENTIALSEXPIRED", null, Locale.KOREA);
        // 중복 로그인
        } else if(exception instanceof SessionAuthenticationException) {
        	errormsg = messageSource.getMessage("ADMIN.ERROR.SESSIONAUTHENTICATION", null, Locale.KOREA);
        }
		
		log.info("############### LoginFailureHandler ::: {}", exception.getMessage());
		
		request.setAttribute("message", errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
}

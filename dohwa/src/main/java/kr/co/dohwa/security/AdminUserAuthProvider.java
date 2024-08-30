package kr.co.dohwa.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminUserAuthProvider extends DaoAuthenticationProvider {
	
	@Autowired
	@Qualifier("sessionRegistry")
	private SessionRegistry sessionRegistry;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// 현재 유저 정보
		String username = "";
		String ip = null;
		if(null != authentication && null != authentication.getPrincipal()) {
			username = authentication.getName();
			
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			ip = req.getHeader("X-FORWARDED-FOR");
			if (null == null) {
				ip = req.getRemoteAddr();
			}
		}
		
		// 로그인 중인 세션들
		final List<Object> allPrincipals = sessionRegistry.getAllPrincipals();
		
        for(final Object principal : allPrincipals) {
        	
        	if(principal instanceof AdminUserDetailsAdapter) {
        		
        		final AdminUserDetailsAdapter user = (AdminUserDetailsAdapter) principal;
        		
        		if(user.getAdminUser().getId().equals(username)) {
        		
        			for (SessionInformation session : sessionRegistry.getAllSessions(principal, false)) {
        				
        				if(user.getAdminUser().getLoginIp().equals(ip)) {
        					log.info("========== {} RemoveSessionInformation [{}]==========", username, session.getSessionId());
        					// 삭제 되는 세션정보
        					sessionRegistry.getSessionInformation(session.getSessionId()).expireNow();
        				}
                    }
        		}
            }
        }
		return super.authenticate(authentication);
	}
}
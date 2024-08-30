package kr.co.dohwa.security;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.vo.AdminUserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    private AdminUserService adminUserService;
    private String defaultTargetUrl;
    private boolean alwaysUseDefaultTargetUrl;
    private static int TIME = 30 * 60;

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
        this.defaultTargetUrl = defaultTargetUrl;
    }

	public void setAlwaysUseDefaultTargetUrl(boolean alwaysUseDefaultTargetUrl) {
		this.alwaysUseDefaultTargetUrl = alwaysUseDefaultTargetUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		request.getSession().setMaxInactiveInterval(TIME);

		AdminUserDetailsAdapter adminUser = (AdminUserDetailsAdapter) authentication.getPrincipal();

		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = CommonUtils.getClientIP(req);

		// 성공시 실패 카운트 업데이트, 마지막 로그인일자 업데이트
		AdminUserVO adminUserVO = new AdminUserVO();
		adminUserVO.setId(adminUser.getAdminUser().getId());
		adminUserVO.setPswdFailCount(0);
		adminUserVO.setLoginDt(LocalDateTime.now());
		adminUserVO.setLoginIp(ip);

		adminUserService.updateAdminUserinfo(adminUserVO);

		response.sendRedirect(defaultTargetUrl);

		clearAuthenticationAttributes(request);
	}

	protected void clearAuthenticationAttributes(final HttpServletRequest request) {
        final HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }

        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
}

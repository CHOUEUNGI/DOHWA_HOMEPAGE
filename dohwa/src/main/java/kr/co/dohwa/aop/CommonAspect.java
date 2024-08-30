package kr.co.dohwa.aop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.gson.Gson;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.service.AdminUserService;
import kr.co.dohwa.util.CommonUtils;
import kr.co.dohwa.vo.AdminUserLogVO;
import kr.co.dohwa.vo.CommonVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
public class CommonAspect {

	@Autowired
	private AdminUserService adminUserService; 
	
	@Autowired(required = false)
	private HttpServletRequest request;
	
	/**
	 * 로그인 아이디를 서비스로 넘어가는 객체의 regId, updId 부분에 설정한다.
	 * @param jp
	 */
	@Before("within(@org.springframework.stereotype.Service *)")
	public void injectLoginId(JoinPoint jp) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if(securityContext != null && securityContext.getAuthentication() != null) {
			log.debug("로그인 ID를 삽입합니다...");
			Authentication authentication = securityContext.getAuthentication();
			Object[] args = jp.getArgs();
			for (Object object : args) {
				if(object instanceof CommonVO) {
					CommonVO vo = (CommonVO)object;
					vo.setLoginId(authentication.getName());
					break;
				}
			}
		}
	}

	/**
	 * {@link Logging}이 달린 메소드가 실행되기전에 로그를 적재합니다.
	 *
	 * @param jp
	 * @param target
	 */
	@Before("@annotation(kr.co.dohwa.aop.AdminKeepCondtion) && @annotation(target)")
	public void logging(JoinPoint jp, AdminKeepCondtion target) {
		log.debug("어드민 리스트 조회 조건 유지시키기 [Before] [Start]");
		try {
			HttpServletRequest req = null;
			if(RequestContextHolder.getRequestAttributes() != null) {
				req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			} else {
				Object[] args = jp.getArgs();
				for (Object object : args) {
					if(object instanceof HttpServletRequest) {
						req = (HttpServletRequest)object;
						break;
					}
				}
			}
			if(req != null) {
				SearchVO searchVO = null;
				for(Object argObj : jp.getArgs()) {
					if(argObj instanceof SearchVO) {
						searchVO = (SearchVO)argObj;
					}
				}
				searchVO.setAdminKeepConditionKey(req.getRequestURL().toString());

				Gson gson = new Gson();
				HttpSession session = req.getSession();
				if(session.getAttribute("selectCondition") != null) {
					String prevUrl = req.getHeader("referer");
					if(!prevUrl.split("\\?")[0].endsWith(req.getRequestURI())) {
						SearchVO searchVOFromSession = gson.fromJson((String)session.getAttribute("selectCondition"), SearchVO.class);
						if(!prevUrl.equals(searchVOFromSession.getAdminKeepConditionKey())) {
							CommonUtils.copyVoValue(searchVOFromSession, searchVO, 1);
						}
					}
					session.removeAttribute("selectCondition");
				}

				if(searchVO != null) {
					req.getSession().setAttribute("selectCondition", new Gson().toJson(searchVO));
				}

			} else {
				log.info("Request가 존재하지 않아 어드민 리스트 조회 조건 유지시키기에 실패하였습니다.");
			}
		} catch (Exception e) {
			log.info("어드민 리스트 조회 조건 유지시키기에 실패하였습니다. 이유 : {}", e);
		}
		log.debug("어드민 리스트 조회 조건 유지시키기 [Before] [End]");
	}
	
	/**
	 * {@link Logging}이 달린 메소드가 실행되기전에 로그를 적재합니다.
	 * 
	 * @param jp
	 * @param target
	 */
	@Before("@annotation(kr.co.dohwa.aop.Logging) && @annotation(target)")
	public void logging(JoinPoint jp, Logging target) {
		
		try {
			
			HttpServletRequest req = null;
			if(RequestContextHolder.getRequestAttributes() != null) {
				req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			} else {
				Object[] args = jp.getArgs();
				for (Object object : args) {
					if(object instanceof HttpServletRequest) {
						req = (HttpServletRequest)object;
						break;
					}
				}
			}
			
			if(req != null) {
				String reqMethod = req.getMethod().toLowerCase();
				String url = req.getRequestURI().toString();
				String ip = req.getHeader(Constant.X_FORWARDED_FOR);
				if (ip == null)
					ip = req.getRemoteAddr();
				
				String action = getMethodNm(reqMethod);
				String param = "";
				
				//파라미터 가져오기
				if(RequestMethod.POST.name().toLowerCase().equals(reqMethod) || 
						RequestMethod.PUT.name().toLowerCase().equals(reqMethod) || 
						RequestMethod.PATCH.name().toLowerCase().equals(reqMethod)) {
					param = (String)req.getAttribute(Constant.STRING_REQUEST_BODY);
				} else {
					param = req.getQueryString();
				}

				AdminUserLogVO adminUserLogVO = new AdminUserLogVO();
				adminUserLogVO.setAction(action);
				adminUserLogVO.setMenuNm(target.menuNm());
				adminUserLogVO.setUrl(url);
				adminUserLogVO.setIp(ip);
				adminUserLogVO.setParam(param);
				
				adminUserService.insertAdminUserLog(adminUserLogVO);

			} else {
				log.error("Request가 존재하지 않아 로그 저장에 실패하였습니다.");
			}
		} catch (Exception e) {
			log.error("로그 기록에 실패하였습니다. 이유 : {}", e);
		}
	}
	
	/**
	 * 프로젝트, 뉴스 이전페이지 관련
	 * @param jp
	 */
	@Before("within(@org.springframework.web.bind.annotation.RequestMapping *)")
	public void projectUrlCheck(JoinPoint jp) {
		HttpSession session = request.getSession(false);
		
		if(null != session && null != session.getAttribute("projectPrevPageSeq") 
				&& !request.getRequestURI().contains("/business/project") && !request.getRequestURI().contains("/business/project/")) {
			session.removeAttribute("projectPrevPageSeq");
		}
		
		if(null != session && null != session.getAttribute("newsPrevPageSeq") 
				&& !request.getRequestURI().contains("/prroom/news") && !request.getRequestURI().contains("/prroom/news/")) {
			session.removeAttribute("newsPrevPageSeq");
		}
	}
	
	private String getMethodNm(String reqMethod) {
		Map<String, String> map = Constant.REQUEST_METHOD_MAP;
		String name = RequestMethod.POST.name().toLowerCase().equals(reqMethod) ? map.get(RequestMethod.PUT.name().toLowerCase()) : map.get(reqMethod);
		return name == null ? reqMethod : name;
	}
}

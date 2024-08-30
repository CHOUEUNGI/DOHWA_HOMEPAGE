package kr.co.dohwa.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dohwa.constants.Constant;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BaseController implements InitializingBean {

	private String view_path = "front/";

	@Autowired
	private HttpServletRequest request;

	@Override
	public void afterPropertiesSet() throws Exception {
		Class<?> clazz = this.getClass();
		if (null != clazz.getAnnotation(RequestMapping.class)) {
			RequestMapping requestMappingAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
			this.view_path = "front/" + requestMappingAnnotation.value()[0].replaceAll("-", "_");
		} else if (null != clazz.getAnnotation(GetMapping.class)) {
			GetMapping getMapping = (GetMapping) clazz.getAnnotation(GetMapping.class);
			this.view_path = "front/" + getMapping.value()[0].replaceAll("-", "_");
		} else if (null != clazz.getAnnotation(PostMapping.class)) {
			PostMapping postMapping = (PostMapping) clazz.getAnnotation(PostMapping.class);
			this.view_path = "front/" + postMapping.value()[0].replaceAll("-", "_");
		}
	}

	/**
	 * 모바일 경우 view 경로를 변경한다.
	 * @return
	 */
	protected String frontViewPath() {
		/*
		 * Device device = DeviceUtils.getCurrentDevice(request); if (device.isMobile())
		 * { return view_path.replace("front/", "mobile/"); }
		 */
		String uri = request.getRequestURI();
		if(uri != null && uri.startsWith(Constant.MOBILE_START_PATH)) {
			//log.info("mobile view_path ::: {}", view_path.replace("front/", "mobile/"));
			return view_path.replace("front/", "mobile/");
		}
		//log.info("view_path ::: {}", view_path);

		return view_path;
	}

	/**
	 * error 페이지에서 view 경로를 반환.
	 * @return
	 */
	protected String errorViewPath() {
		
		String uri = (String) request.getAttribute("javax.servlet.error.request_uri");
		if(uri != null && uri.startsWith(Constant.MOBILE_START_PATH)) {
			//log.info("error mobile view_path ::: {}", view_path.replace("front/", "mobile/"));
			return view_path.replace("front/", "mobile/");
		}
		//log.info("error view_path ::: {}", view_path);
		
		return view_path;
	}
	
	/**
	 * 어드민 페이지 여부
	 * @return
	 */
	protected boolean isAdminPage() {
		String uri = request.getRequestURI();
		if(uri != null && uri.startsWith("/admin/")) {
			return true;
		}
		return false;
	}
	
	/**
	 * URL `/m/` 포함 여부에 따라 PC, MO 반환한다.
	 * @return
	 */
	protected String getCurrentDeviceType() {
		String uri = request.getRequestURI();
		if(uri != null && uri.startsWith(Constant.MOBILE_START_PATH)) {
			return "MO";
		}
		return "PC";
	}
}

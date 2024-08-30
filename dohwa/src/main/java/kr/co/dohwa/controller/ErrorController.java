package kr.co.dohwa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.controller.front.BaseController;
import kr.co.dohwa.util.CommonUtils;

@Controller
public class ErrorController extends BaseController {

	@RequestMapping("/errors")
	public String error(HttpServletRequest request, Model model) {
		
		String errorMsg = "";
		String errorPage = "error/error500";
		int httpErrorCode = (int) request.getAttribute("javax.servlet.error.status_code");

		switch (httpErrorCode) {
			case 400: {
				errorMsg = "Http Error Code: 400. Bad Request";
				break;
			}
			case 401: {
				errorMsg = "Http Error Code: 401. Unauthorized";
				break;
			}
			case 404: {
				errorMsg = "Http Error Code: 404. Resource not found";
				errorPage = "error/error404";
				break;
			}
			case 500: {
				errorMsg = "Http Error Code: 500. Internal Server Error";
				break;
			}
		}

		model.addAttribute("errorMsg", errorMsg);

		return errorViewPath() + errorPage;
	}
	
	/**
	 * 예전 도화 홈페이지같은 경우 .do로 uri가 생성되어 있으므로 혹시나 예전 url로 접근했을때 에러페이지가 아닌 메인 페이지로 리다이렉트 처리되도록 컨트롤러 매핑 정의함.
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/**/*.do")
	public String oldUri(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(CommonUtils.isMobileDevice(request)) {
			return "redirect:"+Constant.MOBILE_START_PATH+"main"; 
		} else {
			return "redirect:/main"; 
		}
		
	}
}

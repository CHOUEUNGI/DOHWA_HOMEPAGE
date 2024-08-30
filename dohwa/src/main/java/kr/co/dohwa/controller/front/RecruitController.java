package kr.co.dohwa.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dohwa.constants.Constant;

/**
 * 채용정보
 * @author PARK
 */
@Controller
@RequestMapping({"recruit", Constant.MOBILE_START_PATH + "recruit"})
public class RecruitController extends BaseController {

	/**
	 * 채용 절차
	 * @return
	 */
	@GetMapping("procedure")
	public String procedure() {
		return frontViewPath() + "/procedure";
	}
	
	/**
	 * 복리후생
	 * @return
	 */
	@GetMapping("benefit")
	public String benefit() {
		return frontViewPath() + "/benefit";
	}
}

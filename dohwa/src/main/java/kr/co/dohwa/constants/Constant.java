package kr.co.dohwa.constants;

import java.util.HashMap;
import java.util.Map;

public class Constant {

	public static final String[] LANG_CODES = {"KO", "EN", "ES"};

	public static final String DOHWA_MESSAGE_KEY = "DOHWA_MESSAGE";

	public static final String STRING_REQUEST_BODY = "requestBody";

	public static final String X_FORWARDED_FOR = "X-FORWARDED-FOR";

	public static final String STRING_ANONYMOUS = "anonymous";

	public static final String MENU_TYPE_INTERNAL = "internal";

	public static final String MOBILE_START_KEYWORD = "m";
	public static final String MOBILE_START_PATH = "/"+MOBILE_START_KEYWORD+"/";

	public static final Map<String, String> REQUEST_METHOD_MAP = new HashMap<String, String>() {
		private static final long serialVersionUID = -2464307424342716613L;
		{
			put("get", "조회");
			put("post", "저장");
			put("delete", "삭제");
		}
	};

}
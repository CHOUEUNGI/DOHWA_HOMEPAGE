package kr.co.dohwa.util;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtil {
	/**
	 * 문자열이 있는지 확인한다.<br>
	 * Oracle nvl() 과 비슷한 기능을 한다. 자바에서 "null" 이라고 찍히는 것을 방지하기 위한 함수. null 일 경우,
	 * "" (빈스트링)을 리턴한다.
	 * 
	 * @param val 비교대상 문자열
	 * @return String
	 */
	public static String nvl(String val) {
		return nvl(val, "");
	}

	/**
	 * 문자열이 있는지 확인한다.<br>
	 * Oracle nvl() 과 비슷한 기능을 한다. 자바에서 "null" 이라고 찍히는 것을 방지하기 위한 함수. null 일 경우,
	 * rep을 리턴한다.
	 * 
	 * @param val 비교대상 문자열
	 * @param rep null 일 경우, 대체값
	 * @return String
	 */
	public static String nvl(String val, String rep) {
		if(val==null || "".equals(val)){
			val = rep ;
		}
		return val;
	}

	/**
	 * 문자열이 있는지 확인한다.<br>
	 * Oracle nvl() 과 비슷한 기능을 한다. 자바에서 "null" 이라고 찍히는 것을 방지하기 위한 함수.<br>
	 * 
	 * null 일 경우, rep을 리턴한다. 추가적으로 대상문자열을 trim() 한 후, 0 보다 작거나 같은 경우에도 rep 를
	 * 리턴한다.
	 * 
	 * @param val 비교대상 문자열
	 * @param rep null 일 경우, 대체값
	 * @return String
	 */
	public static String nvl2(String val, String rep) {
		if (val == null) {
			return rep;
		}
		return (val.trim().length() <= 0) ? rep : val.trim();
	}
	
	/**
	 * 입력받은 val 값이 0보다 작은 수가  rep 값으로 대체한다.
	 * @param val
	 * @param rep
	 * @return int
	 */
	public static int intNvl(int val, int rep) {
		return (val <= 0) ? rep : val;
	}

	/**
	 * 문자열의 일부를 잘라 리턴한다.<br>
	 * null 일 경우와 원하는 길이보다 작을 경우도 처리한다.
	 * 
	 * @param s 문자열
	 * @param len 원하는 길이
	 * @return String
	 */
	public static String substring(String s, int len) {
		if (s == null) {
			return "";
		}
		if (s.length() < len) {
			return s;
		}
		return s.substring(0, len);
	}
	
	/**
	 * 개행문자를 <br/>
	 * 로 바꾼다.<br>
	 * 
	 * @param content
	 * @return String
	 */
	public static String nl2br(String content) {
		//content = translate(content, "\n", "<br />\n");
		content = translate(content, "\r", "<br />\n");
		return content;
	}
	
	/**
	 * 길이가 큰 문자열 내에서 특정 문자를 대체 문자로 바꾸는 함수<br>
	 * 
	 * @param content 대상 문자열
	 * @param pattern 특정 문자열
	 * @param replace 대체 문자열
	 * @return String
	 */
	public static String translate(String content, String pattern,
			String replace) {
		if (content == null)
			return "";
		int s = 0;
		int e = 0;
		StringBuffer result = new StringBuffer();
		while ((e = content.indexOf(pattern, s)) >= 0) {
			result.append(content.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}
		result.append(content.substring(s));
		return result.toString();
	}
	
	/**
	 * 문자열을 trim() 한다.<br>
	 * null 인지 확인하는 부분이 추가되어 있슴.
	 * 
	 * @param s
	 * @return String
	 */
	public static String cleanup(String s) {
		return s != null ? s.trim() : "";
	}
	
	/**
	 * 파일명 확장자를 추출 한다.<br>
	 * 명시된 결과가 없을 경우 etc 반환.
	 * 
	 * @param fileName
	 * @return String
	 */
	public static String getFileNameExt(String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		
		if (!"doc".equals(ext) && !"hwp".equals(ext) && !"pdf".equals(ext) && !"ppt".equals(ext) && !"xls".equals(ext)) {
			ext = "etc";
		}
	
		return ext;
	}
	
	/**
	 * 문자열을 입력받아서, HTML 태그를 제거한다.
	 * 
	 * @param str
	 * @return String
	 */	
	public static String removeTag(String str){
		String newStr = "";
		if(str != null){
			newStr = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");	
			newStr = newStr.replaceAll("(<([a-z!/]+)[^>]*>)|([\\t\\x0B\\f]+)|(([\\r\\n][\\r\\n])+)|(-->)", "");
		}
		return newStr;
	}	
	
	/**
	 * 문자열을 입력받아서, 3자리 단위마다 구분자처리한다.
	 * 
	 * @Method Name : makeMoneyType
	 * @param moneyString
	 * @return
	 */
	public static String makeMoneyType(int money){ 
        DecimalFormat df = (DecimalFormat)NumberFormat.getInstance(); 
        df = new DecimalFormat("##,###.##"); 
        return df.format(money); 
    } 
	
	/**
	 * 문자열을 입력받아서, 3자리 단위마다 구분자처리한다. 0일때는 공백으로 보여준다.
	 * 
	 * @Method Name : makeMoneyTypeIsNull
	 * @param moneyString
	 * @return
	 */
	public static String makeMoneyTypeIsNull(int money){
		if(0 == money){
			return "";	
		}else{
			DecimalFormat df = (DecimalFormat)NumberFormat.getInstance(); 
			df = new DecimalFormat("##,###.##"); 
			return df.format(money); 
		}
    }
	
	/**
	 * JSONObject 에 있는 KEY 값으로 content 내용을 찾아 VALUE 값으로 REPLACE 한다.
	 * @MethodName : contentMapping
	 * @param content
	 * @param jsonObject
	 * @return String
	 */
	/*public static String contentMapping(String content, JSONObject jsonObject) {
		String result = content;
		
		for (Object objectKey : jsonObject.keySet()) {
	        String key   = (String) objectKey;
	        String value = (String) jsonObject.get(key);
	        
	        if(0 < content.indexOf(key)) {
	        	result = result.replace(key, value);
	        }
	    }
		
		return result;
	}*/
	
	/**
	 * @MethodName : getStringBlankZ
	 * @Desc   : 문자숫자 조합 pk일때 숫자 max+1을 리턴, 한자리 일때 0추가
	 * @param inValue
	 * @return returnValue
	 */
	public static String getStringBlankZ(String inValue) {
		String returnValue = "";
		
		if(!"".equals(inValue)) {
			String inValueSub = inValue.substring(inValue.length()-2, inValue.length());
			int inInt = Integer.parseInt(inValueSub)+1;
			
			returnValue = inInt+"";
			
			if(returnValue.length() < 2) {
				returnValue = "0"+returnValue;
			}
		}
		
		return returnValue;
	}

	/**
	 * 3자리마다 comma로 구분지어 주는 문자열 생성
	 * @param money	금액
	 * @return
	 */
	public static String formatMoneyComma(int money) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(money);
	}
	
	/**
	 * 지역명에 따른 코드를 반환
	 * @param areaName 지역명
	 * @return
	 */
	public static String getAreaCd(String areaName) {
		String areaCd = "";
		
		switch (areaName) {
		case "서울":
			areaCd = "01";
			break;
		case "경기":
			areaCd = "02";
			break;
		case "인천":
			areaCd = "03";
			break;
		case "광주":
			areaCd = "04";
			break;
		case "대구":
			areaCd = "05";
			break;
		case "욹산":
			areaCd = "06";
			break;
		case "부산":
			areaCd = "07";
			break;
		case "제주":
			areaCd = "08";
			break;
		case "강원":
			areaCd = "09";
			break;
		case "충북":
			areaCd = "10";
			break;
		case "충남":
			areaCd = "11";
			break;
		case "전북":
			areaCd = "12";
			break;
		case "전남":
			areaCd = "13";
			break;
		case "경북":
			areaCd = "14";
			break;
		case "경남":
			areaCd = "15";
			break;
		case "세종":
			areaCd = "16";
			break;
		case "대전":
			areaCd = "17";
			break;
		default : 
			areaCd = "99";
		}
		
		return areaCd;
	}
	
	/**
     * <p>
     * String이 비었거나("") 혹은 null 인지 검증한다.
     * </p>
     *
     * <pre>
     *  StringUtil.isEmpty(null)      = true
     *  StringUtil.isEmpty("")        = true
     *  StringUtil.isEmpty(" ")       = false
     *  StringUtil.isEmpty("bob")     = false
     *  StringUtil.isEmpty("  bob  ") = false
     * </pre>
     *
     * @param str - 체크 대상 스트링오브젝트이며 null을 허용함
     * @return <code>true</code> - 입력받은 String 이 빈 문자열 또는 null인 경우
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
	
    /**
     * <p>기준 문자열에 포함된 모든 대상 문자(char)를 제거한다.</p>
     *
     * <pre>
     * StringUtil.remove(null, *)       = null
     * StringUtil.remove("", *)         = ""
     * StringUtil.remove("queued", 'u') = "qeed"
     * StringUtil.remove("queued", 'z') = "queued"
     * </pre>
     *
     * @param str  입력받는 기준 문자열
     * @param remove  입력받는 문자열에서 제거할 대상 문자열
     * @return 제거대상 문자열이 제거된 입력문자열. 입력문자열이 null인 경우 출력문자열은 null
     */
    public static String remove(String str, char remove) {
        if (isEmpty(str) || str.indexOf(remove) == -1) {
            return str;
        }
        char[] chars = str.toCharArray();
        int pos = 0;
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] != remove) {
                chars[pos++] = chars[i];
            }
        }
        return new String(chars, 0, pos);
    }
	
	public static String removeMinusChar(String str) {
        return remove(str, '-');
    }
	
	public static String NULL2STR(String in){
		if(in == null){
			return "";
		} else {
			return in;
		}
	}
	
	/**
     * 객체가 null인지 확인하고 null인 경우 "" 로 바꾸는 메서드
     * @param object 원본 객체
     * @return resultVal 문자열
     */
    public static String isNullToString(Object object) {
        String string = "";
        
        if (object != null) {
            string = object.toString().trim();
        }
        
        return string;
    }
    
    public static String DATE2STR(Date date, String format){
		
		DateFormat sdFormat = new SimpleDateFormat(format);
		 
		String tempDate = sdFormat.format(date);
		
		return tempDate;
	}

	public static String DBL2FORMATTEDSTR(double in){
		NumberFormat nf = NumberFormat.getNumberInstance();
		
		return nf.format(in);
	}
	
	public static String getDayOfWeek(int dayOfWeekNum) {
		String dayOfWeek = "";
		
		switch(dayOfWeekNum) {
			case 1 : 
				dayOfWeek = "SUN";
				break;
			case 2 : 
				dayOfWeek = "MON";
				break;
			case 3 : 
				dayOfWeek = "TUE";
				break;
			case 4 : 
				dayOfWeek = "WEN";
				break;
			case 5 : 
				dayOfWeek = "THU";
				break;
			case 6 : 
				dayOfWeek = "FRI";
				break;
			case 7 : 
				dayOfWeek = "SAT";
				break;
		}
		return dayOfWeek;
	}
	
	/**
	 * 날씨 조회시 풍향을 한글로 return한다
	 * @param windDir	금액
	 * @return
	 */
	public static String getWindDir(String windDir) {
		String returnValue = "";
		
		switch(windDir) {
			case "N" : 
				returnValue = "북";
				break;
			case "NE" : 
				returnValue = "북동";
				break;
			case "E" : 
				returnValue = "동";
				break;
			case "SE" : 
				returnValue = "남동";
				break;
			case "S" : 
				returnValue = "남";
				break;
			case "SW" : 
				returnValue = "남서";
				break;
			case "W" : 
				returnValue = "서";
				break;
			case "NW" : 
				returnValue = "북서";
				break;
		}
		return returnValue;
	}
	
	/**
	 * Convert Bytes to KB, MB, GB, TB
	 * @param size
	 * @return
	 */
	public static String getSize(long size) {
		String s = "";
		double kb = size / 1024;
		double mb = kb / 1024;
		double gb = kb / 1024;
		double tb = kb / 1024;
		
		if(size < 1024) {
			s = size + " Bytes";
		} else if(size >= 1024 && size < (1024 * 1024)) {
			s =  String.format("%.2f", kb) + " KB";
		} else if(size >= (1024 * 1024) && size < (1024 * 1024 * 1024)) {
			s = String.format("%.2f", mb) + " MB";
		} else if(size >= (1024 * 1024 * 1024) && size < (1024 * 1024 * 1024 * 1024)) {
			s = String.format("%.2f", gb) + " GB";
		} else if(size >= (1024 * 1024 * 1024 * 1024)) {
			s = String.format("%.2f", tb) + " TB";
		}
		return s;
	}

}

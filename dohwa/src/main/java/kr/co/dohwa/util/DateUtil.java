package kr.co.dohwa.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DateUtil {

	/**
	 * 날짜형태의 String의 날짜 포맷만을 변경해 주는 메서드
	 * @param sDate 날짜
	 * @param sTime 시간
	 * @param sFormatStr 포멧 스트링 문자열
	 * @return 지정한 날짜/시간을 지정한 포맷으로 출력
	 * @See Letter  Date or Time Component  Presentation  Examples
			   G  Era designator  Text  AD
			   y  Year  Year  1996; 96
			   M  Month in year  Month  July; Jul; 07
			   w  Week in year  Number  27
			   W  Week in month  Number  2
			   D  Day in year  Number  189
			   d  Day in month  Number  10
			   F  Day of week in month  Number  2
			   E  Day in week  Text  Tuesday; Tue
			   a  Am/pm marker  Text  PM
			   H  Hour in day (0-23)  Number  0
			   k  Hour in day (1-24)  Number  24
			   K  Hour in am/pm (0-11)  Number  0
			   h  Hour in am/pm (1-12)  Number  12
			   m  Minute in hour  Number  30
			   s  Second in minute  Number  55
			   S  Millisecond  Number  978
			   z  Time zone  General time zone  Pacific Standard Time; PST; GMT-08:00
			   Z  Time zone  RFC 822 time zone  -0800



			   Date and Time Pattern  Result
			   "yyyy.MM.dd G 'at' HH:mm:ss z"  2001.07.04 AD at 12:08:56 PDT
			   "EEE, MMM d, ''yy"  Wed, Jul 4, '01
			   "h:mm a"  12:08 PM
			   "hh 'o''clock' a, zzzz"  12 o'clock PM, Pacific Daylight Time
			   "K:mm a, z"  0:08 PM, PDT
			   "yyyyy.MMMMM.dd GGG hh:mm aaa"  02001.July.04 AD 12:08 PM
			   "EEE, d MMM yyyy HH:mm:ss Z"  Wed, 4 Jul 2001 12:08:56 -0700
			   "yyMMddHHmmssZ"  010704120856-0700

	 */
	public static String convertDate(String sDate, String sTime, String sFormatStr) {
		String dateStr = validChkDate(sDate);
		String timeStr = validChkTime(sTime);

		Calendar cal = null;
		cal = Calendar.getInstance() ;

		cal.set(Calendar.YEAR		, Integer.parseInt(dateStr.substring(0,4)));
		cal.set(Calendar.MONTH	   , Integer.parseInt(dateStr.substring(4,6))-1 );
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6,8)));
		cal.set(Calendar.HOUR_OF_DAY , Integer.parseInt(timeStr.substring(0,2)));
		cal.set(Calendar.MINUTE	  , Integer.parseInt(timeStr.substring(2,4)));

		SimpleDateFormat sdf = new SimpleDateFormat(sFormatStr,Locale.ENGLISH);

		return sdf.format(cal.getTime());
	}
	
	/**
	 * 입력된 일자 문자열을 확인하고 8자리로 리턴
	 * @param sDate
	 * @return
	 */
	public static String validChkDate(String dateStr) {
		String _dateStr = dateStr;

		if (dateStr == null || !(dateStr.trim().length() == 8 || dateStr.trim().length() == 10)) {
			throw new IllegalArgumentException("Invalid date format: " + dateStr);
		}
		if (dateStr.length() == 10) {
			_dateStr = StringUtil.removeMinusChar(dateStr);
		}
		return _dateStr;
	}

	/**
	 * 입력된 일자 문자열을 확인하고 8자리로 리턴
	 * @param sDate
	 * @return
	 */
	public static String validChkTime(String timeStr) {
		String _timeStr = timeStr;

		if (_timeStr.length() == 5) {
			_timeStr = StringUtil.remove(_timeStr,':');
		}
		if (_timeStr == null || !(_timeStr.trim().length() == 4)) {
			throw new IllegalArgumentException("Invalid time format: " + _timeStr);
		}

		return _timeStr;
	}

	/**
	 * 현재(한국기준) 날짜정보를 얻는다.					 <BR>
	 * 표기법은 yyyy-mm-dd								  <BR>
	 * @return  String	  yyyymmdd형태의 현재 한국시간.   <BR>
	 */
	public static String getToday(){
		return getCurrentDate("");
	}

	/**
	 * 현재(한국기준) 날짜정보를 얻는다.					 <BR>
	 * 표기법은 yyyy-mm-dd								  <BR>
	 * @return  String	  yyyymmdd형태의 현재 한국시간.   <BR>
	 */
	public static String getCurrentDate(String dateType) {
		Calendar aCalendar = Calendar.getInstance();

		int year = aCalendar.get(Calendar.YEAR);
		int month = aCalendar.get(Calendar.MONTH) + 1;
		int date = aCalendar.get(Calendar.DATE);
		String strDate = Integer.toString(year) +
				((month<10) ? "0" + Integer.toString(month) : Integer.toString(month)) +
				((date<10) ? "0" + Integer.toString(date) : Integer.toString(date));

		if(!"".equals(dateType)) strDate = convertDate(strDate, "yyyyMMdd", dateType);

		return  strDate;
	}

	/**
	 * 현재 시간 및 날짜를 스트링 형태로 반환
	 * 예) 20031010100333
	 *
	 * @return 현재날짜 및 시간
	 */
	public static String getCurrDateTime() {
		return new SimpleDateFormat( "yyyyMMddHHmmss", Locale.KOREA ).format( new Date() );
	}

	public static String DateAdd(String date, int days){
		return DateAdd(date, days, "yyyy-MM-dd");
	}

	public static String DateAdd(String date, int days, String fmt) {
		
		Calendar calendar = Calendar.getInstance();
		
		calendar.setTime(STR2DATE(date));
		
		calendar.add(Calendar.DATE, days);
		SimpleDateFormat dFormat = new SimpleDateFormat (fmt);
		
		return dFormat.format (calendar.getTime());
	}

	private static Date STR2DATE(String str) {
		
		String d = str.replaceAll("-", "");
		
		DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		Date tempDate = new Date();
		
		try {
			tempDate = sdFormat.parse(d);
		} catch (ParseException e) {
			log.error("DateUtil STR2DATE Errror {}", e);
		}
		
		return tempDate;
	}

	public static String getCurrentDate2(String fmt) {
		Calendar calendar = Calendar.getInstance();
		
		SimpleDateFormat dFormat = new SimpleDateFormat (fmt);
		
		return dFormat.format (calendar.getTime());
	}

}

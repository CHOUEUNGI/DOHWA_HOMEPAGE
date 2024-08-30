package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 일자별 시세
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "AskPrice")
public class DailyStockResponse {
	/**
	 * 일자
	 */
	private String day_Date;
	
	/**
	 * 종가
	 */
	private String day_EndPrice;
	
	/**
	 * 동락
	 */
	private String day_Dungrak;
	
	/**
	 * 전일 대비
	 */
	private String day_getDebi;
	
	/**
	 * 시가
	 */
	private String day_Start;
	
	/**
	 * 고가
	 */
	private String day_High;
	
	/**
	 * 저가
	 */
	private String day_Low;
	
	/**
	 * 거래량
	 */
	private String day_Volume;
	
	/**
	 * 거래대금
	 */
	private String day_getAmount;

	public String getDay_Date() {
		return day_Date;
	}

	@XmlAttribute(name = "day_Date")
	public void setDay_Date(String day_Date) {
		this.day_Date = day_Date;
	}

	public String getDay_EndPrice() {
		return day_EndPrice;
	}

	@XmlAttribute(name = "day_EndPrice")
	public void setDay_EndPrice(String day_EndPrice) {
		this.day_EndPrice = day_EndPrice;
	}

	public String getDay_Dungrak() {
		return day_Dungrak;
	}

	@XmlAttribute(name = "day_Dungrak")
	public void setDay_Dungrak(String day_Dungrak) {
		this.day_Dungrak = day_Dungrak;
	}

	public String getDay_getDebi() {
		return day_getDebi;
	}

	@XmlAttribute(name = "day_getDebi")
	public void setDay_getDebi(String day_getDebi) {
		this.day_getDebi = day_getDebi;
	}

	public String getDay_Start() {
		return day_Start;
	}

	@XmlAttribute(name = "day_Start")
	public void setDay_Start(String day_Start) {
		this.day_Start = day_Start;
	}

	public String getDay_High() {
		return day_High;
	}

	@XmlAttribute(name = "day_High")
	public void setDay_High(String day_High) {
		this.day_High = day_High;
	}

	public String getDay_Low() {
		return day_Low;
	}

	@XmlAttribute(name = "day_Low")
	public void setDay_Low(String day_Low) {
		this.day_Low = day_Low;
	}

	public String getDay_Volume() {
		return day_Volume;
	}

	@XmlAttribute(name = "day_Volume")
	public void setDay_Volume(String day_Volume) {
		this.day_Volume = day_Volume;
	}

	public String getDay_getAmount() {
		return day_getAmount;
	}

	@XmlAttribute(name = "day_getAmount")
	public void setDay_getAmount(String day_getAmount) {
		this.day_getAmount = day_getAmount;
	}
}

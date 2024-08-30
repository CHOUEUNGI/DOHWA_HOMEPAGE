package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 주가 정보
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "TBL_StockInfo")
public class StockInfoResponse {
	/**
	 * 종목명
	 */
	private String JongName;
	
	/**
	 * 현재가
	 */
	private String CurJuka;
	
	/**
	 * 등락
	 */
	private String DungRak;
	
	/**
	 * 전일대비
	 */
	private String Debi;
	
	/**
	 * 전일주가
	 */
	private String PrevJuka;
	
	/**
	 * 거래량
	 */
	private String Volume;
	
	/**
	 * 거래대금
	 */
	private String Money;
	
	/**
	 * 시가
	 */
	private String StartJuka;
	
	/**
	 * 고가
	 */
	private String HighJuka;
	
	/**
	 * 저가
	 */
	private String LowJuka;
	
	/**
	 * 52주 최고
	 */
	private String High52;
	
	/**
	 * 52주 최저
	 */
	private String Low52;
	
	/**
	 * 상한가
	 */
	private String UpJuka;
	
	/**
	 * 하한가
	 */
	private String DownJuka;
	
	/**
	 * PER
	 */
	private String Per;
	
	/**
	 * 상장주식수
	 */
	private String Amount;
	
	/**
	 * 액면가
	 */
	private String FaceJuka;

	public String getJongName() {
		return JongName;
	}

	@XmlAttribute(name = "JongName")
	public void setJongName(String jongName) {
		this.JongName = jongName;
	}

	public String getCurJuka() {
		return CurJuka;
	}

	@XmlAttribute(name = "CurJuka")
	public void setCurJuka(String curJuka) {
		this.CurJuka = curJuka;
	}

	public String getDungRak() {
		return DungRak;
	}

	@XmlAttribute(name = "DungRak")
	public void setDungRak(String dungRak) {
		this.DungRak = dungRak;
	}

	public String getDebi() {
		return Debi;
	}

	@XmlAttribute(name = "Debi")
	public void setDebi(String debi) {
		this.Debi = debi;
	}

	public String getPrevJuka() {
		return PrevJuka;
	}

	@XmlAttribute(name = "PrevJuka")
	public void setPrevJuka(String prevJuka) {
		this.PrevJuka = prevJuka;
	}

	public String getVolume() {
		return Volume;
	}

	@XmlAttribute(name = "Volume")
	public void setVolume(String volume) {
		this.Volume = volume;
	}

	public String getMoney() {
		return Money;
	}

	@XmlAttribute(name = "Money")
	public void setMoney(String money) {
		this.Money = money;
	}

	public String getStartJuka() {
		return StartJuka;
	}

	@XmlAttribute(name = "StartJuka")
	public void setStartJuka(String startJuka) {
		this.StartJuka = startJuka;
	}

	public String getHighJuka() {
		return HighJuka;
	}

	@XmlAttribute(name = "HighJuka")
	public void setHighJuka(String highJuka) {
		this.HighJuka = highJuka;
	}

	public String getLowJuka() {
		return LowJuka;
	}

	@XmlAttribute(name = "LowJuka")
	public void setLowJuka(String lowJuka) {
		this.LowJuka = lowJuka;
	}

	public String getHigh52() {
		return High52;
	}

	@XmlAttribute(name = "High52")
	public void setHigh52(String high52) {
		this.High52 = high52;
	}

	public String getLow52() {
		return Low52;
	}

	@XmlAttribute(name = "Low52")
	public void setLow52(String low52) {
		this.Low52 = low52;
	}

	public String getUpJuka() {
		return UpJuka;
	}

	@XmlAttribute(name = "UpJuka")
	public void setUpJuka(String upJuka) {
		this.UpJuka = upJuka;
	}

	public String getDownJuka() {
		return DownJuka;
	}

	@XmlAttribute(name = "DownJuka")
	public void setDownJuka(String downJuka) {
		this.DownJuka = downJuka;
	}

	public String getPer() {
		return Per;
	}

	@XmlAttribute(name = "Per")
	public void setPer(String per) {
		this.Per = per;
	}

	public String getAmount() {
		return Amount;
	}

	@XmlAttribute(name = "Amount")
	public void setAmount(String amount) {
		this.Amount = amount;
	}

	public String getFaceJuka() {
		return FaceJuka;
	}

	@XmlAttribute(name = "FaceJuka")
	public void setFaceJuka(String faceJuka) {
		this.FaceJuka = faceJuka;
	}
}

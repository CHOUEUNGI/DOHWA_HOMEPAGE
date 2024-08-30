package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 시간대별 체결가
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "TBL_TimeConclude")
public class TimeConcludeResponse {
	/**
	 * 시간
	 */
	private String time;
	
	/**
	 * 체결가
	 */
	private String negoprice;
	
	/**
	 * 동락
	 */
	private String Dungrak;
	
	/**
	 * 전일대비
	 */
	private String Debi;

	/**
	 * 매도 호가
	 */
	private String sellprice;
	
	/**
	 * 매수 호가
	 */
	private String buyprice;
	
	/**
	 * 채결량
	 */
	private String amount;

	public String getTime() {
		return time;
	}

	@XmlAttribute(name = "time")
	public void setTime(String time) {
		this.time = time;
	}

	public String getNegoprice() {
		return negoprice;
	}

	@XmlAttribute(name = "negoprice")
	public void setNegoprice(String negoprice) {
		this.negoprice = negoprice;
	}

	public String getDungrak() {
		return Dungrak;
	}

	@XmlAttribute(name = "Dungrak")
	public void setDungrak(String dungrak) {
		this.Dungrak = dungrak;
	}

	public String getDebi() {
		return Debi;
	}

	@XmlAttribute(name = "Debi")
	public void setDebi(String debi) {
		this.Debi = debi;
	}

	public String getSellprice() {
		return sellprice;
	}

	@XmlAttribute(name = "buyprice")
	public void setSellprice(String sellprice) {
		this.sellprice = sellprice;
	}

	public String getBuyprice() {
		return buyprice;
	}

	@XmlAttribute(name = "buyprice")
	public void setBuyprice(String buyprice) {
		this.buyprice = buyprice;
	}

	public String getAmount() {
		return amount;
	}

	@XmlAttribute(name = "amount")
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}

package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 주가 정보(코스닥, 지수 정보등)
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "stockInfo")
public class StockInfoKosResponse {
	
	private String kosdaqJisu;
	
	private String kosdaqJisuBuho;
	
	private String kosdaqJisuDebi;
	
	private String starJisu;
	
	private String starJisuBuho;
	
	private String starJisuDebi;
	
	private String jisu50;
	
	private String jisu50Buho;
	
	private String jisu50Debi;
	
	private String myNowTime;
	
	private String myJangGubun;

	private String myPublicPrice;
	
	private String krx100Jisu;
	
	private String krx100buho;
	
	private String krx100Debi;
	
	private String kospiJisu;
	
	private String kospiBuho;
	
	private String kospiDebi;
	
	private String kospi200Jisu;
	
	private String kospi200Buho;
	
	private String kospi200Debi;

	public String getKosdaqJisu() {
		return kosdaqJisu;
	}

	@XmlAttribute(name = "kosdaqJisu")
	public void setKosdaqJisu(String kosdaqJisu) {
		this.kosdaqJisu = kosdaqJisu;
	}

	public String getKosdaqJisuBuho() {
		return kosdaqJisuBuho;
	}

	@XmlAttribute(name = "kosdaqJisuBuho")
	public void setKosdaqJisuBuho(String kosdaqJisuBuho) {
		this.kosdaqJisuBuho = kosdaqJisuBuho;
	}

	public String getKosdaqJisuDebi() {
		return kosdaqJisuDebi;
	}

	@XmlAttribute(name = "kosdaqJisuDebi")
	public void setKosdaqJisuDebi(String kosdaqJisuDebi) {
		this.kosdaqJisuDebi = kosdaqJisuDebi;
	}

	public String getStarJisu() {
		return starJisu;
	}

	@XmlAttribute(name = "starJisu")
	public void setStarJisu(String starJisu) {
		this.starJisu = starJisu;
	}

	public String getStarJisuBuho() {
		return starJisuBuho;
	}

	@XmlAttribute(name = "starJisuBuho")
	public void setStarJisuBuho(String starJisuBuho) {
		this.starJisuBuho = starJisuBuho;
	}

	public String getStarJisuDebi() {
		return starJisuDebi;
	}

	@XmlAttribute(name = "starJisuDebi")
	public void setStarJisuDebi(String starJisuDebi) {
		this.starJisuDebi = starJisuDebi;
	}

	public String getJisu50() {
		return jisu50;
	}

	@XmlAttribute(name = "jisu50")
	public void setJisu50(String jisu50) {
		this.jisu50 = jisu50;
	}

	public String getJisu50Buho() {
		return jisu50Buho;
	}

	@XmlAttribute(name = "jisu50Buho")
	public void setJisu50Buho(String jisu50Buho) {
		this.jisu50Buho = jisu50Buho;
	}

	public String getJisu50Debi() {
		return jisu50Debi;
	}

	@XmlAttribute(name = "jisu50Debi")
	public void setJisu50Debi(String jisu50Debi) {
		this.jisu50Debi = jisu50Debi;
	}

	public String getMyNowTime() {
		return myNowTime;
	}

	@XmlAttribute(name = "myNowTime")
	public void setMyNowTime(String myNowTime) {
		this.myNowTime = myNowTime;
	}

	public String getMyJangGubun() {
		return myJangGubun;
	}

	@XmlAttribute(name = "myJangGubun")
	public void setMyJangGubun(String myJangGubun) {
		this.myJangGubun = myJangGubun;
	}

	public String getMyPublicPrice() {
		return myPublicPrice;
	}

	@XmlAttribute(name = "myPublicPrice")
	public void setMyPublicPrice(String myPublicPrice) {
		this.myPublicPrice = myPublicPrice;
	}

	public String getKrx100Jisu() {
		return krx100Jisu;
	}

	@XmlAttribute(name = "krx100Jisu")
	public void setKrx100Jisu(String krx100Jisu) {
		this.krx100Jisu = krx100Jisu;
	}

	public String getKrx100buho() {
		return krx100buho;
	}

	@XmlAttribute(name = "krx100buho")
	public void setKrx100buho(String krx100buho) {
		this.krx100buho = krx100buho;
	}

	public String getKrx100Debi() {
		return krx100Debi;
	}

	@XmlAttribute(name = "krx100Debi")
	public void setKrx100Debi(String krx100Debi) {
		this.krx100Debi = krx100Debi;
	}

	public String getKospiJisu() {
		return kospiJisu;
	}

	@XmlAttribute(name = "kospiJisu")
	public void setKospiJisu(String kospiJisu) {
		this.kospiJisu = kospiJisu;
	}

	public String getKospiBuho() {
		return kospiBuho;
	}

	@XmlAttribute(name = "kospiBuho")
	public void setKospiBuho(String kospiBuho) {
		this.kospiBuho = kospiBuho;
	}

	public String getKospiDebi() {
		return kospiDebi;
	}

	@XmlAttribute(name = "kospiDebi")
	public void setKospiDebi(String kospiDebi) {
		this.kospiDebi = kospiDebi;
	}

	public String getKospi200Jisu() {
		return kospi200Jisu;
	}

	@XmlAttribute(name = "kospi200Jisu")
	public void setKospi200Jisu(String kospi200Jisu) {
		this.kospi200Jisu = kospi200Jisu;
	}

	public String getKospi200Buho() {
		return kospi200Buho;
	}

	@XmlAttribute(name = "kospi200Buho")
	public void setKospi200Buho(String kospi200Buho) {
		this.kospi200Buho = kospi200Buho;
	}

	public String getKospi200Debi() {
		return kospi200Debi;
	}

	@XmlAttribute(name = "kospi200Debi")
	public void setKospi200Debi(String kospi200Debi) {
		this.kospi200Debi = kospi200Debi;
	}
	
}

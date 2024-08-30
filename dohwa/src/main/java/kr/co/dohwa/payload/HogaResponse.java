package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 호가
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "TBL_Hoga")
public class HogaResponse {
	/**
	 * 매수 잔량 0
	 */
	private String mesuJan0;
	
	/**
	 * 매수 잔량 1
	 */
	private String mesuJan1;
	
	/**
	 * 매수 잔량 2
	 */
	private String mesuJan2;
	
	/**
	 * 매수 잔량 3
	 */
	private String mesuJan3;
	
	/**
	 * 매수 잔량 4
	 */
	private String mesuJan4;
	
	/**
	 * 매수 호가 0
	 */
	private String mesuHoka0;
	
	/**
	 * 매수 호가 1
	 */
	private String mesuHoka1;
	
	/**
	 * 매수 호가 2
	 */
	private String mesuHoka2;
	
	/**
	 * 매수 호가 3
	 */
	private String mesuHoka3;
	
	/**
	 * 매수 호가 4
	 */
	private String mesuHoka4;
	
	/**
	 * 매도 잔량 0
	 */
	private String medoJan0;
	
	/**
	 * 매도 잔량 1
	 */
	private String medoJan1;
	
	/**
	 * 매도 잔량 2
	 */
	private String medoJan2;
	
	/**
	 * 매도 잔량 3
	 */
	private String medoJan3;
	
	/**
	 * 매도 잔량 4
	 */
	private String medoJan4;
	
	/**
	 * 매도 호가 0
	 */
	private String medoHoka0;
	
	/**
	 * 매도 호가 1
	 */
	private String medoHoka1;
	
	/**
	 * 매도 호가 2
	 */
	private String medoHoka2;
	
	/**
	 * 매도 호가 3
	 */
	private String medoHoka3;
	
	/**
	 * 매도 호가 4
	 */
	private String medoHoka4;

	public String getMesuJan0() {
		return mesuJan0;
	}

	@XmlAttribute(name = "mesuJan0")
	public void setMesuJan0(String mesuJan0) {
		this.mesuJan0 = mesuJan0;
	}

	public String getMesuJan1() {
		return mesuJan1;
	}

	@XmlAttribute(name = "mesuJan1")
	public void setMesuJan1(String mesuJan1) {
		this.mesuJan1 = mesuJan1;
	}

	public String getMesuJan2() {
		return mesuJan2;
	}

	@XmlAttribute(name = "mesuJan2")
	public void setMesuJan2(String mesuJan2) {
		this.mesuJan2 = mesuJan2;
	}

	public String getMesuJan3() {
		return mesuJan3;
	}

	@XmlAttribute(name = "mesuJan3")
	public void setMesuJan3(String mesuJan3) {
		this.mesuJan3 = mesuJan3;
	}

	public String getMesuJan4() {
		return mesuJan4;
	}

	@XmlAttribute(name = "mesuJan4")
	public void setMesuJan4(String mesuJan4) {
		this.mesuJan4 = mesuJan4;
	}

	public String getMesuHoka0() {
		return mesuHoka0;
	}

	@XmlAttribute(name = "mesuHoka0")
	public void setMesuHoka0(String mesuHoka0) {
		this.mesuHoka0 = mesuHoka0;
	}

	public String getMesuHoka1() {
		return mesuHoka1;
	}

	@XmlAttribute(name = "mesuHoka1")
	public void setMesuHoka1(String mesuHoka1) {
		this.mesuHoka1 = mesuHoka1;
	}

	public String getMesuHoka2() {
		return mesuHoka2;
	}

	@XmlAttribute(name = "mesuHoka2")
	public void setMesuHoka2(String mesuHoka2) {
		this.mesuHoka2 = mesuHoka2;
	}

	public String getMesuHoka3() {
		return mesuHoka3;
	}

	@XmlAttribute(name = "mesuHoka3")
	public void setMesuHoka3(String mesuHoka3) {
		this.mesuHoka3 = mesuHoka3;
	}

	public String getMesuHoka4() {
		return mesuHoka4;
	}

	@XmlAttribute(name = "mesuHoka4")
	public void setMesuHoka4(String mesuHoka4) {
		this.mesuHoka4 = mesuHoka4;
	}

	public String getMedoJan0() {
		return medoJan0;
	}

	@XmlAttribute(name = "medoJan0")
	public void setMedoJan0(String medoJan0) {
		this.medoJan0 = medoJan0;
	}

	public String getMedoJan1() {
		return medoJan1;
	}

	@XmlAttribute(name = "medoJan1")
	public void setMedoJan1(String medoJan1) {
		this.medoJan1 = medoJan1;
	}

	public String getMedoJan2() {
		return medoJan2;
	}

	@XmlAttribute(name = "medoJan2")
	public void setMedoJan2(String medoJan2) {
		this.medoJan2 = medoJan2;
	}

	public String getMedoJan3() {
		return medoJan3;
	}

	@XmlAttribute(name = "medoJan3")
	public void setMedoJan3(String medoJan3) {
		this.medoJan3 = medoJan3;
	}

	public String getMedoJan4() {
		return medoJan4;
	}

	@XmlAttribute(name = "medoJan4")
	public void setMedoJan4(String medoJan4) {
		this.medoJan4 = medoJan4;
	}

	public String getMedoHoka0() {
		return medoHoka0;
	}

	@XmlAttribute(name = "medoHoka0")
	public void setMedoHoka0(String medoHoka0) {
		this.medoHoka0 = medoHoka0;
	}

	public String getMedoHoka1() {
		return medoHoka1;
	}

	@XmlAttribute(name = "medoHoka1")
	public void setMedoHoka1(String medoHoka1) {
		this.medoHoka1 = medoHoka1;
	}

	public String getMedoHoka2() {
		return medoHoka2;
	}

	@XmlAttribute(name = "medoHoka2")
	public void setMedoHoka2(String medoHoka2) {
		this.medoHoka2 = medoHoka2;
	}

	public String getMedoHoka3() {
		return medoHoka3;
	}

	@XmlAttribute(name = "medoHoka3")
	public void setMedoHoka3(String medoHoka3) {
		this.medoHoka3 = medoHoka3;
	}

	public String getMedoHoka4() {
		return medoHoka4;
	}

	@XmlAttribute(name = "medoHoka4")
	public void setMedoHoka4(String medoHoka4) {
		this.medoHoka4 = medoHoka4;
	}
}

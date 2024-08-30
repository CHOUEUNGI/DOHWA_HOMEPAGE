package kr.co.dohwa.payload;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 회원사별 거래
 * 
 * @author PARK
 *
 */
@XmlRootElement(name = "TBL_Hoga")
public class AskPriceResponse {
	/**
	 * 매도 상위 증권사
	 */
	private String member_memdoMem;
	
	/**
	 * 매도 상위 거래량
	 */
	private String member_memdoVol;
	
	/**
	 * 매수 상위 증권사
	 */
	private String member_memsoMem;
	
	/**
	 * 매수 상위 거래량
	 */
	private String member_mesuoVol;

	public String getMember_memdoMem() {
		return member_memdoMem;
	}

	@XmlAttribute(name = "member_memdoMem")
	public void setMember_memdoMem(String member_memdoMem) {
		this.member_memdoMem = member_memdoMem;
	}
	
	public String getMember_memdoVol() {
		return member_memdoVol;
	}

	@XmlAttribute(name = "member_memdoVol")
	public void setMember_memdoVol(String member_memdoVol) {
		this.member_memdoVol = member_memdoVol;
	}

	public String getMember_memsoMem() {
		return member_memsoMem;
	}

	@XmlAttribute(name = "member_memsoMem")
	public void setMember_memsoMem(String member_memsoMem) {
		this.member_memsoMem = member_memsoMem;
	}

	public String getMember_mesuoVol() {
		return member_mesuoVol;
	}

	@XmlAttribute(name = "member_mesuoVol")
	public void setMember_mesuoVol(String member_mesuoVol) {
		this.member_mesuoVol = member_mesuoVol;
	}
}

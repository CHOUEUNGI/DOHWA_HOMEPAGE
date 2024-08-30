package kr.co.dohwa.constants;

import java.util.Optional;

/**
 * pathType변수에 사용할 ENUM 클래스.
 * 대문자로 된 변수명이 DB에 저장되는 코드값,
 * 소문자로 ""에 감싸진 값이 url에 path변수로 사용되는 값.
 * @author 1010
 *
 */
public enum PathType {

	// 투자정보 관리
	INV_REF_EANNO("eAnno"),	//전자공고
	INV_REF_IR("ir"),	//IR Book
	INV_REF_ANNR("annr"),	//Annual Report
	INV_REF_ANAR("anar"),	//Analyst Report
	STOCK_SHCP("shcp"),	// 주주구성
	STOCK_SHMT("shmt"),	// 주주총회
	STOCK_DVST("dvst"),	// 배당현황

	//문의 관리
	CUST_INQR("custInqr");	// 고객문의

	final private String name;

	private PathType(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

	/**
	 * pathType변수에 해당하는 typeCode값을 구하기
	 * @param pathType
	 * @return
	 */
	public static String getPathTypeCode(Optional<String> pathType) {
		String pathTypeStr = pathType.orElse("");
		String retStr = "";
		for(PathType pt : PathType.values()) {
			if(pathTypeStr.equals(pt.getName())) {
				retStr = pt.toString();
			}
		}
		return retStr;
	}
}

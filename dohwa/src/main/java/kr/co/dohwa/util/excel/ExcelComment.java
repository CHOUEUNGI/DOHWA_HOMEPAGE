package kr.co.dohwa.util.excel;

import java.util.List;

/**
 * 엑셀 코맨트 
 * 
 * @author evilcurse
 *
 */
public class ExcelComment {

	/**
	 * 엑셀 내의 데이터 정의
	 */
	private List<ExcelDataAreaDefinition> datas;

	public List<ExcelDataAreaDefinition> getDatas() {
		return datas;
	}

	public void setDatas(List<ExcelDataAreaDefinition> datas) {
		this.datas = datas;
	}

}

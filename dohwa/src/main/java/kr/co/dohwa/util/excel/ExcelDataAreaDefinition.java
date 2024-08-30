package kr.co.dohwa.util.excel;

public class ExcelDataAreaDefinition {

	/**
	 * 엑셀 데이터 정의 타입
	 */
	private ExcelDataAreaDefinitionType type;
	
	/**
	 * 오브젝트 명
	 */
	private String objectName;
	
	/**
	 * 데이터 영역 시작 셀
	 */
	private String startCell;
	
	/**
	 * 데이터 영역 종료 셀
	 */
	private String endCell;

	public ExcelDataAreaDefinitionType getType() {
		return type;
	}

	public void setType(ExcelDataAreaDefinitionType type) {
		this.type = type;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getStartCell() {
		return startCell;
	}

	public void setStartCell(String startCell) {
		this.startCell = startCell;
	}

	public String getEndCell() {
		return endCell;
	}

	public void setEndCell(String endCell) {
		this.endCell = endCell;
	}

	@Override
	public String toString() {
		return "ExcelDataAreaDefinition [type=" + type + ", objectName=" + objectName + ", startCell=" + startCell
				+ ", endCell=" + endCell + "]";
	}
}

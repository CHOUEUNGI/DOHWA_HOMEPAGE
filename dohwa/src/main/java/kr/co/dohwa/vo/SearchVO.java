package kr.co.dohwa.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.util.StringUtils;

import com.google.common.collect.Lists;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("searchVO")
public class SearchVO implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3744357337319889824L;

	private String adminKeepConditionKey;
	private String searchType1;
	private String searchType2;
	private String searchType3;
	private String searchStartDate;
	private String searchEndDate;
	private String searchType;
	private String searchText;
	private String searchTargetId;
	private String searchUseYn;
	private String searchDispYn;
	private String searchLangType = "KO";
	private String searchDeviceType;
	private String searchBoardType;
	private String searchOrder;
	private String page = "1";
	private String dispYn;
	private String yyyy;
	private String seq;
	private String typeCode;
	private List<String> type1 = Lists.newArrayList();
	private List<String> type2 = Lists.newArrayList();
	private List<String> type3 = Lists.newArrayList();
	private List<String> type4 = Lists.newArrayList();
	private List<String> type5 = Lists.newArrayList();
	private int offsetStartNumber = 0;
	private int rowPerPage = 10;

	public int getOffsetStartNumber() {
		if(offsetStartNumber <= 0) {
			this.setOffsetStartNumber(StringUtils.isEmpty(this.page) || this.page.equals("0") ? 0 : (Integer.parseInt(page)-1) * rowPerPage);
		}
		return this.offsetStartNumber;

	}

}

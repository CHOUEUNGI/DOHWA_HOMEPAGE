package kr.co.dohwa.payload;

import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 한국거래소 데이터 매핑
 */
@XmlRootElement(name = "stockprice")
public class KRXResponse {
	private String querytime;

	private List<DailyStockResponse> dailyStockResponse;

	private List<AskPriceResponse> askPriceResponses;
	
	private StockInfoResponse stockInfoResponse;

	private HogaResponse hogaResponse;
	
	private List<TimeConcludeResponse> timeConcludeResponse;
	
	private StockInfoKosResponse stockInfoKosResponse;
	
	/**
	 * 요청 시간?
	 * 
	 * @return
	 */
	public String getQuerytime() {
		return querytime;
	}

	@XmlAttribute
	public void setQuerytime(String querytime) {
		this.querytime = querytime;
	}
	
	/**
	 * 일자별 시세
	 * @return
	 */
	public List<DailyStockResponse> getDailyStockResponse() {
		return dailyStockResponse;
	}

	@XmlElementWrapper(name = "TBL_DailyStock")
	@XmlElement(name = "DailyStock")
	public void setDailyStockResponse(List<DailyStockResponse> dailyStockResponse) {
		this.dailyStockResponse = dailyStockResponse;
	}

	/**
	 * 회원사별 거래
	 * @return
	 */
	public List<AskPriceResponse> getAskPriceResponses() {
		return askPriceResponses;
	}

	@XmlElementWrapper(name = "TBL_AskPrice")
	@XmlElement(name = "AskPrice")
	public void setAskPriceResponses(List<AskPriceResponse> askPriceResponses) {
		this.askPriceResponses = askPriceResponses;
	}

	/**
	 * 주가 정보
	 * @return
	 */
	public StockInfoResponse getStockInfoResponse() {
		return stockInfoResponse;
	}
	
	@XmlElement(name = "TBL_StockInfo")
	public void setStockInfoResponse(StockInfoResponse stockInfoResponse) {
		this.stockInfoResponse = stockInfoResponse;
	}
	
	/**
	 * 호가
	 * @return
	 */
	public HogaResponse getHogaResponse() {
		return hogaResponse;
	}

	@XmlElement(name = "TBL_Hoga")
	public void setHogaResponse(HogaResponse hogaResponse) {
		this.hogaResponse = hogaResponse;
	}

	/**
	 * 시간대별 체결가
	 * @return
	 */
	public List<TimeConcludeResponse> getTimeConcludeResponse() {
		return timeConcludeResponse;
	}

	@XmlElementWrapper(name = "TBL_TimeConclude")
	@XmlElement(name = "TBL_TimeConclude")
	public void setTimeConcludeResponse(List<TimeConcludeResponse> timeConcludeResponse) {
		this.timeConcludeResponse = timeConcludeResponse;
	}

	/**
	 * 주가 정보(코스닥, 지수)
	 * @return
	 */
	public StockInfoKosResponse getStockInfoKosResponse() {
		return stockInfoKosResponse;
	}

	@XmlElement(name = "stockInfo")
	public void setStockInfoKosResponse(StockInfoKosResponse stockInfoKosResponse) {
		this.stockInfoKosResponse = stockInfoKosResponse;
	}
	
}

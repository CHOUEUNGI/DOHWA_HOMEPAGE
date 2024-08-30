package kr.co.dohwa.vo;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class CommonVO {
	@JsonIgnore
	private LocalDateTime regDt;
	@JsonIgnore
	private String regId;
	@JsonIgnore
	private LocalDateTime updDt;
	@JsonIgnore
	private String updId;
	@JsonIgnore
	public String getLoginId() {
		String regId = getRegId();
		if(regId == null) {
			return getUpdId();
		}
		return regId;
	}
	
	public void setLoginId(String loginId) {
		if(getRegId() == null)
			setRegId(loginId);
		if(getUpdId() == null)
			setUpdId(loginId);
	}
}

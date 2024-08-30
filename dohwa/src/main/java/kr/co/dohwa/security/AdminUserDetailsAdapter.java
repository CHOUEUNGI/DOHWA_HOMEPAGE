package kr.co.dohwa.security;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.dohwa.vo.AdminUserVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 유저 상세 어뎁터로 {@link UserDetails}를 구현.
 * 
 * @author PARK
 *
 */
@Slf4j
public class AdminUserDetailsAdapter implements UserDetails {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6753433184373060560L;
	/**
	 * 사용자 VO
	 */
	private AdminUserVO adminUser;
	
	/**
	 * 생성할때 사용자 VO를 받아서 설정한다.
	 * 
	 * @param adminUser 사용자VO
	 */
	public AdminUserDetailsAdapter(AdminUserVO adminUser) {
		this.adminUser = adminUser;
	}
	
	/**
	 * 사용자 VO를 입수한다.
	 * 
	 * @return user 사용자VO
	 */
	public AdminUserVO getAdminUser() {
		return adminUser;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return AuthorityUtils.createAuthorityList("ROLE_ADMIN");
	}

	@Override
	public String getPassword() {
		return getAdminUser().getPswd();
	}

	@Override
	public String getUsername() {
		return getAdminUser().getId();
	}

	/**
	 * 계정 만료일 체크
	 */
	@Override
	public boolean isAccountNonExpired() {
		return LocalDateTime.now().compareTo(getAdminUser().getExpireDt()) < 0;
	}

	/**
	 * 잠김 여부 체크
	 */
	@Override
	public boolean isAccountNonLocked() {
		// 임시번호로 로그인 했을때
		if(getAdminUser().getTempPswdYn().equals("Y") && getAdminUser().getUseYn().equals("Y") && getAdminUser().getLockYn().equals("N")) {
			return true;
		}
		
		// 비밀번호가 5번이상 틀렸거나, 잠김여부가 Y이면 계정잠김
		// 최종 로그인 날짜 3개월 여부 체크 추가
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		Date referenceDate = new Date();

		int currentMonth = Integer.parseInt(sdf.format(cal.getTime()));

		if(null == getAdminUser().getLoginDt()) {
			cal.setTime(referenceDate);
			cal.add(Calendar.MONTH, -3);
		}
		
		int loginMonth = Integer.parseInt(null != getAdminUser().getLoginDt() ? getAdminUser().getLoginDt().format(DateTimeFormatter.ofPattern("yyyyMM")) : sdf.format(cal.getTime()));

		return getAdminUser().getPswdFailCount() < 5 && "N".equals(getAdminUser().getLockYn()) && (currentMonth - loginMonth) < 3;
	}
	
	/**
	 * 로그인한지 3개월 여부 체크
	 */
	/*@Override
	public boolean isCredentialsNonExpired() {
		Date pwUDate = Date.from(getAdminUser().getPswdUpdDt().atZone(ZoneId.systemDefault()).toInstant());
		Calendar c = Calendar.getInstance();
		c.setTime(pwUDate);
		c.add(Calendar.MONTH, 3);
		Date currentDatePlusThree = c.getTime();

		return new Date().compareTo(currentDatePlusThree) < 0;
	}*/

	/**
	 * 사용 여부 체크
	 */
	@Override
	public boolean isEnabled() {
		return "Y".equals(getAdminUser().getUseYn());
	}
	
	/**
	 * 아이디 비교
	 */
	@Override
	public boolean equals(Object rhs) {
		if (rhs instanceof AdminUserDetailsAdapter) {
			return getAdminUser().getId().equals(((AdminUserDetailsAdapter) rhs).getAdminUser().getId());
		}
		return false;
	}

	@Override
	public int hashCode() {
		return getAdminUser().getId().hashCode();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

}

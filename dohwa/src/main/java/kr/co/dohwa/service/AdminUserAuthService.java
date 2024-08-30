package kr.co.dohwa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.dohwa.security.AdminUserDetailsAdapter;
import kr.co.dohwa.vo.AdminUserVO;

/**
 * 사용자 체크
 * @author PARK
 *
 */
public class AdminUserAuthService implements UserDetailsService {

	@Autowired
	private AdminUserService adminUserService;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		AdminUserVO adminUserVO = adminUserService.findById(id);
		
		if(null == adminUserVO) {
			throw new UsernameNotFoundException("사용자가 없습니다");
		}
		
		return new AdminUserDetailsAdapter(adminUserVO);
	}
	
}

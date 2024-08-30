package kr.co.dohwa.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.AdminUserLogVO;
import kr.co.dohwa.vo.AdminUserVO;

/**
 * 관리자 관련 Mapper
 * @author PARK
 *
 */
@Mapper
public interface AdminUserMapper {
	
	AdminUserVO findById(String username);

	int updateAdminUserInfo(AdminUserVO adminUserVO);
	
	int insertAdminUser(AdminUserVO adminUserVO);
	
	void insertAdminUserLog(AdminUserLogVO adminUserLogVO);
}
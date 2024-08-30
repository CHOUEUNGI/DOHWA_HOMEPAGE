package kr.co.dohwa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dohwa.mapper.AdminUserMapper;
import kr.co.dohwa.vo.AdminUserLogVO;
import kr.co.dohwa.vo.AdminUserVO;

/**
 * 관리자 유저 관련 서비스
 * @author PARK
 *
 */
@Service("adminUserService")
public class AdminUserService {
	
	@Autowired
	private AdminUserMapper adminUserMapper;
	
	/**
	 * 관리자 유저 단건 조회
	 * @return
	 */
	public AdminUserVO findById(String id) {
		AdminUserVO adminUserVO = adminUserMapper.findById(id);
		return adminUserVO;
	}
	
	/**
	 * 관리자 유저 정보 변경
	 * @param adminUserVO
	 */
	public void updateAdminUserinfo(AdminUserVO adminUserVO) {
		adminUserMapper.updateAdminUserInfo(adminUserVO);
	}
	
	/**
	 * 관리자 비밀번호 변경
	 * @param adminUserVO
	 * @return
	 */
	public int updateAdminUserChangePassword(AdminUserVO adminUserVO) {
		return adminUserMapper.updateAdminUserInfo(adminUserVO);
	}
	
	/**
	 * 관리자 비밀번호 입력 오류(실패 건수, 잠금)
	 * @param id
	 * @return
	 */
	public AdminUserVO increasePasswordErrorCountBy(String id) {
		AdminUserVO findAdminUserVO = adminUserMapper.findById(id);
		if(null != findAdminUserVO && 5 > findAdminUserVO.getPswdFailCount()) {
			AdminUserVO adminUserVO = new AdminUserVO();
			adminUserVO.setId(id);
			adminUserVO.setPswdFailCount(findAdminUserVO.getPswdFailCount() + 1);
			
			adminUserMapper.updateAdminUserInfo(adminUserVO);

			// 5번 틀렸을 경우 Lock 처리 한다.
			if(5 == findAdminUserVO.getPswdFailCount() + 1) {
				adminUserVO = new AdminUserVO();
				adminUserVO.setLockYn("Y");
				adminUserVO.setId(id);
				adminUserVO.setPswdFailCount(5);

				adminUserMapper.updateAdminUserInfo(adminUserVO);
			}
		}
		
		return adminUserMapper.findById(id);
	}

	/**
	 * 관리자 등록
	 * @param adminUserVO
	 * @return
	 */
	public int insertAdminUser(AdminUserVO adminUserVO) {
		return adminUserMapper.insertAdminUser(adminUserVO);
	}
	
	/**
	 * 관리자 접속 이력
	 * @param adminUserLogVO
	 */
	public void insertAdminUserLog(AdminUserLogVO adminUserLogVO) {
		adminUserMapper.insertAdminUserLog(adminUserLogVO);
	}
}

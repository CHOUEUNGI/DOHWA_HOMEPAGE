package kr.co.dohwa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.CustInqrVO;
import kr.co.dohwa.vo.LicenseVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 프론트 회사소개 관련 Mapper, 어드민 고객문의관리 관련 Mapper
 * @author PARK
 *
 */
@Mapper
public interface AboutUsMapper {

	List<LicenseVO> getLicenseList();
	
	/**
	 * 어드민 고객문의 리스트 조회
	 * @param searchVO
	 * @return
	 */
	List<CustInqrVO> getCustInqrList(SearchVO searchVO);

	/**
	 * 어드민 고객문의 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	int getCustInqrTotCnt(SearchVO searchVO);

	/**
	 * 프론트 고객문의 등록
	 * @param custInqrVO
	 * @return
	 */
	int insertCustInqr(CustInqrVO custInqrVO);

	/**
	 * 어드민 고객문의  수정
	 * @param custInqrVO
	 * @return
	 */
	int updateCustInqr(CustInqrVO custInqrVO);

	/**
	 * 어드민 고객문의  삭제
	 * @param custInqrVO
	 * @return
	 */
	int deleteCustInqr(CustInqrVO custInqrVO);


}
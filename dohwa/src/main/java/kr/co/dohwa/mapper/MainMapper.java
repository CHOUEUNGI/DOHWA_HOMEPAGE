package kr.co.dohwa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.MainBannerMlVO;
import kr.co.dohwa.vo.MainBannerVO;
import kr.co.dohwa.vo.MainPopupVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 메인 관련 Mapper
 *
 * @author PARK
 *
 */
@Mapper
public interface MainMapper {
	/**
	 * 메인 배너 리스트 조회(관리자용)
	 * @param searchVO
	 * @return
	 */
	List<MainBannerVO> getMainBannerAdminList(SearchVO searchVO);

	/**
	 * 메인 배너 리스트 조회(프로트 전용)
	 * @param searchVO
	 * @return
	 */
	List<Map<String, Object>> getFrontMainBannerList(SearchVO searchVO);

	/**
	 * 메인 배너 상세
	 * @param mainBannerVO
	 * @return
	 */
	MainBannerVO getMainBanner(MainBannerVO mainBannerVO);

	/**
	 * 메인 배너 다국어 리스트
	 * @param mainBannerMlVO
	 * @return
	 */
	List<MainBannerMlVO> getMainBannerMl(MainBannerMlVO mainBannerMlVO);

	/**
	 * 메인 배너 타입 조회
	 * @param mainBannerVO
	 * @return
	 */
	List<MainBannerVO> getMainBannerTypeList(MainBannerVO mainBannerVO);

	/**
	 * 메인 배너 오더 조회
	 * @param bannerType
	 * @return
	 */
	List<MainBannerVO> getMainBannerOrder();

	/**
	 * 메인 배너 등록
	 * @param mainBannerVO
	 * @return
	 */
	int insertMainBanner(MainBannerVO mainBannerVO);

	/**
	 * 메인 배너 다국어 등록
	 * @param map
	 * @return
	 */
	int insertMainBannerMl(Map<String, Object> map);

	/**
	 * 메인 배너 변경
	 * @param mainBannerVO
	 * @return
	 */
	int updateMainBanner(MainBannerVO mainBannerVO);

	/**
	 * 메인 배너 순서 변경
	 * @param list
	 * @return
	 */
	int updateMainBannerForeach(Map<String, Object> map);

	/**
	 * 메인 배너 삭제
	 * @param seqs
	 * @return
	 */
	int deleteMainBannerForeach(List<Integer> seqs);

	/**
	 * 메인 배너 다국어 삭제
	 * @param seqs
	 * @return
	 */
	int deleteMainBannerMlForeach(List<Integer> seqs);

	/**
	 * 메인 팝업 카운트
	 * @param searchVO
	 * @return
	 */
	int getMainPopupCount(SearchVO searchVO);

	/**
	 * 메인 팝업 리스트
	 * @param searchVO
	 * @return
	 */
	List<MainPopupVO> getMainPopupList(SearchVO searchVO);

	/**
	 * 메인 팝업 리스트 (프론트전용)
	 * @param searchVO
	 * @return
	 */
	List<MainPopupVO> getFrontMainPopupList(SearchVO searchVO);

	/**
	 * 메인 팝업 상세
	 * @param mainPopupVO
	 * @return
	 */
	MainPopupVO getMainPopup(MainPopupVO mainPopupVO);

	/**
	 * 메인 팝업 등록
	 * @param mainPopupVO
	 * @return
	 */
	int insertMainPopup(MainPopupVO mainPopupVO);

	/**
	 * 메인 팝업 변경
	 * @param mainPopupVO
	 * @return
	 */
	int updateMainPopup(MainPopupVO mainPopupVO);

	/**
	 * 메인 팝업 삭제
	 * @param seqs
	 * @return
	 */
	int deleteMainPopupForeach(List<Integer> seqs);
}
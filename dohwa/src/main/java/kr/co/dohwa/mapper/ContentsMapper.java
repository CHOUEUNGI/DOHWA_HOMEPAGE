package kr.co.dohwa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.BoardVO;
import kr.co.dohwa.vo.LicenseVO;
import kr.co.dohwa.vo.PeopleVO;
import kr.co.dohwa.vo.SearchVO;
import kr.co.dohwa.vo.PressVO;
import kr.co.dohwa.vo.DonateVO;

/**
 * 컨텐츠 관리 Mapper
 * @author KYoung
 */
@Mapper
public interface ContentsMapper {
	
	/**
	 * 컨텐츠 관리 > People 관리 > 목록
	 * @return
	 */
	List<PeopleVO> getPeopleList(PeopleVO peopleVO);
	
	/**
	 * 컨텐츠 관리 > People 관리 > 등록
	 * @param peopleVO
	 */
	int insertPeople(PeopleVO peopleVO);
	
	/**
	 * 컨텐츠 관리 > People 관리 > 다국어 등록
	 * @param peopleVO
	 */
	int insertPeopleMl(PeopleVO peopleVO);
	
	/**
	 * 컨텐츠 관리 > People 관리 > 수정
	 * @param peopleVO
	 */
	int updatePeople(PeopleVO peopleVO);
	
	/**
	 * 컨텐츠 관리 > People 관리 > 다국어 수정
	 * @param peopleVO
	 * @return
	 */
	int updatePeopleMl(PeopleVO peopleVO);
	
	/**
	 * 컨텐츠 관리 > People 관리 > 전체 삭제
	 */
	int deleteAllPeople();
	
	/**
	 * 컨텐츠 관리 > People 관리 > 삭제
	 * @param List<Integer> seqs
	 */
	int deletePeople(List<Integer> seqs);
	
	/**
	 * 컨텐츠 관리 > People 관리 > Order 수정 
	 */
	int updateOrderPeople();

	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	int getLicenseCount(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	List<LicenseVO> getLicenseList(SearchVO searchVO);
	List<LicenseVO> getLicenseListFront(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 상세
	 * @param seq
	 * @return
	 */
	LicenseVO getLicense(int seq);
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 등록
	 * @param licenseVO
	 */
	int insertLicense(LicenseVO licenseVO);
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 수정
	 * @param licenseVO
	 */
	int updateLicense(LicenseVO licenseVO);
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 삭제
	 * @param seqs
	 * @return
	 */
	int deleteLicense(List<Integer> seqs);
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	int getBoardCount(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	List<BoardVO> getBoardList(SearchVO searchVO);

	/**
	 * 컨텐츠 관리 > 면허 관리 > 상세
	 * @param seq
	 * @return
	 */
	BoardVO getBoard(int seq);
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 등록
	 * @param boardVO
	 * @return
	 */
	int insertBoard(BoardVO boardVO);

	/**
	 * 컨텐츠 관리 > 게시판 관리 > 수정
	 * @param boardVO
	 * @return
	 */
	int updateBoard(BoardVO boardVO);

	/**
	 * 컨텐츠 관리 > 게시판 관리 > 삭제
	 * @param seqs
	 */
	int deleteBoard(List<Integer> seqs);
	
	/**
	 * 홈페이지 최신뉴스 상세
	 * @param seq
	 * @return
	 */
	BoardVO getBoardBy(BoardVO boardVO);
	
	/**
	 * 홈페이지 최신뉴스 이전, 이후
	 * @param searchVO
	 * @return
	 */
	List<BoardVO> getBoardByPrevNext(SearchVO searchVO);

	/**
	 * 프론트 메인 뉴스 목록
	 * @param searchVO
	 * @return
	 */
	List<BoardVO> getFrontMainNewsList(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	int getPressCount(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	List<PressVO> getPressList(SearchVO searchVO);
	List<PressVO> getPressListFront(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 상세
	 * @param seq
	 * @return
	 */
	PressVO getPress(int seq);
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 등록
	 * @param pressVO
	 * @return
	 */
	int insertPress(PressVO pressVO);

	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 수정
	 * @param pressVO
	 * @return
	 */
	int updatePress(PressVO pressVO);

	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 삭제
	 * @param seqs
	 */
	int deletePress(List<Integer> seqs);
	
	/**
	 * 홈페이지 보도자료 상세
	 * @param seq
	 * @return
	 */
	PressVO getPressBy(PressVO pressVO);
	
	/**
	 * 홈페이지 보도자료 이전, 이후
	 * @param searchVO
	 * @return
	 */
	List<PressVO> getPressByPrevNext(SearchVO searchVO);


	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	int getDonateCount(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	List<DonateVO> getDonateList(SearchVO searchVO);
	List<DonateVO> getDonateListFront(SearchVO searchVO);
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 상세
	 * @param seq
	 * @return
	 */
	DonateVO getDonate(int seq);
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 등록
	 * @param donateVO
	 * @return
	 */
	int insertDonate(DonateVO donateVO);
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 수정
	 * @param donateVO
	 * @return
	 */
	int updateDonate(DonateVO donateVO);

	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 삭제
	 * @param seqs
	 */
	int deleteDonate(List<Integer> seqs);
	
	/**
	 * 홈페이지 CSR(사회공헌) 상세
	 * @param seq
	 * @return
	 */
	DonateVO getDonateBy(DonateVO donateVO);
	
	/**
	 * 홈페이지 CSR(사회공헌) 이전, 이후
	 * @param searchVO
	 * @return
	 */
	List<DonateVO> getDonateByPrevNext(SearchVO searchVO);
	
}
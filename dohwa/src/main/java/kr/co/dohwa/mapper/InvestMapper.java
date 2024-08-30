package kr.co.dohwa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.FinanceVO;
import kr.co.dohwa.vo.InvRefVO;
import kr.co.dohwa.vo.SearchVO;
import kr.co.dohwa.vo.StockMeetVO;
import kr.co.dohwa.vo.StockOwnerVO;
import kr.co.dohwa.vo.StockVO;

/**
 * 투자정보 관련 Mapper
 * @author PARK
 *
 */
@Mapper
public interface InvestMapper {

	/**
	 * 재무정보 주요경영실적 리스트 조회
	 * @param searchVO
	 * @return
	 */
	List<FinanceVO> getFinanceMainList(SearchVO searchVO);

	/**
	 * 재무정보 주요경영실적 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	int getFinanceMainTotCnt(SearchVO searchVO);

	/**
	 * 재무정보 주요경영실적 등록
	 * @param financeVO
	 * @return
	 */
	int insertFinanceMain(FinanceVO financeVO);

	/**
	 * 재무정보 주요경영실적  수정
	 * @param financeVO
	 * @return
	 */
	int updateFinanceMain(FinanceVO financeVO);

	/**
	 * 재무정보 주요경영실적  삭제
	 * @param financeVO
	 * @return
	 */
	int deleteFinanceMain(FinanceVO financeVO);

	/**
	 * 재무정보 요약재무재표 리스트 조회
	 * @param searchVO
	 * @return
	 */
	List<FinanceVO> getFinanceSummaryList(SearchVO searchVO);

	/**
	 * 재무정보 요약재무재표 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	int getFinanceSummaryTotCnt(SearchVO searchVO);

	/**
	 * 재무정보 요약재무재표 등록
	 * @param financeVO
	 * @return
	 */
	int insertFinanceSummary(FinanceVO financeVO);

	/**
	 * 재무정보 요약재무재표  수정
	 * @param financeVO
	 * @return
	 */
	int updateFinanceSummary(FinanceVO financeVO);

	/**
	 * 재무정보 요약재무재표  삭제
	 * @param financeVO
	 * @return
	 */
	int deleteFinanceSummary(FinanceVO financeVO);

	/**
	 * 재무정보 자료실 리스트 조회
	 * @param searchVO
	 * @return
	 */
	List<InvRefVO> getInvestReferList(SearchVO searchVO);

	/**
	 * 재무정보 자료실 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	int getInvestReferTotCnt(SearchVO searchVO);

	/**
	 * 재무정보 자료실 등록
	 * @param invRefVO
	 * @return
	 */
	int insertInvestRefer(InvRefVO invRefVO);

	/**
	 * 재무정보 자료실  수정
	 * @param invRefVO
	 * @return
	 */
	int updateInvestRefer(InvRefVO invRefVO);

	/**
	 * 재무정보 자료실  삭제
	 * @param invRefVO
	 * @return
	 */
	int deleteInvestRefer(InvRefVO invRefVO);

	/**
	 * 재무정보 자료실  파일 삭제
	 * @param financeVO
	 * @return
	 */
	int deleteInvestReferFile(InvRefVO invRefVO);

	/**
	 * 주식 및 주주정보 마스터 리스트 조회
	 * @param searchVO
	 * @return
	 */
	List<StockVO> getStockMastList(SearchVO searchVO);

	/**
	 * 주식 및 주주정보 마스터 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	int getStockMastTotCnt(SearchVO searchVO);

	/**
	 * 주식 및 주주정보 주주현황 리스트 조회
	 * @param stockOwnerVO
	 * @return
	 */
	List<StockOwnerVO> getStockOwnerList(StockOwnerVO stockOwnerVO);

	/**
	 * 주식 및 주주정보 주주총회안건 리스트 조회
	 * @param stockMeetVO
	 * @return
	 */
	List<StockMeetVO> getStockMeetList(StockMeetVO stockMeetVO);

	/**
	 * 주식 및 주주정보 마스터 등록
	 * @param stockVO
	 * @return
	 */
	int insertStockMast(StockVO stockVO);

	/**
	 * 주식 및 주주정보 마스터  수정
	 * @param stockVO
	 * @return
	 */
	int updateStockMast(StockVO stockVO);

	/**
	 * 주식 및 주주정보 마스터  삭제
	 * @param stockVO
	 * @return
	 */
	int deleteStockMast(StockVO stockVO);

	/**
	 * 주식 및 주주정보 주식소유현황 등록
	 * @param stockOwnerVO
	 * @return
	 */
	int insertStockOwner(StockOwnerVO stockOwnerVO);

	/**
	 * 주식 및 주주정보 주식소유현황  수정
	 * @param stockOwnerVO
	 * @return
	 */
	int updateStockOwner(StockOwnerVO stockOwnerVO);

	/**
	 * 주식 및 주주정보 주식소유현황  삭제
	 * @param stockOwnerVO
	 * @return
	 */
	int deleteStockOwner(StockOwnerVO stockOwnerVO);

	/**
	 * 주식 및 주주정보 주주총회정보 등록
	 * @param stockMeetVO
	 * @return
	 */
	int insertStockMeet(StockMeetVO stockMeetVO);

	/**
	 * 주식 및 주주정보 주주총회정보  수정
	 * @param stockMeetVO
	 * @return
	 */
	int updateStockMeet(StockMeetVO stockMeetVO);

	/**
	 * 주식 및 주주정보 주주총회정보  삭제
	 * @param stockMeetVO
	 * @return
	 */
	int deleteStockMeet(StockMeetVO stockMeetVO);

}
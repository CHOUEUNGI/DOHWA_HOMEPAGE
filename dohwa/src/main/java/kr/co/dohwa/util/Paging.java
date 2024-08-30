package kr.co.dohwa.util;

import lombok.Data;

@Data
public class Paging {
	private int pageSize;    // 한 페이지에 보일 게시글 수
	private int firstPageNo; // 첫 번째 페이지 번호
	private int prevPageNo;  // 이전 페이지 번호
	private int startPageNo; // 시작 페이지 (페이징 네비 기준)
	private int pageNo;      // 페이지 번호
	private int endPageNo;   // 끝 페이지 (페이징 네비 기준)
	private int nextPageNo;  // 다음 페이지 번호
	private int finalPageNo; // 마지막 페이지 번호
	private int totalCount;  // 게시글 전체 수
	private int blockSize;   // 페이지 번호 링크 개수
	private int startRowNum; // 게시글 조회 쿼리에 들어갈 row 시작점
	private int endRowNum;   // 게시글 조회 쿼리에 들어갈 row 끝점

	public Paging() {}

	public Paging(int blockSize) {
		this.blockSize = blockSize;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.makePaging();
	}
	
	private void makePaging() {
		// 게시글 전체 수가 없는 경우
		if (0 == getTotalCount()) {
			return;
		}
		
		// 기본 값 설정
		if (0 == getPageSize()) {
			setPageSize(10);
		}
		
		// 기본 값 설정
		if (0 == getPageNo()) {
			setPageNo(1);
		}
		
		// 기본 값 설정
		if (0 == getBlockSize()) {
			setBlockSize(10);
		}
		
		// 마지막 페이지
		int finalPage = (getTotalCount() + (getPageSize() - 1)) / getPageSize();
		
		// 기본 값 설정
		if (getPageNo() > finalPage) {
			setPageNo(finalPage);
		}
		
		// 현재 페이지 유효성 체크
		if (0 > getPageNo() || getPageNo() > finalPage) {
			setPageNo(1);
		}
		
		setEndRowNum(getPageNo() * getPageSize());
		setStartRowNum(getEndRowNum() - (getPageSize() - 1));
		
		// 시작 페이지 (전체)
		boolean isNowFirst = getPageNo() == 1 ? true : false;
		// 마지막 페이지 (전체)
		boolean isNowFinal = getPageNo() == finalPage ? true : false;

		// 시작 페이지 (페이징 네비 기준)
		int startPage = ((getPageNo() - 1) / getBlockSize()) * getBlockSize() + 1;
		// 끝 페이지 (페이징 네비 기준)
		int endPage = startPage + getBlockSize() - 1;

		// [마지막 페이지 (페이징 네비 기준) > 마지막 페이지]보다 큰 경우
		if (endPage > finalPage) { 
			endPage = finalPage;
		}

		setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
		setEndPageNo(endPage); // 끝 페이지 (페이징 네비 기준)
		
		// 전체 데이터 개수가 페이지 번호 링크 개수 보다 작으면 처음, 이전, 다음, 마지막 버튼 비노출
		if(getBlockSize() < finalPage) {
			setFirstPageNo(1); // 첫 번째 페이지 번호
			
			if (isNowFirst) {
				setPrevPageNo(1); // 이전 페이지 번호
			} else {
				setPrevPageNo(((getPageNo() - blockSize) < 1 ? 1 : (getStartPageNo() - blockSize))); // 이전 페이지 번호
			}
	
			if (isNowFinal) {
				setNextPageNo(finalPage); // 다음 페이지 번호
			} else {
				setNextPageNo(((getStartPageNo() + blockSize) > finalPage ? finalPage : (getStartPageNo() + blockSize))); // 다음 페이지 번호
			}
	
			setFinalPageNo(finalPage); // 마지막 페이지 번호
			
		} else if(getBlockSize() >= finalPage) {
			setNextPageNo(finalPage);
			setFinalPageNo(finalPage); // 마지막 페이지 번호
		}
	}

}

package kr.co.dohwa.service;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import com.google.common.collect.Maps;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.mapper.InvestMapper;
import kr.co.dohwa.payload.KRXResponse;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.FinanceVO;
import kr.co.dohwa.vo.InvRefVO;
import kr.co.dohwa.vo.SearchVO;
import kr.co.dohwa.vo.StockMeetVO;
import kr.co.dohwa.vo.StockOwnerVO;
import kr.co.dohwa.vo.StockVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 투자정보 관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("investService")
public class InvestService {

	@Autowired
	private InvestMapper investMapper;

	@Autowired
	private FileUploader fileUploader;

	@Autowired
	private FileMapper fileMapper;

	@Value("#{config['krx.url']}")
	private String KRX_URL;


	/**
	 * 재무정보 관리 Summary 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<FinanceVO> getFinanceMainList(SearchVO searchVO) {
		return investMapper.getFinanceMainList(searchVO);
	}

	/**
	 * 재무정보 관리 주요경영실적 리스트 전체 건수 조회
	 * @param searchVO
	 * @return
	 */
	public int getFinanceMainTotCnt(SearchVO searchVO) {
		return investMapper.getFinanceMainTotCnt(searchVO);
	}


	/**
	 * 재무정보 관리 주요경영실적 등록
	 * @param financeVO
	 * @return
	 */
	public int insertFinanceMain(FinanceVO financeVO) {
		return investMapper.insertFinanceMain(financeVO);
	}
	/**
	 * 재무정보 관리 주요경영실적 수정
	 * @param financeVO
	 * @return
	 */
	public int updateFinanceMain(FinanceVO financeVO) {
		return investMapper.updateFinanceMain(financeVO);
	}
	/**
	 * 재무정보 관리 주요경영실적 삭제
	 * @param arrYyyy	년도 배열
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteFinanceMain(String[] arrYyyy) {
		FinanceVO financeVO = null;
		for(String yyyy : arrYyyy) {
			financeVO = new FinanceVO();
			financeVO.setYyyy(yyyy);
			investMapper.deleteFinanceMain(financeVO);
		}
	}

	/**
	 * 재무정보 관리 요약재무재표 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<FinanceVO> getFinanceSummaryList(SearchVO searchVO) {
		return investMapper.getFinanceSummaryList(searchVO);
	}

	/**
	 * 재무정보 관리 요약재무재표 리스트 전체 건수 조회
	 * @param searchVO
	 * @return
	 */
	public int getFinanceSummaryTotCnt(SearchVO searchVO) {
		return investMapper.getFinanceSummaryTotCnt(searchVO);
	}


	/**
	 * 재무정보 관리 요약재무재표 등록
	 * @param financeVO
	 * @return
	 */
	public int insertFinanceSummary(FinanceVO financeVO) {
		return investMapper.insertFinanceSummary(financeVO);
	}
	/**
	 * 재무정보 관리 요약재무재표 수정
	 * @param financeVO
	 * @return
	 */
	public int updateFinanceSummary(FinanceVO financeVO) {
		return investMapper.updateFinanceSummary(financeVO);
	}
	/**
	 * 재무정보 관리 요약재무재표 삭제
	 * @param arrYyyy	년도 배열
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteFinanceSummary(String[] arrYyyy) {
		FinanceVO financeVO = null;
		for(String yyyy : arrYyyy) {
			financeVO = new FinanceVO();
			financeVO.setYyyy(yyyy);
			investMapper.deleteFinanceSummary(financeVO);
		}
	}

	/**
	 * 재무정보 자료실 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<InvRefVO> getInvestReferList(SearchVO searchVO) {
		return investMapper.getInvestReferList(searchVO);
	}

	/**
	 * 재무정보 자료실 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	public int getInvestReferTotCnt(SearchVO searchVO) {
		return investMapper.getInvestReferTotCnt(searchVO);
	}

	/**
	 * 재무정보 자료실 등록
	 * @param financeVO
	 * @return
	 */
	public int insertInvestRefer(HttpServletRequest request, InvRefVO invRefVO) {

		investMapper.insertInvestRefer(invRefVO);

		List<FileVO> files = fileUploader.storeFilesRequest(request, invRefVO.getSeq(), invRefVO.getTypeCode());

		// 파일 등록
		if(0 < files.size()) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		return 1;
	}

	/**
	 * 재무정보 자료실  수정
	 * @param financeVO
	 * @return
	 */
	public int updateInvestRefer(HttpServletRequest request, InvRefVO invRefVO) {

		investMapper.updateInvestRefer(invRefVO);

		List<FileVO> files = fileUploader.storeFilesRequest(request, invRefVO.getSeq(), invRefVO.getTypeCode());

		// 파일 등록
		if(0 < files.size()) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		return 1;
	}

	/**
	 * 재무정보 자료실  삭제
	 * @param financeVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteInvestRefer(String[] arrSeq, String typeCode) {
		InvRefVO invRefVO = null;
		for(String seq : arrSeq) {
			invRefVO = new InvRefVO();
			invRefVO.setSeq(Integer.parseInt(seq));
			invRefVO.setTypeCode(typeCode);
			investMapper.deleteInvestRefer(invRefVO);
			investMapper.deleteInvestReferFile(invRefVO);
		}
	}

	/**
	 *  주식 및 주주정보 리스트 조회
	 * @param searchVO
	 * @param inquiryType	조회 타입. adminList, adminDetail, front
	 * @return
	 */
	public List<StockVO> getStockMastList(SearchVO searchVO, String inquiryType) {
		List<StockVO> list = investMapper.getStockMastList(searchVO);

		// 어드민상세와 프로튼 하위 정보도 셋팅한다.
		if("adminDetail".equals(inquiryType) || "front".equals(inquiryType)) {

			if(list != null && !list.isEmpty()) {
				for(StockVO detailVO : list) {

					if("STOCK_SHCP".equals(detailVO.getTypeCode())) {	//주주구성
						StockOwnerVO paramVO = new StockOwnerVO();
						paramVO.setStockMastSeq(detailVO.getSeq());
						log.info("detailVO.getSeq() " + detailVO.getSeq());
						detailVO.setStockOwnerList(investMapper.getStockOwnerList(paramVO));
					} else if("STOCK_SHMT".equals(detailVO.getTypeCode())) {	//주주총회
						StockMeetVO paramVO = new StockMeetVO();
						paramVO.setStockMastSeq(detailVO.getSeq());
						detailVO.setStockMeetList(investMapper.getStockMeetList(paramVO));
					}

					if("adminDetail".equals(inquiryType)) {	// 어드민 상세는 첫번째만 셋팅하고 끝.
						break;
					}

				}
			}
		}


		// 프론트에서 오류 안 나게 널처리함.
		if(list == null){
			list = new ArrayList<StockVO>();
		}

		return list;

	}

	/**
	 * 주식 및 주주정보 리스트 전체 건수 조회
	 * @param searchVO
	 * @return
	 */
	public int getStockMastTotCnt(SearchVO searchVO) {
		return investMapper.getStockMastTotCnt(searchVO);
	}

	/**
	 * 주식 및 주주정보 등록
	 * @param stockVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void insertStock(HttpServletRequest request, StockVO stockVO) {

		// 마스터 테이블 저장
		investMapper.insertStockMast(stockVO);

		if(stockVO.getSeq() > 0){
			// 주주구성 -> 주식소유현황 저장
			if("STOCK_SHCP".equals(stockVO.getTypeCode())) {
				if(stockVO.getStockOwnerList() != null && !stockVO.getStockOwnerList().isEmpty()){
					int dispOrd = 0;
					for(StockOwnerVO stockOwnerVO : stockVO.getStockOwnerList()) {
						// 모든 값이 입력되었을 때만 저장하자.
						if(!StringUtils.isEmpty(stockOwnerVO.getName()) && !StringUtils.isEmpty(stockOwnerVO.getShowCnt()) && !StringUtils.isEmpty(stockOwnerVO.getShowRatio())) {
							stockOwnerVO.setStockMastSeq(stockVO.getSeq());
							stockOwnerVO.setLoginId(stockVO.getLoginId());
							stockOwnerVO.setDispOrd(dispOrd+"");
							investMapper.insertStockOwner(stockOwnerVO);
						}
						dispOrd++;
					}
				}
			}

			// 주주총회 -> 주주총회의안정보 저장, 첨부파일 저장
			else if("STOCK_SHMT".equals(stockVO.getTypeCode())) {
				if(stockVO.getStockMeetList() != null && !stockVO.getStockMeetList().isEmpty()){
					int dispOrd = 0;
					for(StockMeetVO stockMeetVO : stockVO.getStockMeetList()) {
						if(!StringUtils.isEmpty(stockMeetVO.getRslt()) && !StringUtils.isEmpty(stockMeetVO.getAgnd())) {
							stockMeetVO.setStockMastSeq(stockVO.getSeq());
							stockMeetVO.setLoginId(stockVO.getLoginId());
							stockMeetVO.setDispOrd(dispOrd+"");
							investMapper.insertStockMeet(stockMeetVO);
						}
						dispOrd++;
					}
				}

				//첨부파일 저장
				List<FileVO> files = fileUploader.storeFilesRequest(request, stockVO.getSeq(), stockVO.getTypeCode());
				// 파일 등록
				if(0 < files.size()) {
					Map<String, Object> map = Maps.newHashMap();
					map.put("list", files);
					fileMapper.insertForeach(map);
				}

			}
		}
	}

	/**
	 * 주식 및 주주정보 수정
	 * @param stockVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void updateStock(HttpServletRequest request, StockVO stockVO) {

		// 마스터 테이블 저장
		int updCnt = investMapper.updateStockMast(stockVO);

		if(updCnt > 0){
			// 주주구성 -> 주식소유현황 저장
			if("STOCK_SHCP".equals(stockVO.getTypeCode())) {
				// 주식소유현황 삭제
				StockOwnerVO delStockOwnerVO = new StockOwnerVO();
				delStockOwnerVO.setStockMastSeq(stockVO.getSeq());
				investMapper.deleteStockOwner(delStockOwnerVO);

				// 주식소유현황 인서트
				int dispOrd = 0;
				for(StockOwnerVO stockOwnerVO : stockVO.getStockOwnerList()) {
					// 모든 값이 입력되었을 때만 저장하자.
					if(!StringUtils.isEmpty(stockOwnerVO.getName()) && !StringUtils.isEmpty(stockOwnerVO.getShowCnt()) && !StringUtils.isEmpty(stockOwnerVO.getShowRatio())) {
						stockOwnerVO.setStockMastSeq(stockVO.getSeq());
						stockOwnerVO.setLoginId(stockVO.getLoginId());
						stockOwnerVO.setDispOrd(dispOrd+"");
						investMapper.insertStockOwner(stockOwnerVO);
					}
					dispOrd++;
				}
			}

			// 주주총회 -> 주주총회의안정보 저장, 첨부파일 저장
			else if("STOCK_SHMT".equals(stockVO.getTypeCode())) {
				// 주주총회의안정보 삭제
				StockMeetVO delStockMeetVO = new StockMeetVO();
				delStockMeetVO.setStockMastSeq(stockVO.getSeq());
				investMapper.deleteStockMeet(delStockMeetVO);

				// 주주총회의안정보 인서트
				int dispOrd = 0;
				for(StockMeetVO stockMeetVO : stockVO.getStockMeetList()) {
					if(!StringUtils.isEmpty(stockMeetVO.getRslt()) && !StringUtils.isEmpty(stockMeetVO.getAgnd())) {
						stockMeetVO.setStockMastSeq(stockVO.getSeq());
						stockMeetVO.setLoginId(stockVO.getLoginId());
						stockMeetVO.setDispOrd(dispOrd+"");
						investMapper.insertStockMeet(stockMeetVO);
					}
					dispOrd++;
				}

				//첨부파일 저장
				List<FileVO> files = fileUploader.storeFilesRequest(request, stockVO.getSeq(), stockVO.getTypeCode());
				// 파일 등록
				if(0 < files.size()) {
					Map<String, Object> map = Maps.newHashMap();
					map.put("list", files);
					fileMapper.insertForeach(map);
				}
			}
		}
	}

	/**
	 * 주식 및 주주정보 삭제
	 * @param stockVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteStock(HttpServletRequest request, String[] arrSeq, String typeCode) {

		StockVO stockVO = null;
		StockOwnerVO stockOwnerVO = null;
		StockMeetVO stockMeetVO = null;
		for(String seq : arrSeq) {
			stockVO = new StockVO();
			stockVO.setSeq(Integer.parseInt(seq));
			stockVO.setTypeCode(typeCode);
			investMapper.deleteStockMast(stockVO);	// 마스터 삭제

			if("STOCK_SHCP".equals(stockVO.getTypeCode())) {	// 주주구성 -> 주식소유현황 삭제
				stockOwnerVO = new StockOwnerVO();
				stockOwnerVO.setStockMastSeq(stockVO.getSeq());
				investMapper.deleteStockOwner(stockOwnerVO);

			} else if("STOCK_SHMT".equals(stockVO.getTypeCode())) {	// 주주총회 -> 주주총회의안정보 삭제
				stockMeetVO = new StockMeetVO();
				stockMeetVO.setStockMastSeq(stockVO.getSeq());
				investMapper.deleteStockMeet(stockMeetVO);

			}
		}
	}

	/**
	 * 주가정보 연동
	 * @return
	 */
	public KRXResponse getKRXData() {
		KRXResponse krxResponse = null;

		try {

			RestTemplate restTemplate = new RestTemplate();
			String response = restTemplate.getForObject(KRX_URL, String.class).replaceAll("\n|\r", "");

			if(!StringUtils.isEmpty(response)) {
				JAXBContext jaxbContext = JAXBContext.newInstance(KRXResponse.class);
				Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

				krxResponse = (KRXResponse) jaxbUnmarshaller.unmarshal(new StringReader(response));

				return krxResponse;
			}

		} catch (Exception e) {
			log.error("주식 정보 조회중 에러 발생 했습니다.", e);
		}

		return krxResponse;
	}

}

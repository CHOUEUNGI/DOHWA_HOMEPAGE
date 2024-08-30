package kr.co.dohwa.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.mapper.ContentsMapper;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.vo.BoardVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.LicenseVO;
import kr.co.dohwa.vo.PeopleVO;
import kr.co.dohwa.vo.PressVO;
import kr.co.dohwa.vo.ProjectMlVO;
import kr.co.dohwa.vo.ProjectVO;
import kr.co.dohwa.vo.DonateVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 컨텐츠 관리 Service
 * @author KYoung
 */
@Service("contentsService")
public class ContentsService {

	@Autowired
	private FileUploader fileUploader;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private ContentsMapper contentsMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	
	/**
	 * 컨텐츠 관리 > People 관리 > 목록 
	 * @return
	 */
	public List<PeopleVO> getPeopleList(PeopleVO peopleVO) {
		// People 관리 목록
		return contentsMapper.getPeopleList(peopleVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > People 관리 > 등록
	 * @param request
	 * @param peopleVO
	 * @throws IOException 
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insertPeople(PeopleVO peopleVO) throws IOException {
		
		// 등록 아이디
		peopleVO.getPeoples().forEach(p -> p.setRegId(SecurityContextHolder.getContext().getAuthentication().getName()));
		
		// People 관리 삭제
		contentsMapper.deleteAllPeople();

		// 파일 정보 삭제
		FileVO deleteFileVO = new FileVO();
		deleteFileVO.setAttType("PEOPLE");
		
		List<FileVO> deleteFileList = fileMapper.getFileList(deleteFileVO);
		deleteFileList.forEach(fileService::deleteFile);
		
		for (PeopleVO pv : peopleVO.getPeoples()) {
			
			// People 관리 등록
			contentsMapper.insertPeople(pv);
			
			// People 관리 다국어 등록
			contentsMapper.insertPeopleMl(pv);
			
			// 물리 File 저장
			Optional<FileVO> fileVO = fileUploader.storeFileToMultipartFile(pv.getMultipartFileVO().getFile(), pv.getSeq(), "PEOPLE");
			
			if(fileVO.isPresent()) {
				// 파일 정보 등록
				fileMapper.insert(fileVO.get());
			}
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > People 관리 > 수정
	 * @param request
	 * @param peopleVO
	 * @throws IOException 
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updatePeople(PeopleVO peopleVO) throws IOException {
		
		// 수정 아이디
		peopleVO.getPeoples().forEach(p -> p.setRegId(SecurityContextHolder.getContext().getAuthentication().getName()));
		
		// People 관리 삭제
		if (Optional.ofNullable(peopleVO.getSeqs()).isPresent()) {
			
			// People 삭제
			contentsMapper.deletePeople(peopleVO.getSeqs());
		
			// 파일 삭제
			Map<String, Object> paramMap = Maps.newHashMap();
			
			paramMap.put("seqs", peopleVO.getSeqs());
			paramMap.put("attType", "PEOPLE");
			
			// 선택된 row의 파일 목록 조회
			List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
			
			// 물리 File 삭제
			fileList.forEach(fileService::deleteFile);
		}
		
		for (PeopleVO pv : peopleVO.getPeoples()) {
			
			if(pv.getPeopleMlVO() != null) {
			
				if (pv.getFileVO() != null) {
					
					// People 관리 수정
					if ("KO".equals(peopleVO.getLang())) {
						contentsMapper.updatePeople(pv);
					}
					
					// People 관리 다국어 수정
					pv.setLang(peopleVO.getLang());
					contentsMapper.updatePeopleMl(pv);
					
				} else {
					
					// People 관리 등록
					contentsMapper.insertPeople(pv);
					
					// People 관리 다국어 등록
					contentsMapper.insertPeopleMl(pv);
					
					// 물리 File 저장
					Optional<FileVO> fileVO = fileUploader.storeFileToMultipartFile(pv.getMultipartFileVO().getFile(), pv.getSeq(), "PEOPLE");
					
					if(fileVO.isPresent()) {
						// 파일 정보 등록
						fileMapper.insert(fileVO.get());
					}
				}
			}
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > People 관리 > 삭제
	 * @param peoples
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deletePeople(List<Integer> seqs) {
		
		Map<String, Object> paramMap = Maps.newHashMap();
		
		paramMap.put("seqs", seqs);
		paramMap.put("attType", "PEOPLE");
		
		// 선택된 row의 파일 목록 조회
		List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
		
		// 물리 File 삭제
		fileList.forEach(fileService::deleteFile);
		
		// People 관리 삭제
		contentsMapper.deletePeople(seqs);
		
		// 순서 자동 변경
		contentsMapper.updateOrderPeople();
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	public int getLicenseCount(SearchVO searchVO) {
		return contentsMapper.getLicenseCount(searchVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	public List<LicenseVO> getLicenseList(SearchVO searchVO) {
		// 면허 관리 목록
		return contentsMapper.getLicenseList(searchVO);
	}

	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 목록 (front no paging)
	 * @param searchVO
	 * @return
	 */
	public List<LicenseVO> getLicenseListFront(SearchVO searchVO) {
		// 면허 관리 목록
		return contentsMapper.getLicenseListFront(searchVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 상세
	 * @param string
	 * @return
	 */
	public LicenseVO getLicense(int seq) {
		
		// 면허 상세
		LicenseVO licenseVO = contentsMapper.getLicense(seq);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(seq);
		fileVO.setAttType("LICENSE");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		List<FileVO> reFileList = Lists.newArrayList();
		
		for (FileVO file : fileList) {
			if(file.getType().equals("PCEN") && 2 == file.getAttOrder()) {
				licenseVO.setPcFileEn(file.getOrgName());
				licenseVO.setPcFileEnId(file.getId());
			} else if(file.getType().equals("MOEN") && 2 == file.getAttOrder()) {
				licenseVO.setMoFileEn(file.getOrgName());
				licenseVO.setMoFileEnId(file.getId());
			} else if(file.getType().equals("PCES") && 3 == file.getAttOrder()) {
				licenseVO.setPcFileEs(file.getOrgName());
				licenseVO.setPcFileEsId(file.getId());
			}else if(file.getType().equals("MOES") && 3 == file.getAttOrder()) {
				licenseVO.setMoFileEs(file.getOrgName());
	
				licenseVO.setMoFileEsId(file.getId());
			}else {
				reFileList.add(file);
			}
		}
		
		licenseVO.setFiles(reFileList);
		
		return licenseVO;
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 등록
	 * @param request
	 * @param licenseVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insertLicense(HttpServletRequest request, LicenseVO licenseVO) {

		// 면허 등록
		contentsMapper.insertLicense(licenseVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, licenseVO.getSeq(), "LICENSE");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 수정
	 * @param request
	 * @param licenseVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updateLicense(HttpServletRequest request, LicenseVO licenseVO) {
		
		// 면허 수정
		contentsMapper.updateLicense(licenseVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, licenseVO.getSeq(), "LICENSE");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > 면허 관리 > 삭제
	 * @param seqs
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deleteLicense(List<Integer> seqs) {

		Map<String, Object> paramMap = Maps.newHashMap();
		
		paramMap.put("seqs", seqs);
		paramMap.put("attType", "LICENSE");
		
		// 선택된 row의 파일 목록 조회
		List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
		
		// 물리 File 삭제
		fileList.forEach(fileService::deleteFile);
		
		// 면허 정보 삭제
		contentsMapper.deleteLicense(seqs);
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	public int getBoardCount(SearchVO searchVO) {
		return contentsMapper.getBoardCount(searchVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	public List<BoardVO> getBoardList(SearchVO searchVO) {
		// 게시판 관리 목록
		return contentsMapper.getBoardList(searchVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > 게시판 관리 > 상세
	 * @param parseInt
	 * @return
	 */
	public BoardVO getBoard(int seq) {
		
		// 게시판 상세
		BoardVO boardVO = contentsMapper.getBoard(seq);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(seq);
		fileVO.setAttType("BOARD");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		boardVO.setFiles(fileList);
		
		return boardVO;
	}

	/**
	 * 컨텐츠 관리 > 게시판 관리 > 등록
	 * @param request
	 * @param boardVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insertBoard(HttpServletRequest request, BoardVO boardVO) {

		// 게시판 등록
		contentsMapper.insertBoard(boardVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, boardVO.getSeq(), "BOARD");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}


	/**
	 * 컨텐츠 관리 > 게시판 관리 > 수정
	 * @param request
	 * @param boardVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updateBoard(HttpServletRequest request, BoardVO boardVO) {

		// 게시판 수정
		contentsMapper.updateBoard(boardVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, boardVO.getSeq(), "BOARD");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}


	/**
	 * 컨텐츠 관리 > 게시판 관리 > 삭제
	 * @param seqs
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deleteBoard(List<Integer> seqs) {
		
		Map<String, Object> paramMap = Maps.newHashMap();
		
		paramMap.put("seqs", seqs);
		paramMap.put("attType", "BOARD");
		
		// 선택된 row의 파일 목록 조회
		List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
		
		// 물리 File 삭제
		fileList.forEach(fileService::deleteFile);
		
		// 게시판 정보 삭제
		contentsMapper.deleteBoard(seqs);
	}
	
	/**
	 * 홈페이지 최신뉴스 상세
	 * @param boardVO
	 * @return
	 */
	public BoardVO getBoardBy(BoardVO boardVO) {
		
		BoardVO board = contentsMapper.getBoardBy(boardVO);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(boardVO.getSeq());
		fileVO.setAttType("BOARD");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		if(null != board && 0 < fileList.size()) {
			board.setFiles(fileList);
		}
		
		return board;
	}
	
	/**
	 * 홈페이지 최신뉴스 상세 이전, 이후
	 * @param searchVO
	 * @return
	 */
	public List<BoardVO> getBoardByPrevNext(SearchVO searchVO) {
		return contentsMapper.getBoardByPrevNext(searchVO);
	}
	
	/**
	 * 프론트 메인 뉴스 목록
	 * @param searchVO
	 * @return
	 */
	public List<BoardVO> getFrontMainNewsList(SearchVO searchVO) {
		return contentsMapper.getFrontMainNewsList(searchVO);
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	public int getPressCount(SearchVO searchVO) {
		return contentsMapper.getPressCount(searchVO);
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	public List<PressVO> getPressList(SearchVO searchVO) {
		// 보도자료 관리 목록
		return contentsMapper.getPressList(searchVO);
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 목록 (front no paging)
	 * @param searchVO
	 * @return
	 */

	public List<PressVO> getPressListFront(SearchVO searchVO) {
		// 보도자료 관리 목록
		return contentsMapper.getPressListFront(searchVO);
	}
		
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 상세
	 * @param parseInt
	 * @return
	 */
	public PressVO getPress(int seq) {
		
		// 게시판 상세
		PressVO pressVO = contentsMapper.getPress(seq);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(seq);
		fileVO.setAttType("PRESS");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		pressVO.setFiles(fileList);
		
		return pressVO;
	}
	
	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 등록
	 * @param request
	 * @param pressVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insertPress(HttpServletRequest request, PressVO pressVO) {

		contentsMapper.insertPress(pressVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, pressVO.getSeq(), "PRESS");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}

	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 수정
	 * @param request
	 * @param pressVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updatePress(HttpServletRequest request, PressVO pressVO) {

		// 게시판 수정
		contentsMapper.updatePress(pressVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, pressVO.getSeq(), "PRESS");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}

	/**
	 * 컨텐츠 관리 > 보도자료 관리 > 삭제
	 * @param seqs
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deletePress(List<Integer> seqs) {
		
		Map<String, Object> paramMap = Maps.newHashMap();
		
		paramMap.put("seqs", seqs);
		paramMap.put("attType", "PRESS");
		
		// 선택된 row의 파일 목록 조회
		List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
		
		// 물리 File 삭제
		fileList.forEach(fileService::deleteFile);
		
		// 게시판 정보 삭제
		contentsMapper.deletePress(seqs);
	}
	
	/**
	 * 홈페이지 보도자료 상세
	 * @param boardVO
	 * @return
	 */
	public PressVO getPressBy(PressVO pressVO) {
		
		PressVO press = contentsMapper.getPressBy(pressVO);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(pressVO.getSeq());
		fileVO.setAttType("PRESS");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		if(null != press && 0 < fileList.size()) {
			press.setFiles(fileList);
		}
		
		return press;
	}
	
	/**
	 * 홈페이지 보도자료 상세 이전, 이후
	 * @param searchVO
	 * @return
	 */
	public List<PressVO> getPressByPrevNext(SearchVO searchVO) {
		return contentsMapper.getPressByPrevNext(searchVO);
	}
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 목록 개수
	 * @param searchVO
	 * @return
	 */
	public int getDonateCount(SearchVO searchVO) {
		return contentsMapper.getDonateCount(searchVO);
	}
	
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 목록
	 * @param searchVO
	 * @return
	 */
	public List<DonateVO> getDonateList(SearchVO searchVO) {
		// 보도자료 관리 목록
		return contentsMapper.getDonateList(searchVO);
	}
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 목록 (front no paging)
	 * @param searchVO
	 * @return
	 */

	public List<DonateVO> getDonateListFront(SearchVO searchVO) {
		return contentsMapper.getDonateListFront(searchVO);
	}
		
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 상세
	 * @param parseInt
	 * @return
	 */
	public DonateVO getDonate(int seq) {
		// 상세
		DonateVO donate = contentsMapper.getDonate(seq);

		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(seq);
		fileVO.setAttType("DONATE");

		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		List<FileVO> reFileList = Lists.newArrayList();

		for (FileVO file : fileList) {
			if(file.getType().equalsIgnoreCase("MAIN") && 1 == file.getAttOrder()) {
				donate.setMainFileName1(file.getOrgName());
				donate.setMainFileId1(file.getId());
			} else if(file.getType().equalsIgnoreCase("MAIN") && 2 == file.getAttOrder()) {
				donate.setMainFileName2(file.getOrgName());
				donate.setMainFileId2(file.getId());
			} else {
				reFileList.add(file);
			}
		}
		// 파일
		donate.setFiles(reFileList);
		return donate;
	}
	
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 등록
	 * @param request
	 * @param donateVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insertDonate(HttpServletRequest request, DonateVO donateVO) {

		// CSR(사회공헌) 등록
		contentsMapper.insertDonate(donateVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, donateVO.getSeq(), "DONATE");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 수정
	 * @param request
	 * @param donateVO
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updateDonate(HttpServletRequest request, DonateVO donateVO) {
		
		// 면허 수정
		contentsMapper.updateDonate(donateVO);
		
		// 물리 File 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, donateVO.getSeq(), "DONATE");
		
		if(0 < files.size()) {
			// 파일 정보 등록
			fileMapper.insertForeachToList(files);
		}
	}
	
	
	/**
	 * 컨텐츠 관리 > CSR(사회공헌) 관리 > 삭제
	 * @param seqs
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deleteDonate(List<Integer> seqs) {

		Map<String, Object> paramMap = Maps.newHashMap();
		
		paramMap.put("seqs", seqs);
		paramMap.put("attType", "DONATE");
		
		// 선택된 row의 파일 목록 조회
		List<FileVO> fileList = fileMapper.getFileListByInSeq(paramMap);
		
		// 물리 File 삭제
		fileList.forEach(fileService::deleteFile);
		
		// 면허 정보 삭제
		contentsMapper.deleteDonate(seqs);
	}
	
	/**
	 * 홈페이지 보도자료 상세
	 * @param boardVO
	 * @return
	 */
	public DonateVO getDonateBy(DonateVO donateVO) {
		
		DonateVO donate = contentsMapper.getDonateBy(donateVO);
		
		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(donateVO.getSeq());
		fileVO.setAttType("DONATE");
		
		// 파일 목록
		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		if(null != donate && 0 < fileList.size()) {
			donate.setFiles(fileList);
		}
		
		return donate;
	}
	
	/**
	 * 홈페이지 CSR(사회공헌) 상세 이전, 이후
	 * @param searchVO
	 * @return
	 */
	public List<DonateVO> getDonateByPrevNext(SearchVO searchVO) {
		return contentsMapper.getDonateByPrevNext(searchVO);
	}
}

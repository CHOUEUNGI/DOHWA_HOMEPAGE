package kr.co.dohwa.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.mapper.MainMapper;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.MainBannerMlVO;
import kr.co.dohwa.vo.MainBannerVO;
import kr.co.dohwa.vo.MainPopupVO;
import kr.co.dohwa.vo.SearchVO;

/**
 * 메인 관리 관련 서비스
 * @author PARK
 *
 */
@Service("mainService")
public class MainService {

	@Autowired
	private FileUploader fileUploader;

	@Autowired
	private MainMapper mainMapper;

	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private FileService fileService;

	/**
	 * 메인 배너 조회(관리자 전용)
	 * @return
	 */
	public List<MainBannerVO> getMainBannerAdminList() {
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchLangType("KO");
		searchVO.setSearchBoardType("BANNER");
		searchVO.setSearchDeviceType("PC");

		List<MainBannerVO> list = mainMapper.getMainBannerAdminList(searchVO);

		return list;
	}

	/**
	 * 메인 배너 조회(프론트 전용)
	 * @return
	 */
	public List<Map<String, Object>> getMainBannerList(SearchVO searchVO) {
		return mainMapper.getFrontMainBannerList(searchVO);
	}

	/**
	 * 메인 배너 상세 조회
	 * @param mainBannerVO
	 * @return
	 */
	public MainBannerVO getMainBanner(MainBannerVO mainBannerVO) {
		MainBannerMlVO mainBannerMlVO = new MainBannerMlVO();

		// 상세
		MainBannerVO mainBanner = mainMapper.getMainBanner(mainBannerVO);

		// 다국어
		mainBannerMlVO.setSeq(mainBannerVO.getSeq());

		List<MainBannerMlVO> mainBannerMlList = mainMapper.getMainBannerMl(mainBannerMlVO);
		for (MainBannerMlVO mainBannerMl : mainBannerMlList) {
			if(mainBannerMl.getLang().equals("KO")) {
				mainBanner.setKoWebTitle(mainBannerMl.getWebTitle());
				mainBanner.setKoWebSubTitle(mainBannerMl.getWebSubTitle());
				mainBanner.setKoWebUrl(mainBannerMl.getWebUrl());
				mainBanner.setKoMoTitle(mainBannerMl.getMoTitle());
				mainBanner.setKoMoSubTitle(mainBannerMl.getMoSubTitle());
				mainBanner.setKoMoUrl(mainBannerMl.getMoUrl());
				mainBanner.setKoLinkBtnName(mainBannerMl.getLinkBtnName());
			} else if(mainBannerMl.getLang().equals("EN")) {
				mainBanner.setEnWebTitle(mainBannerMl.getWebTitle());
				mainBanner.setEnWebSubTitle(mainBannerMl.getWebSubTitle());
				mainBanner.setEnWebUrl(mainBannerMl.getWebUrl());
				mainBanner.setEnMoTitle(mainBannerMl.getMoTitle());
				mainBanner.setEnMoSubTitle(mainBannerMl.getMoSubTitle());
				mainBanner.setEnMoUrl(mainBannerMl.getMoUrl());
				mainBanner.setEnLinkBtnName(mainBannerMl.getLinkBtnName());
			} else if(mainBannerMl.getLang().equals("ES")) {
				mainBanner.setEsWebTitle(mainBannerMl.getWebTitle());
				mainBanner.setEsWebSubTitle(mainBannerMl.getWebSubTitle());
				mainBanner.setEsWebUrl(mainBannerMl.getWebUrl());
				mainBanner.setEsMoTitle(mainBannerMl.getMoTitle());
				mainBanner.setEsMoSubTitle(mainBannerMl.getMoSubTitle());
				mainBanner.setEsMoUrl(mainBannerMl.getMoUrl());
				mainBanner.setEsLinkBtnName(mainBannerMl.getLinkBtnName());
			}
		}

		// 파일 조회
		FileVO fileVO = new FileVO();
		fileVO.setAttType("BANNER");
		fileVO.setAttSeq(mainBannerVO.getSeq());

		mainBanner.setFiles(fileMapper.getFileList(fileVO));

		return mainBanner;
	}

	/**
	 * 메인 배너 등록
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String insertMainBanner(HttpServletRequest request, MainBannerVO mainBannerVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		// 타입 리스트 조회
		List<MainBannerVO> typeList = mainMapper.getMainBannerTypeList(mainBannerVO);

		// 최대 등록 건수 체크
		if(3 == typeList.size()) {
			return messageSource.getMessage("ADMIN.VALIDATE.PROC.OVERLAP", new String[] { typeList.size() + "" }, Locale.KOREA);

		} else {
			List<Integer> bannerOrderLimitList = Lists.newArrayList(1, 2, 3, 4, 5);
			List<Integer> bannerOrderCheckList = Lists.newArrayList();

			List<MainBannerVO> orderList = mainMapper.getMainBannerOrder();
			// 구분 순서
			if(0 == orderList.size()) {
				mainBannerVO.setBannerOrder(1);
			} else if(0 != typeList.size()) {
				mainBannerVO.setBannerOrder(typeList.get(0).getBannerOrder());
			} else {
				for (MainBannerVO s : orderList) {
					bannerOrderCheckList.add(s.getBannerOrder());
				}

				// 중간에 빠진 순서가 있을때
				if(bannerOrderLimitList.size() != bannerOrderCheckList.size()) {
					for (Integer s : bannerOrderLimitList) {
						if(!bannerOrderCheckList.contains(s)) {
							mainBannerVO.setBannerOrder(s);
							break;
						}
					}
				}
			}

			List<Integer> typeOrderLimitList = Lists.newArrayList(1, 2, 3);
			List<Integer> typeOrderCheckList = Lists.newArrayList();
			// 이미지 순서
			if(0 == typeList.size()) {
				mainBannerVO.setTypeOrder(1);
			} else {
				for (MainBannerVO s : typeList) {
					typeOrderCheckList.add(s.getTypeOrder());
				}

				for (Integer s : typeOrderLimitList) {
					if(!typeOrderCheckList.contains(s)) {
						mainBannerVO.setTypeOrder(s);
						break;
					}
				}
			}
		}

		// 메인 배너 등록
		int countMainBanner = mainMapper.insertMainBanner(mainBannerVO);

		// 메인 배너 다국어
		List<MainBannerMlVO> mls = Lists.newArrayList();
		for (String lang : Constant.LANG_CODES) {
			MainBannerMlVO mainBannerMlVO = new MainBannerMlVO();

			mainBannerMlVO.setSeq(mainBannerVO.getSeq());

			if(lang.equals("KO")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getKoWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getKoWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getKoWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getKoMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getKoMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getKoMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getKoLinkBtnName());
			} else if(lang.equals("EN")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getEnWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getEnWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getEnWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getEnMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getEnMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getEnMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getEnLinkBtnName());
			} else if(lang.equals("ES")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getEsWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getEsWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getEsWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getEsMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getEsMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getEsMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getEsLinkBtnName());
			}
				
			mls.add(mainBannerMlVO);
		}

		map.put("list", mls);
		int countMainBannerMl = mainMapper.insertMainBannerMl(map);

		List<FileVO> files = fileUploader.storeFilesRequest(request, mainBannerVO.getSeq(), "BANNER");

		// 파일 등록
		if(0 < files.size()) {
			map = Maps.newHashMap();
			map.put("list", files);
			map.put("etc1", mainBannerVO.getBannerType().toUpperCase());

			fileMapper.insertForeach(map);
		}

		if(0 < countMainBanner && 0 < countMainBannerMl) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 배너 변경
	 * @param request
	 * @param mainBannerVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String updateMainBanner(HttpServletRequest request, MainBannerVO mainBannerVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		// 배너 업데이트
		int updateCount = mainMapper.updateMainBanner(mainBannerVO);

		List<Integer> seqs = Lists.newArrayList();
		seqs.add(mainBannerVO.getSeq());

		// 다국어 삭제
		mainMapper.deleteMainBannerMlForeach(seqs);

		List<MainBannerMlVO> mls = Lists.newArrayList();
		for (String lang : Constant.LANG_CODES) {
			MainBannerMlVO mainBannerMlVO = new MainBannerMlVO();

			mainBannerMlVO.setSeq(mainBannerVO.getSeq());

			if(lang.equals("KO")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getKoWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getKoWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getKoWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getKoMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getKoMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getKoMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getKoLinkBtnName());
			} else if(lang.equals("EN")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getEnWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getEnWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getEnWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getEnMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getEnMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getEnMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getEnLinkBtnName());
			} else if(lang.equals("ES")) {
				mainBannerMlVO.setLang(lang);
				mainBannerMlVO.setWebTitle(mainBannerVO.getEsWebTitle());
				mainBannerMlVO.setWebSubTitle(mainBannerVO.getEsWebSubTitle());
				mainBannerMlVO.setWebUrl(mainBannerVO.getEsWebUrl());
				mainBannerMlVO.setMoTitle(mainBannerVO.getEsMoTitle());
				mainBannerMlVO.setMoSubTitle(mainBannerVO.getEsMoSubTitle());
				mainBannerMlVO.setMoUrl(mainBannerVO.getEsMoUrl());
				mainBannerMlVO.setLinkBtnName(mainBannerVO.getEsLinkBtnName());
			}

			mls.add(mainBannerMlVO);
		}

		map.put("list", mls);
		int countMainBannerMl = mainMapper.insertMainBannerMl(map);

		List<FileVO> files = fileUploader.storeFilesRequest(request, mainBannerVO.getSeq(), "BANNER");

		// 파일 등록
		if(0 < files.size()) {
			map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		if(0 < updateCount && 0 < countMainBannerMl) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 배너 삭제
	 * @param list
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String deleteMainBanner(List<Integer> seqs) {
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"삭제"}, Locale.KOREA);

		int countProjectMl = mainMapper.deleteMainBannerMlForeach(seqs);
		int countProject = mainMapper.deleteMainBannerForeach(seqs);

		List<FileVO> files = Lists.newArrayList();
		seqs.forEach(x -> {
			FileVO fileVO = new FileVO();
			fileVO.setAttType("BANNER");
			fileVO.setAttSeq(x);

			files.add(fileVO);
		});

		if(0 < countProject && 0 < countProjectMl) {
			fileService.deleteFileAttSeqType(files);
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"삭제"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 배너 정렬
	 * @param list
	 * @return
	 */
	public String updateMainBannerOrder(Map<String, Object> map) {
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		int count = mainMapper.updateMainBannerForeach(map);
		if(1 == count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 배너 노출
	 * @param mainBannerVO
	 * @return
	 */
	public String updateMainBannerDisp(MainBannerVO mainBannerVO) {
		String text = mainBannerVO.getDispYn().toUpperCase().equals("Y") ? "노출 처리 " : "비노출 처리";
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {text}, Locale.KOREA);

		int count = mainMapper.updateMainBanner(mainBannerVO);
		if(1 == count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {text}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 배너 건수
	 * @param searchVO
	 * @return
	 */
	public int getMainPopupCount(SearchVO searchVO) {
		return mainMapper.getMainPopupCount(searchVO);
	}

	/**
	 * 메인 배너 리스트
	 * @param searchVO
	 * @return
	 */
	public List<MainPopupVO> getMainPopupList(SearchVO searchVO) {
		return mainMapper.getMainPopupList(searchVO);
	}

	/**
	 * 메인 배너 리스트 (프론트)
	 * @param searchVO
	 * @return
	 */
	public List<MainPopupVO> getFrontMainPopupList(SearchVO searchVO) {
		return mainMapper.getFrontMainPopupList(searchVO);
	}

	/**
	 * 메인 배너 상세
	 * @param mainPopupVO
	 * @return
	 */
	public MainPopupVO getMainPopup(MainPopupVO mainPopupVO) {
		MainPopupVO mainPopup = mainMapper.getMainPopup(mainPopupVO);

		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(mainPopup.getSeq());
		fileVO.setAttType("POPUP");

		List<FileVO> files = fileMapper.getFileList(fileVO);
		mainPopup.setFiles(files);

		return mainPopup;
	}

	/**
	 * 메인 배너 등록
	 * @param request
	 * @param mainPopupVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String insertMainPopup(HttpServletRequest request, MainPopupVO mainPopupVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		// 노출 최대 3개 확인
		if(!StringUtils.isEmpty(mainPopupVO.getDispYn()) && mainPopupVO.getDispYn().equalsIgnoreCase("Y")) {
			SearchVO searchVO = new SearchVO();
			searchVO.setSearchLangType(mainPopupVO.getLang());
			searchVO.setSearchDispYn("Y");

			int checkCount = mainMapper.getMainPopupCount(searchVO);
			if(3 <= checkCount) {
				return messageSource.getMessage("ADMIN.VALIDATE.PROC.MAX", new String[] { checkCount + "", "노출", "노출상태로 등록" }, Locale.KOREA);
			}
		}

		int count = mainMapper.insertMainPopup(mainPopupVO);

		List<FileVO> files = fileUploader.storeFilesRequest(request, mainPopupVO.getSeq(), "POPUP");
		// 파일 등록
		if(0 < files.size()) {
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		if(0 < count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 팝업 변경
	 * @param request
	 * @param mainPopupVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String updateMainPopup(HttpServletRequest request, MainPopupVO mainPopupVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		// 노출 최대 3개 확인
		if(!StringUtils.isEmpty(mainPopupVO.getDispYn()) && mainPopupVO.getDispYn().equalsIgnoreCase("Y")) {
			SearchVO searchVO = new SearchVO();
			searchVO.setSearchLangType(mainPopupVO.getLang());
			searchVO.setSearchDispYn("Y");

			int checkCount = mainMapper.getMainPopupCount(searchVO);
			if(3 <= checkCount) {
				return messageSource.getMessage("ADMIN.VALIDATE.PROC.MAX", new String[] { checkCount + "", "노출", "노출상태로 등록" }, Locale.KOREA);
			}
		}

		int count = mainMapper.updateMainPopup(mainPopupVO);

		List<FileVO> files = fileUploader.storeFilesRequest(request, mainPopupVO.getSeq(), "POPUP");
		// 파일 등록
		if(0 < files.size()) {
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		if(0 < count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 메인 팝업 삭제
	 * @param seqs
	 * @return
	 */
	public String deleteMainPopup(List<Integer> seqs) {
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"삭제"}, Locale.KOREA);
		List<FileVO> files = Lists.newArrayList();

		int count = mainMapper.deleteMainPopupForeach(seqs);
		seqs.forEach(x -> {
			FileVO fileVO = new FileVO();
			fileVO.setAttType("POPUP");
			fileVO.setAttSeq(x);

			files.add(fileVO);
		});

		if(0 < count) {
			fileService.deleteFileAttSeqType(files);
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"삭제"}, Locale.KOREA);
		}

		return message;
	}

}

package kr.co.dohwa.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.constants.Constant;
import kr.co.dohwa.mapper.CodeMapper;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.mapper.ProjectMapper;
import kr.co.dohwa.vo.CodeVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.ProjectMlVO;
import kr.co.dohwa.vo.ProjectVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 프로젝트 관리 관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("projectService")
public class ProjectService {

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private FileUploader fileUploader;

	@Autowired
	private ProjectMapper projectMapper;

	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private CodeMapper codeMapper;

	@Autowired
	private MessageSource messageSource;

	/**
	 * 프로젝트 관리 건수 조회
	 * @param searchVO
	 * @return
	 */
	public int getProjectCount(SearchVO searchVO) {
		return projectMapper.getProjectCnt(searchVO);
	}

	/**
	 * 프로젝트 관리 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<ProjectVO> getProjectList(SearchVO searchVO) {
		return projectMapper.getProjectList(searchVO);
	}

	/**
	 * 프로젝트 관리 단건 조회(다국어 포함)
	 * @param projectVO
	 * @return
	 */
	public ProjectVO getProject(ProjectVO projectVO) {
		ProjectMlVO projectMlVO = new ProjectMlVO();
		projectMlVO.setSeq(projectVO.getSeq());

		// 상세
		ProjectVO project = projectMapper.getProject(projectVO);

		// 다국어
		List<ProjectMlVO> projectMlList = getProjectMlList(projectMlVO);
		for (ProjectMlVO projectMl : projectMlList) {
			if(projectMl.getLang().equals("KO")) {
				project.setKoTitle(projectMl.getTitle());
				project.setKoSubTitle(projectMl.getSubTitle());
				project.setKoCont(projectMl.getCont());
				project.setKoClient(projectMl.getClient());
			} else if(projectMl.getLang().equals("EN")) {
				project.setEnTitle(projectMl.getTitle());
				project.setEnSubTitle(projectMl.getSubTitle());
				project.setEnCont(projectMl.getCont());
				project.setEnClient(projectMl.getClient());
			} else if(projectMl.getLang().equals("ES")) {
				project.setEsTitle(projectMl.getTitle());
				project.setEsSubTitle(projectMl.getSubTitle());
				project.setEsCont(projectMl.getCont());
				project.setEsClient(projectMl.getClient());
			}
		}

		FileVO fileVO = new FileVO();
		fileVO.setAttSeq(projectVO.getSeq());
		fileVO.setAttType("PROJECT");

		List<FileVO> fileList = fileMapper.getFileList(fileVO);
		List<FileVO> reFileList = Lists.newArrayList();

		for (FileVO file : fileList) {
			if(file.getType().equalsIgnoreCase("MAIN") && 1 == file.getAttOrder()) {
				project.setMainFileName1(file.getOrgName());
				project.setMainFileId1(file.getId());
			} else if(file.getType().equalsIgnoreCase("MAIN") && 2 == file.getAttOrder()) {
				project.setMainFileName2(file.getOrgName());
				project.setMainFileId2(file.getId());
			} else {
				reFileList.add(file);
			}
		}

		// 파일
		project.setFiles(reFileList);

		return project;
	}

	/**
	 * 프로젝트 다국어 리스트 조회
	 * @param projectVO
	 * @return
	 */
	public List<ProjectMlVO> getProjectMlList(ProjectMlVO projectMlVO) {
		return projectMapper.getProjectMlList(projectMlVO);
	}

	/**
	 * 프로젝트 등록
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String insertProject(HttpServletRequest request, ProjectVO projectVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		// 프로젝트 등록
		int countProject = projectMapper.insertProject(projectVO);

		// 프로젝트 다국어
		List<ProjectMlVO> mls = Lists.newArrayList();
		for (String lang : Constant.LANG_CODES) {
			ProjectMlVO projectMlVO = new ProjectMlVO();

			if(lang.equals("KO")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getKoTitle());
				projectMlVO.setSubTitle(projectVO.getKoSubTitle());
				projectMlVO.setCont(projectVO.getKoCont());
				projectMlVO.setClient(projectVO.getKoClient());
			} else if(lang.equals("EN")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getEnTitle());
				projectMlVO.setSubTitle(projectVO.getEnSubTitle());
				projectMlVO.setCont(projectVO.getEnCont());
				projectMlVO.setClient(projectVO.getEnClient());
			} else if(lang.equals("ES")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getEsTitle());
				projectMlVO.setSubTitle(projectVO.getEsSubTitle());
				projectMlVO.setCont(projectVO.getEsCont());
				projectMlVO.setClient(projectVO.getEsClient());
			}

			mls.add(projectMlVO);
		}

		map.put("list", mls);
		int countProjectMl = projectMapper.insertProjectMl(map);

		List<FileVO> files = fileUploader.storeFilesRequest(request, projectVO.getSeq(), "PROJECT");

		// 파일 등록
		if(0 < files.size()) {
			map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		if(0 < countProject && 0 < countProjectMl) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 프로젝트 변경
	 * @param request
	 * @param projectVO
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String updateProject(HttpServletRequest request, ProjectVO projectVO) {
		Map<String, Object> map = Maps.newHashMap();
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		if(!StringUtils.isEmpty(projectVO.getStrRegDt())) {
			projectVO.setRegDt(LocalDateTime.parse(projectVO.getStrRegDt(), DateTimeFormatter.ofPattern("yyyyMMddHHmmss")));
		}

		// 프로젝트 변경
		int countProject = projectMapper.updateProject(projectVO);

		ProjectMlVO projectMlVO = new ProjectMlVO();
		projectMlVO.setSeq(projectVO.getSeq());

		// 프로젝트 다국어 삭제
		projectMapper.deleteProjectMl(projectMlVO);
		List<ProjectMlVO> mls = Lists.newArrayList();
		for (String lang : Constant.LANG_CODES) {
			projectMlVO = new ProjectMlVO();

			if(lang.equals("KO")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getKoTitle());
				projectMlVO.setSubTitle(projectVO.getKoSubTitle());
				projectMlVO.setCont(projectVO.getKoCont());
				projectMlVO.setClient(projectVO.getKoClient());
			} else if(lang.equals("EN")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getEnTitle());
				projectMlVO.setSubTitle(projectVO.getEnSubTitle());
				projectMlVO.setCont(projectVO.getEnCont());
				projectMlVO.setClient(projectVO.getEnClient());
			} else if(lang.equals("ES")) {
				projectMlVO.setSeq(projectVO.getSeq());
				projectMlVO.setLang(lang);
				projectMlVO.setTitle(projectVO.getEsTitle());
				projectMlVO.setSubTitle(projectVO.getEsSubTitle());
				projectMlVO.setCont(projectVO.getEsCont());
				projectMlVO.setClient(projectVO.getEsClient());
			}

			mls.add(projectMlVO);
		}

		// 프로젝트 다국어 등록
		map.put("list", mls);
		int countProjectMl = projectMapper.insertProjectMl(map);

		List<FileVO> files = fileUploader.storeFilesRequest(request, projectVO.getSeq(), "PROJECT");

		// 파일 등록
		if(0 < files.size()) {
			map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}

		if(0 < countProject && 0 < countProjectMl) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 프로젝트 삭제
	 * @param seqs
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String deleteProject(List<Integer> seqs) {

		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"삭제"}, Locale.KOREA);

		int countProjectMl = projectMapper.deleteProjectMlForeach(seqs);
		int countProject = projectMapper.deleteProjectForeach(seqs);

		if(0 < countProject && 0 < countProjectMl) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"삭제"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 프로젝트 노출
	 * @param seq
	 * @return
	 */
	public String updateProjectDisp(ProjectVO projectVO) {

		String text = projectVO.getDispYn().toUpperCase().equals("Y") ? "노출 처리 " : "비노출 처리";
		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {text}, Locale.KOREA);

		int count = projectMapper.updateProject(projectVO);
		if(1 == count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {text}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 프로젝트  리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<ProjectVO> getProjectFrontList(SearchVO searchVO) {
		return projectMapper.getProjectFrontList(searchVO);
	}

	/**
	 * 프로젝트 상세
	 * @param projectVO
	 * @return
	 */
	public ProjectVO getProjectFront(SearchVO searchVO) {
		ProjectVO project = projectMapper.getProjectFront(searchVO);

		if(null != project) {
			List<CodeVO> projectItemList = codeMapper.getProjectItemList();
			String lang = searchVO.getSearchLangType();

			projectItemList.forEach(x -> {
				if(x.getCode().equals(project.getType1())) {
					project.setType1(lang.equals("KO") ? x.getKoText() : lang.equals("EN") ? x.getEnText() : lang.equals("ES") ? x.getEsText() : "");
				}

				if(x.getCode().equals(project.getType2())) {
					project.setType2(lang.equals("KO") ? x.getKoText() : lang.equals("EN") ? x.getEnText() : lang.equals("ES") ? x.getEsText() : "");
				}

				if(x.getCode().equals(project.getType3())) {
					project.setType3(lang.equals("KO") ? x.getKoText() : lang.equals("EN") ? x.getEnText() : lang.equals("ES") ? x.getEsText() : "");
				}

				if(x.getCode().equals(project.getType4())) {
					project.setType4(lang.equals("KO") ? x.getKoText() : lang.equals("EN") ? x.getEnText() : lang.equals("ES") ? x.getEsText() : "");
				}

				if(x.getCode().equals(project.getType5())) {
					project.setType5(lang.equals("KO") ? x.getKoText() : lang.equals("EN") ? x.getEnText() : lang.equals("ES") ? x.getEsText() : "");
				}
			});
			FileVO fileVO = new FileVO();
			fileVO.setAttSeq(Integer.parseInt(searchVO.getSeq()));
			fileVO.setAttType("PROJECT");
			fileVO.setType(searchVO.getSearchDeviceType());

			project.setFiles(fileMapper.getFileList(fileVO));
		}

		return project;
	}

	/**
	 * 프로젝트 썸네일 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public int getProjectFrontCount(SearchVO searchVO) {
		return projectMapper.getProjectFrontCount(searchVO);
	}
	
	/**
	 * 프로젝트 썸네일 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<ProjectVO> getProjectThumList(SearchVO searchVO) {
		return projectMapper.getProjectThumList(searchVO);
	}

}

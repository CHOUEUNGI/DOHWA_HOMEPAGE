package kr.co.dohwa.component;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.common.collect.Lists;

import kr.co.dohwa.vo.FileEditorVO;
import kr.co.dohwa.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 파일 저장 관련 컴포넌트
 */
@Slf4j
@Component
public class FileUploader {

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Value("#{config['file.upload-temp']}")
	private String FILE_UPLOAD_TEMP;

	@Value("#{config['file.upload-security-dir']}")
	private String FILE_UPLOAD_SECURITY_DIR;

	/**
	 * 업로드 폴더 체크
	 */
	@PostConstruct
	private void uploadFolderCheck() {

		try {

			// 업로드 폴더(관리자에서 파일 올릴때)
			Path path = Paths.get(FILE_UPLOAD_DIR);
			Files.createDirectories(path);

			// 임시 업로드 폴더
			Path temp = Paths.get(FILE_UPLOAD_TEMP);
			Files.createDirectories(temp);

		} catch (Exception e) {
			log.error("파일을 업로드할 디렉토리를 생성하지 못했습니다.", e);
		}
	}

	/**
	 * 파일 저장
	 * @param request
	 * @param attSeq 파일 첨부된 게시판 시퀀스
	 * @param attType 파일 첨부된 게시판
	 */
	public List<FileVO> storeFilesRequest(HttpServletRequest request, int attSeq, String attType) {

		List<FileVO> list = null;

		try {

			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			Iterator<String> fileNames = multipartRequest.getFileNames();

			list = Lists.newArrayList();

			// 폴더
			Calendar calendar = Calendar.getInstance();
			String folderYear  = "" + calendar.get(Calendar.YEAR);
			String folderMonth = "" + (calendar.get(Calendar.MONTH) + 1);
			String folderDate  = "" + calendar.get(Calendar.DATE);
			String folderName = "/" + folderYear + "/" + (folderMonth.length() == 1 ? "0" + folderMonth : folderMonth) + "/" + (folderDate.length() == 1 ? "0" + folderDate : folderDate);

			Path uploadPath = Paths.get(FILE_UPLOAD_DIR + "/" + folderName);
			Files.createDirectories(uploadPath);

			while (fileNames.hasNext()) {
				String fileName = (String) fileNames.next();
				String[] files = fileName.split("_");
				if(2 < files.length) {
					MultipartFile mFile = multipartRequest.getFile(fileName);
					if(mFile.getSize() <= 0) {
						continue;
					}
					String orgName = mFile.getOriginalFilename();
					String extName = orgName.substring(orgName.lastIndexOf("."), orgName.length());
					String orgNameCheck = orgName.substring(0, orgName.lastIndexOf("."));
					if(40 < orgNameCheck.length()) {
						orgName = orgNameCheck.substring(0, 40) + extName;
					}

					// 서버에서 저장 파일 이름
					String newName = newFileName(extName);

					byte[] data = mFile.getBytes();
					Path path = Paths.get(FILE_UPLOAD_DIR + "/" + folderName + "/" + newName);

					Files.write(path, data);

					String imageId = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));

					FileVO fileVO = new FileVO();
					fileVO.setId(imageId + generateFileRegKey(13));
					fileVO.setAttSeq(attSeq);
					fileVO.setAttType(attType);
					fileVO.setAttOrder(Integer.parseInt(files[2]));
					fileVO.setNewName(newName);
					fileVO.setOrgName(orgName);
					fileVO.setPath(folderName);
					fileVO.setType(files[0].toUpperCase());

					if(3 < files.length) {
						fileVO.setLang(files[3].toUpperCase());
					}

					list.add(fileVO);
				}
			}

		} catch (Exception e) {
			log.error("FileUploader >>> storeFilesRequest error", e.getMessage());
		}

		return list;
	}

	/**
	 * MultipartFile로 파일 저장
	 * @param file
	 * @param seq
	 * @param type
	 * @return
	 * @throws IOException
	 */
	public Optional<FileVO> storeFileToMultipartFile(MultipartFile file, int seq, String type) throws IOException {

		FileVO fileVO = null;
		if (file.isEmpty()) return Optional.of(fileVO);

		// 폴더
		Calendar calendar = Calendar.getInstance();
		String folderYear  = "" + calendar.get(Calendar.YEAR);
		String folderMonth = "" + (calendar.get(Calendar.MONTH) + 1);
		String folderDate  = "" + calendar.get(Calendar.DATE);
		String folderName = "/" + folderYear + "/" + (folderMonth.length() == 1 ? "0" + folderMonth : folderMonth) + "/" + (folderDate.length() == 1 ? "0" + folderDate : folderDate);

		Path uploadPath = Paths.get(FILE_UPLOAD_DIR + "/" + folderName);

		try {
			Files.createDirectories(uploadPath);
		} catch (IOException e) {
			log.error("MultipartFile로 파일 저장중 에러발생");
			throw e;
		}

		String orgName = file.getOriginalFilename();
		String extName = orgName.substring(orgName.lastIndexOf("."), orgName.length());

		String orgNameCheck = orgName.substring(0, orgName.lastIndexOf("."));
		if(40 < orgNameCheck.length()) {
			orgName = orgNameCheck.substring(0, 40) + extName;
		}

		// 서버에서 저장 파일 이름
		String newName = newFileName(extName);

		byte[] data = file.getBytes();
		Path path = Paths.get(FILE_UPLOAD_DIR + "/" + folderName + "/" + newName);

		Files.write(path, data);

		String imageId = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));

		fileVO = new FileVO();
		fileVO.setId(imageId + generateFileRegKey(13));
		fileVO.setAttSeq(seq);
		fileVO.setAttType(type);
		fileVO.setNewName(newName);
		fileVO.setOrgName(orgName);
		fileVO.setPath(folderName);

		return Optional.of(fileVO);
	}

	/**
	 * 서버 파일 저장(에디터용)
	 * @param multipartFile
	 * @return
	 */
	public FileVO storeFileCKEditor(FileEditorVO fileEditorVO) {

		try {

			MultipartFile multipartFile = fileEditorVO.getUpload();

			FileVO fileVO = new FileVO();

			// 폴더
			Calendar calendar = Calendar.getInstance();
			String folderYear  = "" + calendar.get(Calendar.YEAR);
			String folderMonth = "" + (calendar.get(Calendar.MONTH) + 1);
			String folderDate  = "" + calendar.get(Calendar.DATE);
			String folderName = "/" + folderYear + "/" + (folderMonth.length() == 1 ? "0" + folderMonth : folderMonth) + "/" + (folderDate.length() == 1 ? "0" + folderDate : folderDate);

			Path uploadPath = Paths.get(FILE_UPLOAD_DIR + "/" + folderName);
			Files.createDirectories(uploadPath);

			// 파일 정보
			String orgName = multipartFile.getOriginalFilename();
			String extName = orgName.substring(orgName.lastIndexOf("."), orgName.length());

			// 서버에서 저장 파일 이름
			String newName = newFileName(extName);

			byte[] data = multipartFile.getBytes();
			Path path = Paths.get(FILE_UPLOAD_DIR + "/" + folderName + "/" + newName);

			Files.write(path, data);

			fileVO.setNewName(newName);
			fileVO.setPath(folderName);
			fileVO.setCkToken(generateFileRegKey(20));

			return fileVO;

		} catch (Exception e) {
			log.error("에디터 파일 업로드시 오류가 발생 했습니다.", e);
		}

		return new FileVO();
	}

	/**
	 * 파일 삭제
	 * @param fileVO
	 */
	public void deleteFile(FileVO fileVO) {
		File file = new File(FILE_UPLOAD_DIR + fileVO.getPath() + "/" + fileVO.getNewName());
		if(file.exists()) {
			try {
				Files.delete(file.toPath());
			} catch (IOException e) {
				log.error("파일삭제에 실패하였습니다.");
			}
		}
	}

	/**
	 * 현재 시간을 기준으로 파일 이름 생성
	 * @param extName
	 * @return
	 */
	public String newFileName(String extName) {
		Calendar calendar = Calendar.getInstance();
		StringBuilder fileName = new StringBuilder();

		String year  = "" + calendar.get(Calendar.YEAR);
		String month = "" + (calendar.get(Calendar.MONTH) + 1);
		String date  = "" + calendar.get(Calendar.DATE);

		fileName.append(year);
		fileName.append(month.length() == 1 ? "0" + month : month);
		fileName.append(date.length() == 1 ? "0" + date : date);
		fileName.append(UUID.randomUUID().toString().replace("-", "").substring(0, 15));
		fileName.append(extName);

		return fileName.toString();
	}

	/**
	 * 이미지 등록 키 생성
	 * @return
	 */
	public String generateFileRegKey(int length) {
		return UUID.randomUUID().toString().replace("-", "").substring(0, length);
	}
}
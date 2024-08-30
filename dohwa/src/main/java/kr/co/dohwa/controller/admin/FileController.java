package kr.co.dohwa.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dohwa.component.FileDownLoadView;
import kr.co.dohwa.service.FileService;
import kr.co.dohwa.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private FileService fileService;

	@Autowired
	private FileDownLoadView downloadView;

	/**
	 * 이미지 뷰어
	 * @param 파일 이이디
	 * @throws IOException
	 */
	@GetMapping("/image/{id}")
	public void getImageAsByteArray(
			@PathVariable(name = "id", required = true) String id,
			HttpServletResponse response) {

		FileVO fileVO = new FileVO();
		fileVO.setId(id);

		FileVO file = fileService.getFile(fileVO);
		File initialFile = new File(FILE_UPLOAD_DIR + file.getPath() + "/" + file.getNewName());

		String contentType = file.getOrgName().substring(file.getOrgName().lastIndexOf(".") + 1);
		InputStream in = null;

		if(initialFile.exists()) {
			try {
				if(initialFile.getAbsolutePath().equalsIgnoreCase(initialFile.getCanonicalPath())) {
					in = new FileInputStream(initialFile);

					response.setContentType("image/" + contentType.toLowerCase());
					IOUtils.copy(in, response.getOutputStream());
				} else {
					response.setStatus(404);
				}
			} catch (IOException e) {
				log.error("I/O 예외 발생");
			} finally {
				try {
					if(null != in) {
						in.close();
					}
				} catch (IOException e) {
					log.error("InputStream close 예외 발생");
				}
			}
		} else {
			response.setStatus(404);
		}
	}

	/**
	 * pathFileId를 기준으로 일반 파일 다운로드
	 * @param pathFileId 파일 ID
	 * @return ModelAndView
	 */
	@GetMapping("/download/file/{pathFileId}")
	public ModelAndView downloadFile(@PathVariable(name = "pathFileId", required = true) String pathFileId) {

		ModelAndView mav = new ModelAndView();

		FileVO param = new FileVO();
		param.setId(pathFileId);
		FileVO fileVO = fileService.getFile(param);

		File downFile = null;
		if(fileVO != null) {
			downFile = new File(FILE_UPLOAD_DIR + fileVO.getPath() + "/" + fileVO.getNewName());
			mav.addObject("downloadFile", downFile);
			mav.addObject("fileName", fileVO.getOrgName());
			mav.setView(downloadView);
			return mav;

		} else {
			mav.setStatus(HttpStatus.FORBIDDEN);
			return mav;
		}

	}

	/**
	 * 파일ID 기준으로 일반 파일 다운로드
	 * @param request
	 * @param type
	 * @param fileName
	 * @param extension
	 * @return
	 */
	@GetMapping("/{type}/{fileName}.{extension:zip|pdf|doc|docx|xls|xlsx}")
	public ModelAndView downloadFile(HttpServletRequest request,
			@PathVariable(name = "type", required = true) String type,
			@PathVariable(name = "fileName", required = true) String fileName,
			@PathVariable(name = "extension", required = true) String extension) {

		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		fileName = fileName.replaceAll(match, "");

		File downFile = new File(FILE_UPLOAD_DIR + "/" + fileName + "." + extension);

		return new ModelAndView("downloadView", "downloadFile", downFile);
	}

	/**
	 * 파일 삭제
	 * @param id(파일 아이디)
	 */
	@GetMapping("/admin/file/delete/{id}")
	@ResponseBody
	public boolean deleteFile(@PathVariable(name = "id", required = true) String id, FileVO fileVO) {
		fileVO.setId(id);
		return fileService.deleteFile(fileVO);
	}

	/**
	 * attType, attSeq를 기준으로 파일 삭제
	 * @param id(파일 아이디)
	 */
	@GetMapping("/admin/file/delete}")
	@ResponseBody
	public boolean deleteFile(FileVO fileVO) {
		return fileService.deleteFile(fileVO);
	}
}
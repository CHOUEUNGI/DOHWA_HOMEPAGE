package kr.co.dohwa.component;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;

/**
 * 파일 다운로드 뷰 컴포넌트
 */
@Slf4j
@Component
public class FileDownLoadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("FileDownLoadView start");

		File file = (File) map.get("downloadFile");
		String fileName = (String) map.get("fileName");
		String lang = (String) map.get("lang");

		log.info("FileDownLoadView file.isFile() " + file.isFile());

		// 파일 없을때
		if(!file.isFile()) {
//			String message = messageSource.getMessage("file.download.empty", null, null, Locale.KOREA);
//			if(!StringUtils.isEmpty(lang) && lang.equals("en")) {
//				message = messageSource.getMessage("file.download.empty", null, null, Locale.ENGLISH);
//			}
			// TODO : 메시지 처리
			String message = "첨부 파일이 없습니다.";
			log.info("FileDownLoadView 첨부 파일이 없습니다.");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+ message +"'); history.go(-1);</script>");
			out.flush();
		} else {

			String encordedFilename = URLEncoder.encode(fileName,"UTF-8").replace("+", "%20");

			if("pdf".equalsIgnoreCase(FilenameUtils.getExtension(fileName))) {
				setContentType("application/pdf; charset=utf-8");
			} else {
				setContentType("application/download; charset=utf-8");
				response.setHeader("Content-Disposition","attachment;filename=" + encordedFilename + ";filename*= UTF-8''" + encordedFilename);	//이 구문이 있으면 [다운로드], 이 구문이 없다면 바로 target 지정된 곳에 view 해줍니다.
				response.setHeader("Content-Transter-Encoding", "binary");
			}

			response.setContentType(getContentType());
			response.setContentLength((int) file.length());

			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;

			log.info("FileDownLoadView 첨부 파일이 다운로드 ㄱㄱ");

			try {

				fis = new FileInputStream(file);

				FileCopyUtils.copy(fis, out);

			} catch (Exception e) {
				log.error("파일 다운로드 에러 발생", e);
			} finally {
				if (null != fis) {
					try {
						fis.close();
					} catch (IOException ioe) {
						log.error("FileInputStream close 에러 발생", ioe);
					}
				}
				out.flush();
			}
		}
	}
}

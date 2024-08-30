package kr.co.dohwa.util.excel;
//@Component > @Service
//			: 스프링 프레임워크가 관리하는 컴포넌트의 일반적 타입 
//			: 개발자가 직접 조작이 가능한 클래스의 경우 해당 어노테이션을 붙임
//			: ( <=> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용)

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
// AbstractView : 스프링 MVC 사용시 DispatcherServlet 기능
//				: requestURI에 따라 컨트롤러로 분기하고 로직 처리 후 Resolver를 사용하여
//				: 해당 jsp 파일을 찾아 응답하게 되는데 그 사이 시점을 잡아 처리하는 부분의 기능
public class ExcelFileDownloadView extends AbstractView {
	
	public ExcelFileDownloadView() {
		log.debug("엑셀파일다운로드뷰 로딩!!!");
		setContentType("application/download; charset=utf-8");
	}
	
//  파일 다운로드
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
						HttpServletResponse response) throws Exception {
		File file = (File) model.get("downloadFile");
		String downloadFileName = (String) model.get("downloadFileName");
		String downloadFileExt = (String) model.get("downloadFileExt");
		String downloadFileNameAndDotAndExt = downloadFileName + "." + downloadFileExt;
		
		response.setContentType(getContentType());
		response.setContentLength((int) file.length()); 
		
		String header = request.getHeader("User-Agent");
		boolean b = header.indexOf("MSIE") > -1;
		String fileName = null;
		
		if (b) {
			fileName = URLEncoder.encode(downloadFileNameAndDotAndExt, "utf-8");
		} else {
			fileName = new String(downloadFileNameAndDotAndExt.getBytes("utf-8"), "iso-8859-1");
		}
		
		response.setHeader("Conent-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transter-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(file);
			
			FileCopyUtils.copy(fis, out);
		} catch (IOException e) {
			log.error("renderMergedOutputModel error {}", e);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
					log.error("renderMergedOutputModel close error {}", ioe);
				}
			}
			
			out.flush();
		}
	}
}
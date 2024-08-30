package kr.co.dohwa.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dohwa.util.excel.ExcelCommentNotFountException;
import kr.co.dohwa.util.excel.ExcelManager;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/excel")
public class ExcelController {

	@Value("#{config['file.download-temp']}")
	private String FILE_DOWNLOAD_TEMP;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private ResourceLoader resourceLoader;

	@RequestMapping("/excelDownload")
	public ModelAndView excelDownload(@RequestParam("data") String data) {
		ExcelManager excelManager = new ExcelManager();
		String templateExcelfilePath = "";
		String makeExcelFilePath = "";

		try {

			templateExcelfilePath = resourceLoader.getResource("classpath:/excel/로그관리양식파일.xlsx").getURI().getPath();
			makeExcelFilePath = FILE_DOWNLOAD_TEMP + File.separator + UUID.randomUUID().toString().replaceAll("-", "") + ".xlsx";

			excelManager.makeExcel(templateExcelfilePath, makeExcelFilePath, data);
		} catch (IOException e) {
			log.error("엑셀 파일 로드 실패 {}", e);
		} catch (ExcelCommentNotFountException e) {
			log.error("엑셀 다운로드 실패 {}", e);
		}

		return new ModelAndView("downloadView", "downloadFile", new File(makeExcelFilePath)).addObject("fileName",  "사용자 로그.xlsx");
	}

}

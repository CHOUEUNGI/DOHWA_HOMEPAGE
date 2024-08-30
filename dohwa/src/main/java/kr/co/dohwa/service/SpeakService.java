package kr.co.dohwa.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.mappermssql.SpeakMapper;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.SpeakFileVO;
import kr.co.dohwa.vo.SpeakVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 윤리경영 제보 라인관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("speakService")
public class SpeakService {

	@Autowired
	private SpeakMapper speakMapper;

	@Autowired
	private FileUploader fileUploader;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	/**
	 * 제보 정보 조회
	 * @param speakVO
	 * @return
	 */
	public SpeakVO  getSpeakInfo(SpeakVO speakVO) {
		speakMapper.insertSpeakLog(speakVO); //로그 남기기
		return speakMapper.getSpeakInfo(speakVO);
	}

	/**
	 * 제보 라인 첨부 파일 리스트 조회
	 * @param speakVO
	 * @return
	 */
	public List<SpeakFileVO> getSpeakFileList(SpeakVO speakVO) {
		return speakMapper.getSpeakFileList(speakVO);
	}

	/**
	 * 제보 정보 인서트
	 * @param speakVO
	 * @return
	 * @throws Exception
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void insertSpeakInfo(HttpServletRequest request, SpeakVO speakVO) throws Exception {

		//  신규 ID 가져오기
		speakVO.setId(speakMapper.getSpeakNewId());

		// 파일 등록
		List<FileVO> files = fileUploader.storeFilesRequest(request, 0, "SPEAK");
		if(0 < files.size()) {
			List<SpeakFileVO> speakFileList = new ArrayList<SpeakFileVO>();
			int idx = 1;
			for(FileVO fileVO : files) {
				SpeakFileVO speakFileVO = new SpeakFileVO();
				speakFileVO.setId(speakVO.getId());
				speakFileVO.setFilename(speakVO.getId() + "_" + idx + "." + FilenameUtils.getExtension(fileVO.getOrgName()));
				speakFileVO.setUploadFilePath(FILE_UPLOAD_DIR + fileVO.getPath()  + "/" + fileVO.getNewName());
				speakFileList.add(speakFileVO);
				idx++;
			}
			speakVO.setSpeakFileList(speakFileList);
		}

		// 파일 ftp 업로드하고 DB 인서트
		if(speakVO.getSpeakFileList() != null && !speakVO.getSpeakFileList().isEmpty()) {
			uploadFileListByFtp(speakVO);
			for(SpeakFileVO speakFile : speakVO.getSpeakFileList()) {
				speakMapper.insertSpeakFile(speakFile);
			}
		}

		// 제보 마스터 테이블 인서트
		speakMapper.insertSpeakInfo(speakVO);
	}

	/**
	 * 첨부파일을 ftp를 이용해서 업로드한다.
	 * @param speakVO
	 * @throws Exception
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void uploadFileListByFtp(SpeakVO speakVO) throws Exception {
		String server = "138.91.229.209";
        int port = 21;
        String user = "speakupadmin";
        String pass = "dhspeakup1!@";
        FTPClient ftp = new FTPClient();

        try {
        	ftp.connect(server, port);
            ftp.login(user, pass);
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();
            ftp.changeWorkingDirectory("/uploadedfiles/");

            if(speakVO.getSpeakFileList() != null && !speakVO.getSpeakFileList().isEmpty()) {
	            for(SpeakFileVO speakFile : speakVO.getSpeakFileList()) {
	            	 File uploadFile = new File(speakFile.getUploadFilePath());
	            	 FileInputStream fis = new FileInputStream(uploadFile);
	            	 boolean isSuccess = ftp.storeFile(speakFile.getFilename(), fis);
	            	 fis.close();
	            	 if (isSuccess) {
	            		 log.debug(speakFile.getFilename() + " : Ftp Upload Success");
	                 } else {
	                	 throw new Exception(speakFile.getFilename() + " : Ftp Upload Fail");
	                 }
	            	 uploadFile.deleteOnExit();
	            }
            }

            ftp.logout();

        } catch(Exception e) {
        	log.error("uploadFileListByFtp : ftp error :: "+e.getMessage(), e);
        	throw e;

        } finally {
            if (ftp != null && ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException e){
                	log.error("uploadFileListByFtp : finally error :: "+e.getMessage(), e);
                }
            }
        }

	}
}

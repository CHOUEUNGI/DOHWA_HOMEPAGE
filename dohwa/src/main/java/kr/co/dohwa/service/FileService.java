package kr.co.dohwa.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 파일 관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("fileService")
public class FileService {

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	@Autowired
	private FileMapper fileMapper;

	/**
	 * 파일 등록
	 * @return
	 */
	@Transactional
	public void insert(FileVO fileVO) {
		fileMapper.insert(fileVO);
	}

	/**
	 * 파일 조회
	 * @param fileVO
	 * @return
	 */
	public FileVO getFile(FileVO fileVO) {
		return fileMapper.getFile(fileVO);
	}

	/**
	 * 파일 리스트 조회
	 * @param fileVO
	 * @return
	 */
	public List<FileVO> getFileList(FileVO fileVO) {
		return fileMapper.getFileList(fileVO);
	}

	/**
	 * 파일 삭제(물리 삭제 포함)
	 * @param fileVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean deleteFile(FileVO fileVO) {
		FileVO findFileVO = getFile(fileVO);

		if(null != findFileVO && !StringUtils.isEmpty(findFileVO.getId())) {
			// DB 정보 삭제
			int cnt = fileMapper.deleteFileId(findFileVO);

			if(0 < cnt) {
				// 물리적 삭제
				File file = new File(FILE_UPLOAD_DIR + fileVO.getPath() + "/" + fileVO.getNewName());
				if(file.exists()) {
					try {
						Files.delete(file.toPath());
					} catch (IOException e) {
						log.error("파일삭제에 실패하였습니다.");
					}
				}
				return true;
			}
		}
		return false;
	}

	/**
	 *  ATT_SEQ , ATT_TYPE 값 기준으로 파일 삭제
	 * @param fileVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteFileAttSeqType(List<FileVO> files) {
		if(null != files && 0 < files.size()) {
			for (FileVO file : files) {
				fileMapper.deleteFileAttSeqType(file);
			}
		}
	}
	
}

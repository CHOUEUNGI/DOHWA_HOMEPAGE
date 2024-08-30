package kr.co.dohwa.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dohwa.mapper.CodeMapper;
import kr.co.dohwa.vo.CodeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 코드 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("codeService")
public class CodeService {

	@Autowired
	private CodeMapper codeMapper;

	@Autowired
	private MessageSource messageSource;

	@Value("#{config['file.upload-dir']}")
	private String FILE_UPLOAD_DIR;

	/**
	 * 코드 리스트 조회
	 * @param codeVO
	 * @return
	 */
	public List<CodeVO> getCodeList(CodeVO codeVO) {
		return codeMapper.getCodeList(codeVO);
	}

	/**
	 * 코드 insert merge
	 * @param codeVO
	 * @return
	 */
	@Transactional
	public String insertMerge(Map<String, Object> map) {

		String message = messageSource.getMessage("ADMIN.VALIDATE.PROC.FAIL", new String[] {"저장"}, Locale.KOREA);

		int count = codeMapper.insertMerge(map);
		if(0 < count) {
			message = messageSource.getMessage("ADMIN.VALIDATE.PROC.SUCCESS", new String[] {"저장"}, Locale.KOREA);
		}

		return message;
	}

	/**
	 * 프로젝트 항목 조회
	 * @param codeVO
	 * @return
	 */
	public List<CodeVO> getProjectItemList() {
		return codeMapper.getProjectItemList();
	}

}

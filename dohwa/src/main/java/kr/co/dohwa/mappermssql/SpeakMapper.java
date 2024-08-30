package kr.co.dohwa.mappermssql;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.dohwa.vo.SpeakFileVO;
import kr.co.dohwa.vo.SpeakVO;

/**
 * 프론트 회사소개 윤리경영 제보 라인 관련 Mapper
 * @author PARK
 *
 */
@Mapper
public interface SpeakMapper {
	/**
	 * 제보 정보 조회
	 * @param speakVO
	 * @return
	 */
	SpeakVO getSpeakInfo(SpeakVO speakVO);

	/**
	 * 제보 ID 생성
	 * @return
	 */
	String getSpeakNewId();

	/**
	 * 제보 라인 첨부 파일 리스트 조회
	 * @param speakVO
	 * @return
	 */
	List<SpeakFileVO> getSpeakFileList(SpeakVO speakVO);

	/**
	 * 제보 정보 인서트
	 * @param speakVO
	 * @return
	 */
	int insertSpeakInfo(SpeakVO speakVO);

	/**
	 * 제보 정보 첨부 파일 인서트
	 * @param speakVO
	 * @return
	 */
	int insertSpeakFile(SpeakFileVO speakFileVO);

	/**
	 * 진행/결과확인 조회시 로깅
	 * @param speakFileVO
	 * @return
	 */
	int insertSpeakLog(SpeakVO speakVO);


}
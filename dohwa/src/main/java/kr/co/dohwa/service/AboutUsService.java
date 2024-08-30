package kr.co.dohwa.service;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.dohwa.component.FileUploader;
import kr.co.dohwa.mapper.AboutUsMapper;
import kr.co.dohwa.mapper.FileMapper;
import kr.co.dohwa.vo.CustInqrVO;
import kr.co.dohwa.vo.FileVO;
import kr.co.dohwa.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 프론트 회사소개 관련 서비스, 어드민 고객문의관리 관련 서비스
 * @author PARK
 *
 */
@Slf4j
@Service("aboutUsService")
public class AboutUsService {

	@Autowired
	private AboutUsMapper aboutUsMapper;

	@Autowired
	private FileUploader fileUploader;

	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MessageSource messageSource;

	@Value("#{config['dohwa.cust.inqr.answ.email']}")
	private String DOHWA_CUST_INQR_ANSW_EMAIL;
	
	// 답변시 발송 메일 양식
	@Value("#{config['dohwa.cust.inqr.answ.email.html1']}")
	private String DOHWA_CUST_INQR_ANSW_EMAIL_HTML1;	

	// 문의등록시 발송 메일 양식
	@Value("#{config['dohwa.cust.inqr.answ.email.html2']}")
	private String DOHWA_CUST_INQR_ANSW_EMAIL_HTML2;
	
	/**
	 * 어드민 고객문의 관리 리스트 조회
	 * @param searchVO
	 * @return
	 */
	public List<CustInqrVO> getCustInqrList(SearchVO searchVO) {
		return aboutUsMapper.getCustInqrList(searchVO);
	}

	/**
	 * 어드민 고객문의 관리 리스트 조회 전체 건수
	 * @param searchVO
	 * @return
	 */
	public int getCustInqrTotCnt(SearchVO searchVO) {
		return aboutUsMapper.getCustInqrTotCnt(searchVO);
	}

	/**
	 * 어드민 고객문의 관리 등록
	 * @param financeVO
	 * @return
	 */
	public void insertCustInqr(HttpServletRequest request, CustInqrVO custInqrVO) {
		
		// DB 저장
		aboutUsMapper.insertCustInqr(custInqrVO);
		
		// 파일 정보 저장
		List<FileVO> files = fileUploader.storeFilesRequest(request, custInqrVO.getSeq(), custInqrVO.getTypeCode());
		if(0 < files.size()) {
			Map<String, Object> map = Maps.newHashMap();
			map.put("list", files);
			fileMapper.insertForeach(map);
		}	
		
		// 메일 발송
		try {
			// 메일 발송 https://offbyone.tistory.com/167 참고함
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom(custInqrVO.getEmail());
					helper.setTo(DOHWA_CUST_INQR_ANSW_EMAIL);
					Locale mailLocale = Locale.getDefault();
					if("en".equalsIgnoreCase(custInqrVO.getLang())) {
						mailLocale = Locale.ENGLISH;
					} else if("es".equalsIgnoreCase(custInqrVO.getLang())) {
						mailLocale = Locale.forLanguageTag("es");
					}
					String title = messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.000", new String[] { (StringUtils.isNotEmpty(custInqrVO.getRegNm()) ? XssPreventer.unescape(custInqrVO.getRegNm()) : "") }, mailLocale); 
					String html = FileUtils.readFileToString(new File(DOHWA_CUST_INQR_ANSW_EMAIL_HTML2), "utf-8");
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.001#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.001", new String[] { (StringUtils.isNotEmpty(custInqrVO.getRegNm()) ? XssPreventer.unescape(custInqrVO.getRegNm()) : "") }, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.002#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.002", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.003#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.003", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.004#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.004", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.005#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.005", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.006#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.006", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.007#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.007", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.002.008#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.002.008", null, mailLocale));
					html = html.replaceAll("\\#DOMAIN\\#", "https://dhhome.azurewebsites.net");
					html = html.replace("#NAME#", StringUtils.isNotEmpty(custInqrVO.getRegNm()) ? XssPreventer.unescape(custInqrVO.getRegNm()) : "");
					html = html.replace("#EMAIL#", StringUtils.isNotEmpty(custInqrVO.getEmail()) ? XssPreventer.unescape(custInqrVO.getEmail()) : "");
					html = html.replace("#TEL#", StringUtils.isNotEmpty(custInqrVO.getTel()) ? XssPreventer.unescape(custInqrVO.getTel()) : "");
					html = html.replace("#SUBJECT#", StringUtils.isNotEmpty(custInqrVO.getTitle()) ? XssPreventer.unescape(custInqrVO.getTitle()) : "");
					html = html.replace("#CONTENTS#", StringUtils.isNotEmpty(custInqrVO.getCont()) ? XssPreventer.unescape(custInqrVO.getCont()) : "");
					html = html.replace("#SEQ#", custInqrVO.getSeq()+"");
					helper.setSubject(title);
					helper.setText(html, true);
					log.info("메일발송완료 ("+custInqrVO.getSeq()+"):::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" );
					log.debug(title);
					log.debug(html);
				}
			};
			mailSender.send(preparator);
		}catch(Exception e) {
			log.error("insertCustInqr email sending error :: " + e.getMessage(), e);
		}
		
	}

	/**
	 * 어드민 고객문의 관리  수정(답변, 이메일발송)
	 * @param request	HttpServletRequest
	 * @param custInqrVO	CustInqrVO
	 */
	public void updateCustInqr(HttpServletRequest request, CustInqrVO custInqrVO) {
		custInqrVO.setAnswEmailSendYn(sendEmailForAnsw(request, custInqrVO));	// 이메일 발송 후 결과 셋팅
		aboutUsMapper.updateCustInqr(custInqrVO);	// 답변 저장.
	}

	/**
	 * 고객문의 답변시 이메일 발송
	 * @param request
	 * @param custInqrVO
	 * @return
	 */
	public String sendEmailForAnsw(HttpServletRequest request, CustInqrVO custInqrVO) {

		String answEmailSendYn = "N";
		try {
			// 메일 발송 https://offbyone.tistory.com/167 참고함
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom(DOHWA_CUST_INQR_ANSW_EMAIL);
					helper.setTo(custInqrVO.getEmail());
					Locale mailLocale = Locale.KOREAN;
					if("en".equalsIgnoreCase(custInqrVO.getLang())) {
						mailLocale = Locale.ENGLISH;
					} else if("es".equalsIgnoreCase(custInqrVO.getLang())) {
						mailLocale = Locale.forLanguageTag("es");
					}
					String title = messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.000", null, mailLocale); 
					String html = FileUtils.readFileToString(new File(DOHWA_CUST_INQR_ANSW_EMAIL_HTML1), "utf-8");
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.001#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.001", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.002#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.002", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.003#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.003", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.004#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.004", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.005#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.005", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.006#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.006", null, mailLocale));
					html = html.replace("#FRONT.COMMON.MENU.ABOUTUS.007.001.007#", messageSource.getMessage("FRONT.COMMON.MENU.ABOUTUS.007.001.007", null, mailLocale));
					html = html.replaceAll("\\#DOMAIN\\#", "https://dhhome.azurewebsites.net");
					html = html.replace("#NAME#", StringUtils.isNotEmpty(custInqrVO.getRegNm()) ? XssPreventer.unescape(custInqrVO.getRegNm()) : "");
					html = html.replace("#EMAIL#", StringUtils.isNotEmpty(custInqrVO.getEmail()) ? XssPreventer.unescape(custInqrVO.getEmail()) : "");
					html = html.replace("#TEL#", StringUtils.isNotEmpty(custInqrVO.getTel()) ? XssPreventer.unescape(custInqrVO.getTel()) : "");
					html = html.replace("#SUBJECT#", StringUtils.isNotEmpty(custInqrVO.getTitle()) ? XssPreventer.unescape(custInqrVO.getTitle()) : "");
					html = html.replace("#CONTENTS#", StringUtils.isNotEmpty(custInqrVO.getCont()) ? XssPreventer.unescape(custInqrVO.getCont()) : "");
					html = html.replace("#ANSW#", StringUtils.isNotEmpty(custInqrVO.getAnsw()) ? XssPreventer.unescape(custInqrVO.getAnsw()) : "");
					helper.setSubject(title);
					helper.setText(html, true);
					log.info("메일발송완료 ("+custInqrVO.getSeq()+"):::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" );
					log.debug(title);
					log.debug(html);
				}
			};
			mailSender.send(preparator);
			answEmailSendYn = "Y";
		}catch(Exception e) {
			log.error("updateCustInqr email sending error :: " + e.getMessage(), e);
		}

		return answEmailSendYn;

	}

	/**
	 * 고객문의  삭제
	 * @param financeVO
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void deleteCustInqr(String[] arrSeq, String typeCode) {
		CustInqrVO custInqrVO = null;
		FileVO fileVO = null;
		for(String seq : arrSeq) {
			custInqrVO = new CustInqrVO();
			custInqrVO.setSeq(Integer.parseInt(seq));
			aboutUsMapper.deleteCustInqr(custInqrVO);	// 고객문의 삭제

			fileVO = new FileVO();
			fileVO.setAttType(typeCode);
			fileVO.setAttSeq(Integer.parseInt(seq));
			fileMapper.deleteFileAttSeqType(fileVO);	// 고객이 첨부한 파일 정보 삭제
		}

	}
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<c:if test='${not empty sessionScope.DOHWA_MESSAGE}'>
			<script type="text/javascript">
				alert('<c:out value="${sessionScope.DOHWA_MESSAGE}" />');
			</script>
			<c:remove var="DOHWA_MESSAGE" scope="session" />
			</c:if>
			<footer class="footer" id="footer">
				<!-- footer include -->
				<div class="footer-wrap">
					<div class="footer-content">
						<div class="btn-goTop">
							<button class="btn-top" type="button"><spring:message code="FRONT.COMMON.MENU.FOOTER.001.MOB" text="TOP" /></button>
						</div>
						<div class="footer-family">
							<div class="family-inner">
								<button class="family-btn" type="button"><span><spring:message code="FRONT.COMMON.MENU.FOOTER.010" text="Employee Site" /></span></button>
								<ul class="family-list">
									<li class="family-item"><a href="http://edm.dohwa.co.kr" title="새창열림">EDMS</a></li>
									<li class="family-item"><a href="https://gw.dohwa.co.kr/ekp/view/login/userLogin" title="새창열림">Groupware</a></li>
									<li class="family-item"><a href="http://cmfg.dohwa.co.kr/" title="새창열림">CMFG</a></li>
									<li class="family-item"><a href="http://webhard.dohwa.co.kr/pm/" title="새창열림">Webhard</a></li>
								</ul>
							</div>
						</div>
						<div class="footer-inner">
							<span class="footer-logo"><img src="/images/common_mobile/img_footer_logo.jpg" alt="DOHWA" /></span>
							<c:choose>
								<c:when test="${'ko' eq _lang}">		
									<span class="footer-sns">
										<a class="ico-blog" href="https://blog.naver.com/dohwa_official" title="새창열림" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.008" text="Blog" /></span></a>
										<a class="ico-youtube" href="https://www.youtube.com/channel/UCUaAuOZcXXooHu7ddO_L03g?view_as=subscriber" title="새창열림" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.009" text="Youtube" /></span></a>
									</span>
								</c:when>
								<c:otherwise>
									<span class="footer-sns-global">
										<a class="ico-facebook-global" href="https://www.facebook.com/dohwaengineering" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.011" text="Facebook" /></span></a>
										<a class="ico-linkedin-global" href="https://www.linkedin.com/company/dohwa-engineering" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.012" text="Linkedin" /></span></a>
										<a class="ico-blog-global" href="https://blog.naver.com/dohwa_official" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.008" text="Blog" /></span></a>
										<a class="ico-youtube-global" href="https://www.youtube.com/channel/UCUaAuOZcXXooHu7ddO_L03g?view_as=subscriber" target="_blank"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.FOOTER.009" text="Youtube" /></span></a>
									</span>
								</c:otherwise>
							</c:choose>
							<div class="footer-info">
								<p><spring:message code="FRONT.COMMON.MENU.FOOTER.003" text="서울특별시 강남구 삼성로 438 (#16178)" /></p>
								<p><spring:message code="FRONT.COMMON.MENU.FOOTER.004.MOB" text="대표전화 02-6323-3000" /></p>
								<ul class="footer-menu">
									<li>
										<a href="<c:url value="${mobileStartPath }privacy_policy_01"/>"><strong class="nanumB"><spring:message code="FRONT.COMMON.MENU.FOOTER.005.MOB" text="개인정보처리방침" /></strong></a>
									</li>
									<li><a href="<c:url value="${mobileStartPath }speak"/>"><spring:message code="FRONT.COMMON.MENU.FOOTER.006" text="윤리경영 제보라인" /></a></li>
								</ul>
								<address class="copyright">
									<spring:message code="FRONT.COMMON.MENU.FOOTER.007.MOB" text="COPYRIGHT © 2020 DOHWA ENGINEERING CO., LTD. AllRIGHT RESERVED." />
								</address>
							</div>
						</div>
					</div>
				</div>
			</footer>
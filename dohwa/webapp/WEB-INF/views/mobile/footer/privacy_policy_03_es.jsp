<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 지도-->
<!-- 영상-->
<!-- paging-->
<!-- location-->
<!DOCTYPE html>
<!--[if IE 7]><html lang="<%=response.getLocale().getLanguage()%>" class="ie7"><![endif]-->
<!--[if IE 8]><html lang="<%=response.getLocale().getLanguage()%>" class="ie8"><![endif]-->
<!--[if IE 9]><html lang="<%=response.getLocale().getLanguage()%>" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="<%=response.getLocale().getLanguage()%>">
	<!--<![endif]-->
	<head>
		<%@ include file="/WEB-INF/views/mobile/layout/head.jsp" %>
	</head>
	<body>
		<!--[if lte IE 8]>
			<p class="browserupgrade">
				You are using an
				<strong>outdated</strong>
				browser. Please
				<a href="https://browsehappy.com/">upgrade your browser</a>
				to improve your experience and security.
			</p>
		<![endif]-->
		<div class="etc etc-policy" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual visual-area etc">
						<div class="page-title-sec">
							<h2 class="title-main">PRIVACY POLICY</h2>
						</div>
					</div>
					<div class="contents-wrap" style="position:relative">
						<div class="contents no-btm-type clfix">
							<div class="section-cont etc">
								<div class="etc-policy-cont">
									<strong>PRIVACY POLICY</strong>
									<p>
										DOHWA Engineering Co., LTD., (“DOHWA” herein) acknowledges and respects the user’s privacy when visiting its dohwa.co.kr and global.dohwa.co.kr websites. You do not need to provide any information when you visit our site. However, we will act responsibly (by not trading, selling, or renting any information that has been provided) if you knowingly and voluntarily decide to give us personal information
										through any one of the following modes of communication:
									</p>
									<div class="sub-desc">
										<ul>
											<li>- Your email address for alerts from DOHWA or for direct contact with a DOHWA Engineering employee.</li>
											<li>- Form filled out by you to provide contact information to DOHWA.</li>
											<li>- By submitting an application for employment.</li>
										</ul>
									</div>
									<p>DOHWA might collect, store or disclose your information as allowed (or as required by law), including:</p>
									<div class="sub-desc">
										<ul>
											<li>- Making any necessary or advisable disclosure to protect the rights, safety, or property of DOHWA or others.</li>
											<li>- Processing an employment application.</li>
											<li>- Allowing for lawful security about law enforcement investigations.</li>
											<li>- Complying with any legal requirements.</li>
										</ul>
									</div>
									<p class="mgt100">
										Although DOHWA might collect or provide aggregate statistics about its site(s) and its users for its own purposes (such as improving site connectivity and accessibility, etc) (and share this with other parties), this data does not contain any identifiable information, rather, it reveals only internet addresses (IP Address), country from where you're visiting the site, types of operating systems, browser
										software, and pages accessed by visitors. We use this aggregate data to learn more about the behavior of our visitors/users and to measure overall user demographics and to plan for future development of the website. It must be noted that the DOHWA website may contain hyperlinks to other non-DOWHA sites of interest to visitors, and we do not control or monitor the privacy, accuracy, quality, or integrity of
										those sites.
									</p>
									<p>This DOHWA privacy policy only applies to information collected and maintained by DOHWA. We reserve the right to modify this policy any time by updating this webpage. This privacy policy was last updated on May 01, 2012. Questions regarding our policy should be directed here.</p>
								</div>
							</div>
						</div>
						<div class="sub-page-grid">
							<div class="grid-wrap" aria-hidden="true">
								<div class="grid-ico-wrap" aria-hidden="true">
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
								</div>
								<div class="grid-line-wrap">
									<div class="grid-line" aria-hidden="true"></div>
									<div class="grid-line" aria-hidden="true"></div>
									<div class="grid-line" aria-hidden="true"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<div class="cnt-grid-wrap" aria-hidden="true">
			<div class="grid-ico-wrap" aria-hidden="true">
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
			</div>
			<div class="grid-line-wrap" aria-hidden="true">
				<div class="grid-line" aria-hidden="true"></div>
				<div class="grid-line" aria-hidden="true"></div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script>
			//- var component = new ComponentUI();
			//- component.tabContent('.tab-list-3depth', '.inner-tab-cont');

			$(".sub-page-grid .grid-line")
				.eq(0)
				.css("display", "none");
			$(".sub-page-grid .grid-ico")
				.eq(0)
				.css("display", "none");
			$(".sub-page-grid .grid-ico")
				.eq(1)
				.css("display", "none");
		</script>
	</body>
</html>
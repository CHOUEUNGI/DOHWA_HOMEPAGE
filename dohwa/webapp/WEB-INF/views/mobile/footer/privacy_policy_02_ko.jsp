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
							<h2 class="title-main">개인정보 처리방침</h2>
						</div>
					</div>
					<div class="contents-wrap" style="position:relative">
						<div class="contents no-btm-type clfix">
							<div class="section-cont etc">
								<!--s: 20200914 마크업 수정, 텍스트 수정-->
								<div class="etc-policy-desc">
									<div class="nanumR">
										<p>
											주식회사 도화엔지니어링(이하 "회사"라고 함)은 이용자의 개인 정보를 매우 소중하게 생각하고 있으며, '정보통신망 이용 촉진 및 정보보호에 관한 법률'을 준수하고 있습니다. 회사는 이용자의 개인 정보가 어떠한 목적과 방식으로 이용되고 있으며, 이용자의 개인 정보보호를 위해 어떠한 조치가 취해지고 있는지 아래와 같이 알려드립니다. 회사는 개인정보 취급방침 내용을 개정 또는 업데이트하는 경우, 웹사이트 공지 또는 개별
											공지를 통해 개정 또는 업데이트 사항을 알려드릴 것입니다. 다음 개인정보 취급방침은 이 웹사이트 (www.dohwa.co.kr, "본 사이트")에 적용됩니다.
										</p>
									</div>
									<br />
									<p>본 방침은 2012년 01월 01일부터 시행됩니다.</p>
								</div>
								<div class="tab-menu-type02">
									<ul class="tab-list tab-list-3depth">
										<li>
											<a class="item" href="<c:url value="${mobileStartPath}privacy_policy_01" />">
												<span class="txt" data-id="">
													개인정보
													<br />
													처리방침
												</span>
											</a>
										</li>
										<li class="active">
											<a class="item" href="javascript:void(0);">
												<span class="txt" data-id="">
													개인정보
													<br />
													취급방침
												</span>
											</a>
										</li>
										<li>
											<a class="item" href="<c:url value="${mobileStartPath}privacy_policy_03" />">
												<span class="txt" data-id="">
													영상정보처리기기
													<br />
													운영관리방침
												</span>
											</a>
										</li>
									</ul>
								</div>
								<!--e: 20200914 마크업 수정, 텍스트 수정-->
								<div class="inner-tab-cont active">
									<div class="etc-policy-cont type02">
										<strong>01. 개인 정보 자동 수집 장치의 설치, 운영 및 그 거부에 관한 사항</strong>
										<p>회사는 쿠키 등 인터넷 서비스 이용 시 자동 생성되는 개인 정보를 수집하는 장치를 운영하지 않습니다.</p>
										<strong>02. 수집의 목적</strong>
										<p>회사는 수집한 개인 정보를 다음의 목적을 위해 활용합니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 입사전형 및 지원자와의 연락</li>
												<li>- 급여 지급, 복리후생 제공, 교육, 신용보증보험 가입 업무, 각종 업무 수행 지원 및 평가 등 인사관리</li>
											</ul>
										</div>
										<strong>03. 수집하는 개인 정보 항목</strong>
										<p>회사는 입사전형 및 지원자 연락 등을 위해 아래와 같은 개인 정보를 수집하고 있습니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 수집항목 : 성명(국문/한자/영문), 사진, 비밀번호, 자택전화번호, 자택 주소, 본적, 휴대전화 번호, 이메일, 학력, 병역(군필 여부, 복무 기간, 군별, 계급), 어학능력, 컴퓨터 능력, 자격사항, 가족관계, 보훈 여부, 경력, 사회경험, 수상 경력, 해외 경험, 연구 경험</li>
												<li>- 개인 정보 수집 방법 : 홈페이지</li>
											</ul>
										</div>
										<strong>04. 개인 정보의 공개</strong>
										<p>
											이용자의 사전동의가 있는 경우 또는 법률이 이용자의 개인 정보를 제3자인 수사기관, 사법기관 또는 기타 정부기관에 공개할 것을 요구하는 경우를 제외하고,
											<br />
											본 사이트를 통해 수집된 개인 정보는 외부로 공개되지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
										</p>
										<div class="sub-desc">
											<ul>
												<li>- 이용자들이 사전에 동의한 경우</li>
												<li>- 법령의 규정에 의거하거나, 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</li>
											</ul>
											<br />
											<p class="fnt14">회사는 이용자의 동의 없이 이용자의 정보를 외부업체에 위탁하지 않습니다. 이용자가 요청한 서비스를 제공하기 위하여 외부업체에 이용자의 개인 정보를 공개할 필요가 있는 경우, 외부업체의 신원 및 요청받은 서비스의 내용에 대하여 이용자에게 통지하고, 이용자로부터 사전동의를 얻도록 하겠습니다</p>
										</div>
										<strong>05. 이용자 및 법정대리인의 권리와 그 행사방법</strong>
										<p>
											이용자 및 그 법정대리인은 언제든지 등록되어 있는 이용자의 개인 정보의 조회/수정/동의 철회를 요청하실 수 있습니다. 개인 정보관리부서에 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. 귀하가 개인 정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인 정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인 정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체
											없이 통지하여 정정이 이루어지도록 하겠습니다. 회사는 이용자 혹은 그 법정대리인의 요청에 의해 해지 또는 삭제된 개인 정보에 대해 "보유 및 이용 기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
										</p>
										<strong>06. 개인 정보의 보유 및 파기</strong>
										<p>
											이용자로부터 제공된 모든 정보는 보관 목적 또는 관련 법의 준수 목적 이외의 용도로 사용되는 것이 금지되며, 개인 정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 그러나, 이용자가 개인 정보 파기를 요청하는 경우, 관련 법률이 그러한 정보를 보유할 것을 요구하는 일정 기간이 파기 요청 시점보다 뒤에 종료하는 경우가 아닌 한, 해당 요청이 접수된 즉시 이용자의 정보는 일체 파기되며
											어떠한 보관 정보도 남지 않으며, 파기절차 및 방법은 다음과 같습니다.
										</p>
										<div class="sub-desc">
											<em>가. 채용된 입사 지원자의 개인정보</em>
											<ul>
												<li>- 보유기간 : 영구보유</li>
												<li>- 보유이유 : 재직중 인사관리 등, 퇴직후 복리 후생, 경력증명서 발급 등</li>
												<li>- 보유항목 : 성명(국문/한자/영문), 사진, 비밀번호, 자택 전화번호, 자택 주소, 휴대 전화번호, 이메일, 학력, 병역(군필여부, 복무기간, 군별, 계급), 어학능력, 컴퓨터능력, 자격사항, 가족관계, 보훈여부, 경력, 사회경험, 수상경력, 해외경험, 연구경험</li>
											</ul>
											<em>나. 채용되지 아니한 입사 지원자의 개인정보</em>
											<ul>
												<li>- 보유기간 : 채용절차 종료 후 5년</li>
												<li>- 보유이유 : 향후 채용 가능자원의 관리</li>
												<li>- 보유항목 : 성명(국문/한자/영문), 사진, 비밀번호, 자택 전화번호, 자택 주소, 휴대 전화번호, 이메일, 학력, 병역(군필여부, 복무기간, 군별, 계급), 어학능력, 컴퓨터능력, 자격사항, 가족관계, 보훈여부, 경력, 사회경험, 수상경력, 해외경험, 연구경험</li>
											</ul>
											<em>다. 파기절차</em>
											<p>회원님이 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용 기간 참조) 일정 기간 저장된 후 파기됩니다. 별도 DB로 옮겨진 개인 정보는 법률에 의한 경우가 아니고서는 보유 목적 이외의 다른 목적으로 이용되지 않습니다.</p>
											<em>라. 파기방법</em>
											<p>전자적 파일 형태로 저장된 개인 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
										</div>
										<strong>07. 외부 사이트 링크</strong>
										<p>본 사이트에는 다른 웹사이트로 연결되는 링크가 포함되어 있을 수 있으며, 회사는 링크된 웹사이트의 내용 또는 그러한 웹사이트의 사용에 대해 책임을 지지 않습니다.</p>
										<p>이용자는 그러한 링크된 웹사이트의 사용 세 링크된 웹사이트의 개인 정보취급 방침이 적용된다는 것에 동의합니다.</p>
										<strong>08. 개인 정보의 보호</strong>
										<p>회사는 직원들이 개인 정보에 접근하거나 개인 정보를 사용하는 것을 제한함으로써 권한 없는 자에 의해 또는 부적절하게 그러한 개인 정보에 접근이 이루어지는 것을 방지하는 엄격한 안전장치를 유지하고 있습니다.</p>
										<strong>09. 개인 정보에 대한 이용자 지원 서비스</strong>
										<p>회사는 개인 정보를 보호하고 개인 정보와 관련된 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인 정보보호 책임자를 지정하고 있습니다.</p>
										<div class="sub-desc">
											<!--s: 20200914 텍스트 수정-->
											<em>가. 개인 정보담당 부서</em>
											<!--e: 20200914 텍스트 수정-->
											<ul>
												<li>- 부서 : (주)도화엔지니어링 총무인사팀</li>
												<li>- 전화번호 : 02-6323-3000</li>
												<li>- 이메일 : insa@dohwa.co.kr</li>
												<li>- 업무시간안내 : (월-금) 09:00 ~ 18:00, (토-일) 휴무</li>
											</ul>
											<br />
											<p>개인정보취급방침의 침해에 대한 신고 나 개인정보취급방침과 관련하여 문의가 있는 경우에는 아래 기관으로 연락하시기 바랍니다.</p>
											<ul>
												<li>- 개인정보침해신고센터 (http://privacy.kisa.or.kr 전화번호 : 118)</li>
												<li>- 정보보호마크인증위원회 (http://www.eprivacy.or.kr 전화번호 : 02-580-0533~4)</li>
												<li>- 대검찰청인터넷범죄수사센터 (http://www.spo.go.kr 전화번호 : 02-3480-3600)</li>
												<li>- 경찰청사이버테러대응센터 (http://www.ctrc.go.kr 전화번호 : 02-392-0330)</li>
											</ul>
											<br />
											<ul>
												<li>공고 일자 : 2012년 01월 01일</li>
												<li>시행 일자 : 2012년 01월 01일</li>
											</ul>
										</div>
									</div>
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
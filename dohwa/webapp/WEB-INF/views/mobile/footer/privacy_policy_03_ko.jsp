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
								<!--s: 20200914 텍스트 수정-->
								<div class="etc-policy-desc">
									<p>
										주식회사 도화엔지니어링(이하 ”회사”라고 함)은 개인정보보호법, 정보통신망 이용 촉진 및 정보보호에 할 법률 등 관련 법령 상의 개인 정보보호 규정을 준수하며, 관련 법령에 의거한
										<br />
										개인정보 처리방침 및 취급방침 등을 통하여 정보주체가 제공하는 개인 정보가 어떠한 용도와 방식으로 처리되고 있으며, 개인 정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보 처리방침 등을 개정하는 경우도 도화엔지니어링 웹사이트 공지사항 (또는 개별 공지)을 통해 공지할 것입니다.
									</p>
									<br />
									<p>회사가 공개하는 개인 정보 관련 방침은, 회사가 처리하는 모든 정보 주체의 개인 정보보호에 관한 &lt;개인정보 처리방침&gt;, 회사가 운영하는 홈페이지 이용자의 개인 정보보호에 관한&lt;개인정보 취급방침&gt;, 개인 영상 정보보호에 관한 &lt;영상 정보 처리 기기 운영, 관리 방침&gt;의 세 가지로 구성되어 있습니다.</p>
								</div>
								<!--e: 20200914 텍스트 수정-->
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
										<li>
											<a class="item" href="<c:url value="${mobileStartPath}privacy_policy_02" />">
												<span class="txt" data-id="">
													개인정보
													<br />
													취급방침
												</span>
											</a>
										</li>
										<li class="active">
											<a class="item" href="javascript:void(0);">
												<span class="txt" data-id="">
													영상정보처리기기
													<br />
													운영관리방침
												</span>
											</a>
										</li>
									</ul>
								</div>
								<!--s: 20200914 텍스트 수정-->
								<div class="inner-tab-cont active">
									<div class="etc-policy-cont">
										<strong>01. 영상정보처리기기의 설치 근거 및 설치 목적</strong>
										<p>
											영상 정보처리기 그 운영&middot;관리 방침(이하 ‘본 방침’이라 함)은 개인정보보호법 제25조에 따라 영상정보처리기기의 설치&middot;운영 및 개인 영상 정보보호에 대하여
											<br />
											주식회사 도화엔지니어링(이하 ‘회사’라 함)이 준수해야 할 사항을 정함으로써 업무의 적정한 수행을 도모하고 정보주체의 권익 보장에 이바지함을 목적으로 합니다.
										</p>
										<strong>02. 개인 영상 정보의 보호 원칙</strong>
										<p>
											회사는 영상정보처리기기의 설치 목적에 부합하는 필요 최소한의 범위 안에서 개인 영상 정보를 수집하고, 이와 같은 설치 목적을 정보주체가 명확히 인식할 수 있도록 하며,
											<br />
											개인 영상 정보를 그 목적 이외의 용도로 활용하지 아니합니다. 회사는 개인 영상 정보를 안전하게 관리하며, 개인 영상 정보의 처리에 관한 사항을 공개하고,
											<br />
											개인 영상 정보에 대한 정보주체의 권리를 보장합니다.
										</p>
										<strong>03. 관리 책임자의 지정 등</strong>
										<p>회사는 각 사업부별로 개인 영상정보처리기기의 설치 및 운영을 관리하고 있으며, 아래의 내용은 각 사업부에서 별도로 운영하고 있는 홈페이지 등에서 공개하고 있습니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 관리책임자, 담당부서및업무담당자</li>
												<li>- 영상정보처리기기의설치대수, 위치및촬영범위</li>
												<li>- 영상정보처리기기의촬영시간, 보관기간및보관장소</li>
												<li>- 영상정보처리기기의설치&middot;관리위탁에관한사항</li>
											</ul>
										</div>
										<strong>04. 안내판의 설치</strong>
										<p>회사는 정보주체가 영상정보처리기기가 설치&middot;운영 중임을 쉽게 알아볼 수 있도록 아래와 같은 사항을 기재한 안내판 설치 등 필요한 조치를 취합니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 설치 목적 및 장소, 촬영범위 및 시간, 관리 책임자의 성명, 직책 및 연락처</li>
												<li>- 설치 및 관리 사무를 위탁하는 경우, 수탁자의 명칭 및 연락처</li>
											</ul>
											<br />
											<p class="fnt14">
												안내판은 촬영범위 내에서 정보주체가 알아보기 쉬운 장소에 누구라도 용이하게 판독할 수 있게 설치하며, 안내판의 규격은 40ⅹ30cm로 합니다.
												<br />
												다만, 위 규격은 설치 장소의 여건에 따라 변경될 수 있습니다.
											</p>
										</div>
										<strong>05. 정보주체의 열람 등 청구</strong>
										<p>
											정보주체는 회사가 처리하는 자신의 개인 영상 정보에 대하여 열람 및 존재 확인(이하 “열람 등”이라 함)을 회사에 청구할 수 있습니다. 회사는 열람 등 청구를 받았을 때에는
											<br />
											지체 없이 필요한 조치를 취하며, 이때에 회사는 열람 등 청구를 한자가 본인이거나 정당한 대리인인지를 주민등록증, 운전면허증, 여권 등의 신분증명서를 제출받아 확인할 수 있습니다.
											<br />
											정보주체의 열람 등 청구에도 불구하고 아래와 같은 경우에는 개인 영상 정보 열람 등 청구를 거부할 수 있으며, 이 경우에 10일 이내에 서면 등으로 거부 사유 및 불복할 수 있는 방법을 정보주체에게 통지합니다.
										</p>
										<div class="sub-desc">
											<ul>
												<li>- 개인 영상 정보의 보관 기간이 경과하여 파기한 경우</li>
												<li>- 기타 정보주체의 열람 등 요구를 거부할만한 정당한 사유가 존재하는 경우</li>
											</ul>
										</div>
										<strong>06. 영상 정보의 관리</strong>
										<p>정보주체의 동의 또는 법령의 규정 등에 의하여 개인 영상 정보를 수집 목적 이외의 용도로 이용하거나 제3자에게 제공하는 경우에는 아래와 같은 사항을 「개인 영상 정보관리 대장」에 기록하고 이를 관리합니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 개인 영상 정보 파일의 명칭</li>
												<li>- 이용하거나 제공받은 자의 명칭</li>
												<li>- 이용 또는 제공의 목적</li>
												<li>- 법령상 이용 또는 제공 근거가 있는 경우 그 근거</li>
												<li>- 이용 또는 제공의 기간이 정하여져 있는 경우에는 그 기간</li>
												<li>- 이용 또는 제공의 형태</li>
											</ul>
											<br />
											<p>개인 영상 정보를 파기하는 경우에는 아래와 같은 사항을「개인 영상 정보관리 대장」에 기록하고 관리합니다.</p>
											<ul>
												<li>- 파기하는 개인 영상 정보 항목</li>
												<li>- 개인 영상 정보 파기 일시 (사전에 파기 시기 등을 정한 자동 삭제의 경우에는 파기 주기 등)</li>
												<li>- 개인 영상 정보 파기 담당자</li>
											</ul>
										</div>
										<strong>07. 보관 및 파기</strong>
										<p>
											회사는 수집한 개인 영상 정보를 본 방침에 명시한 보관 기간이 만료한 때에는 지체 없이 파기합니다.
											<br />
											다만, 다른 법령에 특별한 규정이 있는 경우에는 그러하지 아니합니다. 개인 영상 정보의 파기방법은 아래와 같습니다.
										</p>
										<div class="sub-desc">
											<ul>
												<li>- 개인 영상 정보가 기록된 출력물(사진 등) 등은 파쇄 또는 소각</li>
												<li>- 전자기적(電磁氣的) 파일 형태의 개인 영상 정보는 복원이 불가능한 기술적 방법으로 영구 삭제</li>
											</ul>
										</div>
										<strong>08. 관리적/기술적/물리적 조치</strong>
										<p>영상정보처리기기에 의하여 수집&middot;처리되는 개인 영상 정보의 접근 권한은 관리 책임자 및 업무 담당자 등 지정된 최소한의 인원으로 제한하고 있습니다.</p>
										<p>영상정보처리기기에 의하여 전송되는 개인 영상 정보가 열람&middot;재생되는 장소를 출입제한구역으로 지정하고 접근 권한이 부여된 자 외의 출입 및 열람 및 재생을 통제하고 있습니다.</p>
										<p>
											회사는 전보, 퇴직 등인 사이 동사 유가 발생하여 접근 권한이 변경된 경우에는 지체 없이 권한을 변경 또는 말소합니다. 회사는 개인 영상 정보를 처리하거나 개인 영상 정보 파일을
											<br />
											송수신하는 경우 영상 정보가 분실, 도난, 누출, 변조 또는 훼손되지 아니하도록 비밀번호 설정 등 안전성 확보에 필요한 조치를 취하고 있습니다.
										</p>
										<p>회사는 개인 영상 정보의 위, 변조를 방지하기 위하여 영상정보처리기기의 정상작동 여부를 정기적으로 점검하고 있습니다.</p>
										<div class="sub-desc">
											<ul>
												<li>공고 일자 : 2012년 01월 01일</li>
												<li>시행 일자 : 2012년 01월 01일</li>
											</ul>
										</div>
									</div>
								</div>
								<!--e: 20200914 텍스트 수정-->
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
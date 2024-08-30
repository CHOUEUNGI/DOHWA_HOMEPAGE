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
									<p>
										회사가 공개하는 개인 정보 관련 방침은, 회사가 처리하는 모든 정보 주체의 개인 정보보호에 관한 &lt;개인정보 처리방침&gt;, 회사가 운영하는 홈페이지 이용자의 개인 정보보호에 관한
										<br />
										&lt;개인정보 취급방침&gt;, 개인 영상 정보보호에 관한 &lt;영상 정보 처리 기기 운영, 관리 방침&gt;의 세 가지로 구성되어 있습니다.
									</p>
								</div>
								<!--e: 20200914 텍스트 수정-->
								<div class="tab-menu-type02">
									<ul class="tab-list tab-list-3depth">
										<li class="active">
											<a class="item" href="javascript:void(0);">
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
								<div class="inner-tab-cont active">
									<div class="etc-policy-cont">
										<strong>01. 총칙</strong>
										<p>
											"개인 정보"란 살아있는 개인에 관한 정보로서 성명, 주민등록번호 및 영상 등을 통하여 개인을 알아볼 수 있는 정보 (해당 정보만으로는 특정 개인을 알아볼 수 없더라도 다른 정보와 쉽게 결합하여 알아볼 수 있는 것을 포함)를 말합니다. "정보주체"란 처리되는 정보에 의하여 알아볼 수 있는 사람으로서 그 정보의 주체가 되는 사람을 말합니다. 회사는 개인정보 처리방침을 홈페이지(http://www.dohwa.co.kr) 첫 화면에
											공개함으로써 언제나 쉽게 확인할 수 있도록 조치하고 있으며, 개인정보 처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별 공지)을 통하여 공지할 것입니다.
										</p>
										<strong>02. 개인정보의 처리 항목 및 목적</strong>
										<p>회사는 법령의 규정 또는 정보주체의 동의 없이는 정보주체의 사생활을 현저히 침해할 우려가 있는 민감정보, 개인을 고유하게 구별하기 위하여 부여된 고유식별 정보를 처리하지 않습니다.</p>
										<div class="sub-desc">
											<em>가. 처리 항목</em>
											<p>성명(국문/한자/영문), 사진, 비밀번호, 자택전화번호, 자택 주소, 본적, 휴대전화 번호, 이메일, 학력, 병역(군필 여부, 복무 기간, 군별, 계급), 어학능력, 컴퓨터 능력, 자격사항, 가족관계, 보훈 여부, 경력, 사회경험, 수상 경력, 해외 경험, 연구 경험</p>
											<em>나. 처리 목적</em>
											<ul>
												<li>- 입사전형 및 지원자와의 연락</li>
												<li>- 급여 지급, 복리후생 제공, 교육, 신용보증보험 가입 업무, 각종 업무 수행 지원 및 평가 등 인사관리</li>
											</ul>
										</div>
										<strong>03. 개인정보의 처리 및 보유기간</strong>
										<p>원칙적으로, 개인 정보의 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.</p>
										<p>다만, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보유하며 필요 시 정보주체의 동의를 받습니다.</p>
										<div class="sub-desc">
											<em>가. 채용된 입사지원자의 개인 정보</em>
											<ul> 
												<li>- 보유기간 : 영구 보유</li>
												<li>- 보유 이유 : 재직 중 인사관리 등, 퇴직 후 복리후생, 경력증명서 발급 등</li>
												<li>- 보유 항목 : 성명(국문/한자/영문), 사진, 비밀번호, 자택전화번호, 자택 주소, 휴대전화 번호, 이메일, 학력, 병역(군필 여부, 복무 기간, 군별, 계급), 어학능력, 컴퓨터 능력, 자격사항, 가족관계, 보훈 여부, 경력, 사회경험, 수상 경력, 해외 경험, 연구 경험</li>
											</ul>
											<em>나. 채용되지 아니한 입사지원자의 개인 정보</em>
											<ul>
												<li>- 보유기간 : 채용절차 종료 후 5년</li>
												<li>- 보유 이유 : 향후 채용 가능 자원의 관리</li>
												<li>- 보유 항목 : 성명(국문/한자/영문), 사진, 비밀번호, 자택전화번호, 자택 주소, 휴대전화 번호, 이메일, 학력, 병역(군필 여부, 복무 기간, 군별, 계급), 어학능력, 컴퓨터 능력, 자격사항, 가족관계, 보훈 여부, 경력, 사회경험, 수상 경력, 해외 경험, 연구 경험</li>
											</ul>
										</div>
										<strong>04. 개인정보의 파기방법</strong>
										<p>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
										<p>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</p>
										<strong>05. 개인정보의 제3자 제공</strong>
										<p>회사는 수집 목적 범위 내에서 개인 정보를 이용하며, 등 범위를 초과하여 개인 정보를 이용하거나 제3자에게 제공&middot;공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 정보주체로부터 별도의 동의를 받는 경우</li>
												<li>- 다른 법률에 특별한 규정이 있는 경우</li>
												<li>- 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
												<li>- 통계 작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 개인 정보를 제공하는 경우</li>
											</ul>
											<br />
											<p>현재 회사는 아래와 같이 개인 정보를 제공하고 있습니다.</p>
											<ul>
												<li>- 개인 정보를 제공받는 자 : 엔지니어링공제조합, LIG 보험, 서울보증보험</li>
												<li>- 제공하는 개인 정보의 항목 : 성명, 주민등록번호</li>
												<li>- 제공 정보의 이용목적 : 단체상해보험 가입 목적, 개인별 신원보증보험 가입</li>
												<li>- 제공 정보의 보유 및 이용 기간 : 즉시 파기</li>
											</ul>
										</div>
										<strong>06. 개인 정보처리의 위탁</strong>
										<p>회사는 정보주체의 동의 없이 개인 정보의 처리를 외부업체에 위탁하지 않습니다.</p>
										<p>회사는 아래와 같이 개인 정보의 처리를 위탁하고 있으며, 관련 법령에 따라 위탁 계약 시 개인 정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</p>
										<strong>07. 정보주체의 권리 의무 및 그 행사방법</strong>
										<p>모든 정보주체는 회사가 처리하는 자신의 개인 정보에 대한 열람, 정정&middot;삭제 및 처리정지를 요구할 수 있습니다.</p>
										<p>다만, 아래 사항에 해당하는 경우 회사는 위와 같은 요구를 거절하거나 제한할 수 있습니다.</p>
										<div class="sub-desc">
											<ul>
												<li>- 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우</li>
												<li>- 다른 사람의 생명&middot;신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우</li>
												<li>- 개인 정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게 밝히지 아니한 경우</li>
											</ul>
											<em>권리행사방법 및 절차</em>
											<div class="fnt14">
												<p>개인 정보의 열람 등을 원하는 정보주체는 열람&middot;정정&middot;삭제&middot;처리정지 청구서를 서면, 전자우편, 팩스 등의 방법으로 개인 정보 담당부서에 제출하실 수 있습니다. (담당 부서는 "09. 개인 정보에 민원서비스" 참조)</p>
												<p>회사는 정당한 사유가 없는 한 10일 이내에 해당 조치를 취하고, 거절 또는 제한의 사유가 있는 경우에는 5일 이내에 제한&middot;거절의 사유 및 이의 제기 방법을 알려드립니다.</p>
												<p>회사는 정보주체 또는 그의 대리인이 개인 정보의 열람 등을 청구하는 때에는 주민등록증, 운전면허증, 여권 등의 신분증명서 등을 확인하여 정보주체 본인 또는 대리인 여부를 확인할 수 있습니다.</p>
											</div>
										</div>
										<strong>08. 개인정보의기술적/관리적/물리적보호대책</strong>
										<p>회사는 개인 정보를 취급함에 있어 개인 정보가 분실, 도난, 누출 변조 또는 훼손되지 않도록 아래와 같은 안전성 확보 조치를 취하고 있습니다.</p>
										<div class="sub-desc">
											<em>&lt;기술적 조치&gt;</em>
											<ul class="fnt14">
												<li>- 개인 정보의 안전한 저장 및 전송 등을 위하여 법령이 정한 기준을 준수하고 있습니다.</li>
												<li>- 회사는 백신 프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신 프로그램은 주기적으로 업데이트되며 갑작스러운 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인 정보가 침해되는 것을 방지하고 있습니다.</li>
												<li>- 해킹 등 외부 침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석 시스템 등을 이용하여 보안에 만전을 기하고 있습니다.</li>
											</ul>
											<em>&lt;관리적 조치&gt;</em>
											<ul class="fnt14">
												<li>- 회사는 정보주체를 직접 상대로 하여 영업 및 마케팅 업무를 수행하는 자, 개인 정보관리 업무를 수행하는 자, 기타 업무상 개인 정보의 취급이 불가피한 자 등으로 개인 정보에 대한 접근 권한을 제한하고 있습니다.</li>
												<li>- 개인 정보를 취급하는 직원을 대상으로 개인 정보보호에 관한 정기적인 사내 교육 및 외부위탁교육을 실시하고 있으며, 개인 정보보호에 관한 법령을 준수하도록 철저히 관리&middot;감독하고 있습니다.</li>
											</ul>
											<em>&lt;물리적 조치&gt;</em>
											<ul class="fnt14">
												<li>- 개인 정보와 개인 정보처리시스템의 안전한 보관을 위하여 잠금장치 등의 물리적 접근 방지를 위한 보호 조치를 취하고 있습니다.</li>
												<li>- 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다.</li>
											</ul>
										</div>
										<strong>09. 개인정보에 관한 민원서비스</strong>
										<p>회사는 개인 정보를 보호하고 개인 정보와 관련된 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인 정보보호 책임자를 지정하고 있습니다.</p>
										<div class="sub-desc">
											<em>가. 개인 정보담당 부서</em>
											<ul>
												<li>- 부서 : ㈜도화엔지니어링 총무인사팀</li>
												<li>- 전화번호 : 02-6323-3000</li>
												<li>- 이메일 : insa&#64;dohwa.co.kr</li>
												<li>- 업무시간안내 : (월~금) 09:00 ~ 18:00, (토~일) 휴무</li>
											</ul>
											<em>나. 개인 정보보호 책임자</em>
											<ul>
												<li>- 이름 : 인사담당 임원</li>
												<li>- 전화번호 : 02-6323-3000</li>
												<li>- 이메일 : insa&#64;dohwa.co.kr</li>
											</ul>
											<br />
											<p>기타 개인 정보 침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
											<ul>
												<li>- 개인 정보 침해신고센터 (http://privacy.kisa.or.kr 전화번호 : 118)</li>
												<li>- 정부 보호마크 인증위원회 (http://www.eprivacy.or.kr 전화번호 : 02-580-0533~4)</li>
												<li>- 대검찰청 인터넷 범죄수사센터 (http://www.spo.go.kr 전화번호 : 02-3480-3600)</li>
												<li>- 경찰청 사이버테러대응센터 (http://www.ctrc.go.kr 전화번호 : 02-392-0330)</li>
											</ul>
										</div>
										<strong>10. 공지의무</strong>
										<p>현 개인정보 처리방침의 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 10일 전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다.</p>
										<div class="sub-desc">
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
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
		<%@ include file="/WEB-INF/views/front/layout/head.jsp" %>
		<style>
		   /* =============== 기본 타이포/유틸 =============== */
			.t_tit1{
			  font-family:'Noto Sans KR','Noto',sans-serif;
			  font-weight:500;font-size:28px;color:#222;letter-spacing:-.2px;text-align:center;
			}
			.desc_daigonal{
			  position:relative;font-family:'Noto',sans-serif;font-weight:400;font-size:18px;color:#666;
			  line-height:28px;letter-spacing:-.2px;padding-top:10px;margin-top:10px;text-align:center;
			}
			.mt-30{margin-top:30px}.mt-40{margin-top:40px}
			
			/* =============== 카드/그리드 =============== */
			.grid-2{display:grid;grid-template-columns:1fr 1fr;gap:24px;margin-bottom:22px}
			.card{border:1px solid #e3e3e3;border-radius:6px}
			.card h3{margin:0;padding:10px 12px;background:#f5f5f5;font-size:18px;font-weight:700}
			.card ul{margin:10px 16px 14px 22px;line-height:1.7}
			.card li{list-style:"- ";margin-left:8px;font-size:16px}
			
			/* =============== 감사위원회 운영(간결) =============== */
			.audit-ops{font-size:18px;line-height:1.7;color:#222}
			.audit-ops h2{font-size:22px;font-weight:700;margin-bottom:10px}
			.audit-ops .item{margin:10px 0}
			.audit-ops .title{font-weight:700}
			.audit-ops ul{list-style:none;margin:6px 0 0 10px;padding:0}
			
			/* =============== 공통 테이블 규칙(세 종류 통합) ===============
			   - 세 테이블이 공유하는 속성은 여기서 '한 번만' 정의
			   - 배경(#f1f1f1), 패딩(12px 10px)로 통일
			======================================================= */
			.committee-table,
			.tbl-audit,
			.audit-table{
			  width:100%;
			  border-collapse:collapse;
			  table-layout:fixed;
			  font-size:16px;
			}
			.committee-table caption,
			.tbl-audit caption,
			.audit-table caption{
			  caption-side:top;
			  text-align:left;
			  font-weight:800;
			  margin:8px 0;
			}
			.committee-table th, 
			.committee-table td,
			.tbl-audit th,      
			.tbl-audit td,
			.audit-table th,    
			.audit-table td{
			  border:1px solid #ddd;
			  padding:10px 10px;         /* 공통 패딩으로 통일 */
			}
			.committee-table thead th,
			.tbl-audit thead th,
			.audit-table thead th{
			  background:#f1f1f1;
			  text-align:center;
			  font-weight:700;
			}
			/* 공통 정렬 유틸(기존 .audit-table .center/.left 중복 제거) */
			.center{text-align:center}
			.left{text-align:left}
			
			/* =============== 테이블별(차이점만) =============== */
			/* 위원회 구성표(committee-table) 고유 스타일 */
			.committee-table tbody th{background:#fafafa;width:16%;text-align:center;font-weight:600}
			.committee-table td{text-align:center;font-weight:700}
			.committee-table small{display:block;font-weight:400;color:#666;}
			
			/* 감사위원회 구성표(tbl-audit) 고유 스타일 */
			.tbl-audit tbody th{background:#fafafa;width:16%;text-align:center;font-weight:600}
			.tbl-audit .name{text-align:center;line-height:1.35}
			.tbl-audit .name small{display:block;color:#666;font-weight:400;margin-top:4px}
			.tbl-audit .note{text-align:center;color:#333}
			.tbl-audit .bio p{margin:0 0 2px}
			
			/* 활동 테이블(audit-table) 고유 스타일 */
			.audit-table{margin:14px 0 26px}
			/* (열 머리 셀 너비/정렬은 HTML의 colgroup, .center/.left 유틸로 처리) */
			
			/* =============== 섹션 타이틀 =============== */
			.audit-head{margin:50px 0 8px}
			.audit-head h3{margin:0;font-size:22px;font-weight:600}
			.audit-head p{margin:12px 0 18px;font-size:18px;line-height:1.7}
		</style>
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
		<div class="invest" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual invest01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message
									code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
							<h2 class="title-main">
								<spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" />
							</h2>
							<!-- s: 20200814 추가 -->
							<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></em> --%>
							<!-- e: 20200814 추가 -->
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span> <span class="ico01"
								aria-hidden="true"></span> <span class="ico02" aria-hidden="true"></span>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
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
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
							</div>
						</div>
					</div>
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include file="/WEB-INF/views/front/layout/invest_tab_list.jsp" %>
								</ul>
							</div>
						</div>
						<!-- s: 20200903 depth3 탭 추가-->
						
						<div class="tab-menu-type02">
							<ul class="tab-list tab-list-3depth">
								<li><a class="item" href="/invest/director"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.001" text="이사회" /></span></a></li>
								<li><a class="item" href="/invest/article"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.002" text="정관" /></span></a></li>
								<li class="active"><a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.003" text="위원회" /></span></a></li>
							</ul>
						</div>
						<!-- e: 20200903 depth3 탭 추가-->
						<%--이사회 --%>
						<div class="contents clfix">
							<span class="page-decs">
								<strong>03 INVESTORS</strong>
								DOHWA ENGINEERING
							</span>
							<div class="section-cont">
								<div class="csr-cont">
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.005.003" text="위원회" /></h3>
									<div class="intro-msg">
										<div class="desc_daigonal">
											<p>이사회의 효율적인 운영과 특정 기능의 전문적인 수행을 위해 </p>
											<p>이사회 내에 분야별 전문위원회를 설치하고, 이사회의 권한 일부를 위임해 운영합니다.</p>
										</div>
									</div>
								</div>
								<div class="csr-cont">
									<h4 class="title-sub">위원회 운영</h4>
									<div class="desc-area">
										<p class="group-top">각 위원회는 효율적인 활동 수행을 위해 회사로부터 충분한 자원을 지원받으며, 위원회의 조직, 운영 및 권한 등에 대한 사항은 이사회에서 작성한 각 위원회의 명문화된 규정에 따릅니다.</p>
									</div>
								</div>
								<div class="csr-cont">
									<h4 class="title-sub">위원회 구성</h4>
									<div class="desc-area">
										<p class="group-top">이사회 내 위원회로 감사위원회와 사외이사 후보추천위원회를 설치하였으며, 현재 운영되고 있는 위원회는 사외이사 중심으로 구성되어 있으며, 구성 요건 규정을 준수하고 있습니다.</p>
									</div>
									<table class="committee-table" aria-describedby="comm-desc">
									  <caption id="comm-desc">위원회 구성 및 위원 현황</caption>
									  <colgroup>
									    <col style="width:18%">
									    <col style="width:41%">
									    <col style="width:41%">
									  </colgroup>
									
									  <thead>
									    <tr>
									      <th scope="col">구분</th>
									      <th scope="col">감사위원회</th>
									      <th scope="col">사외이사후보추천위원회</th>
									    </tr>
									  </thead>
									
									  <tbody>
									    <!-- 구성요건 -->
									    <tr>
									      <th><strong>구성요건</strong></th>
									      <td>
									        <strong>3인 이상의 이사<br>
										        사외이사가 총위원의2/3 이상<br>
									    	 의 회계/재무 전문가</strong>
									      </td>
									      <td>
									        <strong>2인 이상의 이사<br>
								        	사외이사가 총위원의 과반수 이상</strong>
									      </td>
									    </tr>
									
									    <!-- 구성원 -->
									    <tr>
									      <td class="left">
									       	 곽준상<small>사내이사</small>
									      </td>
									      <td>−</td>
									      <td>위원장</td>
									    </tr>
									
									    <tr>
									      <td class="left">
									        박영봉<small>사외이사</small>
									      </td>
									      <td>위원장</td>
									      <td>위원</td>
									    </tr>
									
									    <tr>
									      <td class="left">
									        이상진<small>사외이사</small>
									      </td>
									      <td>위원</td>
									      <td>위원</td>
									    </tr>
									
									    <tr>
									      <td class="left">
									        배보경<small>사외이사</small>
									      </td>
									      <td>위원</td>
									      <td>−</td>
									    </tr>
									  </tbody>
									</table>
								</div>
								<div class="csr-cont">
									<h4 class="title-sub">감사위원회 운영</h4>
									<section class="audit-head">
									  <h3>설치목적</h3>
									</section>
									<div class="item">
										<p>감사위원회는 견제와 균형을 통해 경영진이 궁극적으로 기업가치의 극대화를 달성할 수 있도록 감독하고 지원하기 위한 감사 기구로서,</p>
									    <p>2010년부터 설치된 이사회 산하 위원회 입니다.</p>
									</div>
									
									<section class="audit-head">
									  <h3>감사위원회 활동 내용</h3>
									</section>
									  <div class="item">
									    <ul>
									      <li>▷ 소집 시기 : 정기위원회는 분기 1회 이상 개최, 필요 시 임시위원회를 수시로 개최 가능</li>
									      <li>▷ 소집 방법 : 위원장이 소집하며 회의일 1주 전 각 감사위원에게 통지,
									          감사위원 전원 동의 시 사전통지 없이 즉시 개최 가능</li>
									      <li>▷ 결의 방법 : 재적위원 과반수 출석, 출석위원 과반수 찬성으로 의결</li>
									    </ul>
									  </div>
								</div>
								<div class="committee-tab mt-40">
									<div class="tab-menu-type03">
										<ul class="tab-list">
											<li class="active"><a>감사위원회</a></li>
											<li><a class="item" href="#none">사외이사후보추천위원회</a></li>
										</ul>
									</div>
									
									<div class="inner-tab-cont active">
										<section class="audit-head">
										  <h3>감사위원회 구성</h3>
										  <p>감사위원회는 규정상, 3인 이상의 이사 및 3분의 2 이상의 사외이사로 구성돼야 하며, 1인 이상은 회계 또는 재무전문가여야 합니다.</p>
										</section>
										
										<table class="tbl-audit" aria-label="감사위원회 구성표">
										  <colgroup>
										    <col style="width:18%">
										    <col style="width:10%">
										    <col style="width:15%">
										    <col style="width:47%">
										    <col style="width:10%">
										  </colgroup>
										  <thead>
										    <tr>
										      <th scope="col">구분</th>
										      <th scope="col">임기</th>
										      <th scope="col">임기만료일</th>
										      <th scope="col">주요 약력</th>
										      <th scope="col">비고</th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr>
										      <th scope="row" class="name">
										        박영봉<small>감사위원장</small>
										      </th>
										      <td class="center">2년</td>
										      <td class="center">2026-03-21</td>
										      <td class="bio">
										        <p>성균관대학교 경제학과</p>
										        <p>現) 대원 회계와 세무 대표 공인회계사</p>
										      </td>
										      <td class="note">회계전문가</td>
										    </tr>
										
										    <tr>
										      <th scope="row" class="name">
										        이상진<small>감사위원</small>
										      </th>
										      <td class="center">2년</td>
										      <td class="center">2026-03-21</td>
										      <td class="bio">
										        <p>이화여자대학교 국제사무학과</p>
										        <p>고려대학교 경영대 박사</p>
										        <p>現) 한미사이언스(주) 기타비상무이사</p>
										      </td>
										      <td class="note"> </td>
										    </tr>
										
										    <tr>
										      <th scope="row" class="name">
										        배보경<small>감사위원</small>
										      </th>
										      <td class="center">2.5년</td>
										      <td class="center">2026-03-21</td>
										      <td class="bio">
										        <p>American University WashingtonCollege of Law</p>
										        <p>고려대학교 법과대학원</p>
										        <p>現) 김앤장 법률사무소 변호사</p>
										      </td>
										      <td class="note"> </td>
										    </tr>
										  </tbody>
										</table>
										
										<!-- 권한 / 의무 -->
										<section class="audit-head">
										  <h3>감사위원회 권한 · 의무</h3>
										</section>
										
										<div class="grid-2 mt-30">
										  <div class="card">
										    <h3>감사위원회 권한</h3>
										    <ul>
										      <li>감사권</li>
										      <li>보고 요구권</li>
										      <li>소집청구권</li>
										      <li>법적 조치권</li>
										      <li>감사인 관련 권한</li>
										      <li>재무 관련 권한</li>
										      <li>내부통제 및 준법감시권</li>
										      <li>자회사 감사권</li>
										      <li>전문가 활용권</li>
										      <li>의견표명권</li>
										    </ul>
										  </div>
										
										  <div class="card">
										    <h3>감사위원회 의무</h3>
										    <ul>
										      <li>선관주의 의무</li>
										      <li>비밀유지 의무</li>
										      <li>위법행위 보고의무</li>
										      <li>손해배상책임</li>
										      <li>감사보고의무</li>
										      <li>내부통제 평가의무</li>
										      <li>독립성 유지의무</li>
										      <li>공정성·객관성 의무</li>
										      <li>정보교환 및 협력의무</li>
										      <li>의사록 및 감사록 작성의무</li>
										    </ul>
										  </div>
										</div>
										
										<!-- 활동 내용 -->
										<section class="audit-head">
										  <h3>감사위원회 활동 내용</h3>
										</section>
										<div>
											<!-- 2025 활동 테이블 -->
											<table class="audit-table audit-table-2025" aria-label="감사위원회 활동 2025">
											  <caption>2025</caption>
												<colgroup>
												    <col style="width:10%">
												    <col style="width:20%">
												    <col style="width:70%">
											  	</colgroup>
											  <thead>
											    <tr>
											      <th class="center">회차</th>
											      <th class="center">개최일자</th>
											      <th class="left">의안내용</th>
											    </tr>
											  </thead>
											  <tbody>
											    <tr>
											      <td class="center">1</td>
											      <td class="center">2025.01.24</td>
											      <td class="left">
											        1. 2024년 내부회계관리제도 운영실태 평가보고서 확정의 건<br>
											        2. 연간감사계획 확정의 건
											      </td>
											    </tr>
											    <tr>
											      <td class="center">2</td>
											      <td class="center">2025.02.21</td>
											      <td class="left">
											        1. 감사보고서 제출의 건<br>
											        2. 감사위원회의 감사 보고
											      </td>
											    </tr>
											    <tr>
											      <td class="center">3</td>
											      <td class="center">2025.03.27</td>
											      <td class="left">업무감사 보고의 건</td>
											    </tr>
											    <tr>
											      <td class="center">4</td>
											      <td class="center">2025.06.05</td>
											      <td class="left">업무감사 보고의 건</td>
											    </tr>
											  </tbody>
											</table>
											
											<!-- 2024 활동 테이블 -->
											<table class="audit-table audit-table-2024" aria-label="감사위원회 활동 2024">
											  <caption>2024</caption>
											  <colgroup>
												    <col style="width:10%">
												    <col style="width:20%">
												    <col style="width:70%">
											  	</colgroup>
											  <thead>
											    <tr>
											      <th class="center">회차</th>
											      <th class="center">개최일자</th>
											      <th class="left">의안내용</th>
											    </tr>
											  </thead>
											  <tbody>
											    <tr>
											      <td class="center">1</td>
											      <td class="center">2024.01.26</td>
											      <td class="left">
											        1. 2023년 내부회계관리제도 운영실태 평가보고서 확정의 건<br>
											        2. 연간감사계획 확정의 건
											      </td>
											    </tr>
											    <tr>
											      <td class="center">2</td>
											      <td class="center">2024.02.22</td>
											      <td class="left">
											        1. 감사보고서 제출의 건<br>
											        2. 감사위원회의 감사 보고
											      </td>
											    </tr>
											    <tr>
											      <td class="center">3</td>
											      <td class="center">2024.03.22</td>
											      <td class="left">업무감사 보고의 건</td>
											    </tr>
											    <tr>
											      <td class="center">4</td>
											      <td class="center">2024.07.18</td>
											      <td class="left">업무감사 보고의 건</td>
											    </tr>
											    <tr>
											      <td class="center">5</td>
											      <td class="center">2024.09.13</td>
											      <td class="left">업무감사 보고의 건</td>
											    </tr>
											    <tr>
											      <td class="center">6</td>
											      <td class="center">2024.12.20</td>
											      <td class="left">
											        1. 업무감사 보고의 건<br>
											        2. 외부감사인 선임보고의 건
											      </td>
											    </tr>
											  </tbody>
											</table>
										</div>
									</div>
									
									<!-- 사외이사후보추천위원회-->
									<div class="inner-tab-cont">
									
									<div class="intro-msg mt-40">
										<div class="desc_daigonal">
											<p>사외이사 후보추천위원회는 회사의 사외이사 후보를 추천하기 위해 구성된 이사회 내 위원회로,</p>
											<p>관련 법규에 의거하여 2025년 10월 이사회 결의를 통하여 신설하였습니다.</p>
										</div>
									</div>
									<section class="audit-head">
									  <h3>사외이사 후보추천위원회 구성</h3>
									  <p>사외이사 후보추천위원회는 2인 이상의 이사 및 과반수 이상의 사외이사로 구성되어야 하며, 회사의 사외이사 후보추천위원회는 2인의 사외이사와 1인의 사내이사로 구성되어 있습니다.</p>
									</section>
								
									<table class="tbl-audit" aria-label="사외이사 후보추천위원회 구성">
									  <colgroup>
									    <col style="width:20%">
									    <col style="width:20%">
									    <col style="width:60%">
									  </colgroup>
									  <thead>
									    <tr>
									      <th scope="col">구분</th>
									      <th scope="col">선임일</th>
									      <th scope="col">주요 약력</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <th scope="row" class="name">
									        곽준상<small>위원장</small>
									      </th>
									      <td class="center">2025-10-30</td>
									      <td class="bio">
									        <p>고려대학교 대학원 재료금속공학</p>
									        <p>現) (주)채널에이 사외이사</p>
									      </td>
									    </tr>
									
									    <tr>
									      <th scope="row" class="name">
									        박영봉<small>위원</small>
									      </th>
									      <td class="center">2025-10-30</td>
									      <td class="bio">
									        <p>성균관대학교 경제학과</p>
									        <p>現) 대원 회계와 세무 대표 공인회계사</p>
									      </td>
									    </tr>
									
									    <tr>
									      <th scope="row" class="name">
									        이상진<small>위원</small>
									      </th>
									      <td class="center">2025-10-30</td>
									      <td class="bio">
									        <p>이화여자대학교 국제사무학과</p>
									        <p>고려대학교 경영대 박사</p>
									        <p>現) 한미사이언스(주) 기타비상무이사</p>
									      </td>
									    </tr>
									  </tbody>
									</table>
									<section class="audit-head">
									  <h3>사외이사후보추천위원회 권한</h3>
									  <p>사외이사후보추천위원회는 주주총회에서 사외이사 후보의 추천권을 가지며, 추천 후보의 역량과 독립성 관련 법적 요건 준수 여부 등을 검토합니다.</p>
									</section>
									<section class="audit-head">
									  <h3>사외이사후보추천위원회 개최내역</h3>
									  <p>-</p>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp"%>
		<script type="text/javascript">
		  // 탭 (기존)
		  var component = new ComponentUI();
		  component.tabContent(".committee-tab .tab-list", ".committee-tab .inner-tab-cont");
		  
		  
		</script>
	</body>
</html>
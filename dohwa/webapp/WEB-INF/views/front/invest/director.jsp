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
		    .t_tit1{
		      font-family: 'Noto Sans KR','Noto',sans-serif;
		      font-weight: 500;
		      font-size: 28px;
		      color: #222;
		      letter-spacing: -0.2px;
		      text-align: center;
		    }
		    .desc_daigonal{
		        position: relative;
			    font-family: 'noto';
			    font-weight: 400;
			    font-size: 18px;
			    color: #666;
			    line-height: 28px;
			    letter-spacing: -0.2px;
			    padding-top: 10px;
			    margin-top: 10px;
			    text-align: center;
		    }
		    .group-top {
			  margin-top: 10px;   /* 그룹 간 한 줄 띄움 */
			  display: block;
			}
		   .group {
			  margin-bottom: 20px;   /* 그룹 간 한 줄 띄움 */
			  display: block;
			}
			.section-title{
		    	font-family: 'Noto Sans KR', sans-serif;
			    font-weight: 400;
			    font-size: 23px;
			    color: #222;
			    letter-spacing: -0.2px;
			    margin: 40px 0 16px;
			  }
			  .section-sub-title{
		    	font-family: 'Noto Sans KR', sans-serif;
			    font-weight: 400;
			    font-size: 18px;
			    color: #222;
			    letter-spacing: -0.2px;
			  }
			  .board-table{
			    width: 100%;
			    border-collapse: collapse;
			    table-layout: fixed;
			    font-family: 'Noto Sans KR', sans-serif;
			    color:#333;
			  }
			  .board-table th,
			  .board-table td{
			    border:1px solid #cfcfcf;
			    padding:12px 10px;
			    vertical-align: top;
			    line-height: 1.6;
			    word-break: keep-all;
			  }
			  .board-table th{
			    background:#f7f7f7;
			    text-align:center;
			    font-weight:600;
			  }
			  .board-table td{ font-size:14px; color:#444;}
			  .tal{ text-align:left; }
			  .tac{ text-align:center; }
			  .nowrap{ white-space:nowrap; }
			  .mt-40{ margin-top:40px; }
			  
			  :root { --bd:#e5e7eb; --bd-strong:#cbd5e1; --txt:#5D5D5D; }
			  .acc{max-width:1024px;margin-top:20px;border-top:1px solid var(--bd-strong);}
			  .acc-item{border-bottom:1px solid var(--bd);}
			  .acc-header{
			    width:100%;display:block;text-align:left;background:#fff;border:0;
			    padding:16px 44px 16px 0;font-size:20px;font-weight:700;cursor:pointer;position:relative;
			  }
			  .acc-header::after{
			    content:""; position:absolute; right:6px; top:50%; width:10px; height:10px;
			    border-right:2px solid #888; border-bottom:2px solid #888;
			    transform:translateY(-50%) rotate(45deg); transition:transform .2s ease;
			  }
			  .acc-header[aria-expanded="true"]::after{ transform:translateY(-50%) rotate(-135deg); }
			
			  /* 패널(슬라이드 애니메이션) */
			  .acc-panel{overflow:hidden;height:0;transition:height .28s ease; background:#fff;}
			  .acc-panel[hidden]{display:block;height:0;} /* hidden 유지하며 애니메이션 */
			
			  /* 패널 안 기본 여백/테두리 */
			  .panel-inner{padding:16px 0 20px;border-top:1px solid var(--bd-strong);}
			  .muted{color:#666;font-size:14px;}
			
			  /* 예시 표 스타일(원하면 삭제/수정) */
			  .table-wrap{overflow-x:auto;margin-top:8px;}
			  table.board{width:100%;min-width:760px;border-collapse:collapse;table-layout:fixed;}
			  table.board th, table.board td{border:1px solid var(--bd);padding:10px 12px;font-size:16px;vertical-align:top;}
			  table.board thead th{background:var(--head);}
			  .center{text-align:center;}
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
								<li class="active"><a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.001" text="이사회" /></span></a></li>
								<li><a class="item" href="/invest/article"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.002" text="정관" /></span></a></li>
								<li><a class="item" href="/invest/committee"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.003" text="위원회" /></span></a></li>
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
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.005.001" text="이사회" /></h3>
								<div class="director-tab">
									<div class="tab-menu-type03">
										<ul class="tab-list">
											<li class="active"><a class="item" href="#none"><spring:message code="FRONT.COMMON.MENU.INVEST.005.001.001" text="구성" /></a></li>
											<li><a class="item" href="#none"><spring:message code="FRONT.COMMON.MENU.INVEST.005.001.002" text="운영 및 부의사항" /></a></li>
										</ul>
									</div>
									<div class="inner-tab-cont active">
										<!-- 구성 -->
										<div class="content-inner">
											<div class="intro-msg">
												<div class="t_tit1">이사회</div>
												<div class="desc_daigonal">
													<p>이사회는 회사경영에 관한 포괄적인 권한을 가지며, 회사와 주주를 대표하여 모든 이해관계자들의 이익을 위해</p>
													<p>핵심 경영목표와 기본 경영방침을 결정하고, 경영진의 활동을 감독합니다.</p>
												</div>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">이사회 구성</h4>
											<div class="desc-area">
												<p class="group-top">이사회는 사내이사 7명과 사외이사 3명을 포함하여 총 10명으로 구성되어 있습니다.</p>
												<p>이사회는 효율적 운영과 전략적인 의사결정을 위하여 다양한 전문성과 배경을 갖춘 이사로 구성되었으며, 독립성이 검증된 사외이사를 통해</p>
												<p>경영진에 대한 견제 기능을 강화하였습니다.경영, 법률 재무 분야 등에서 종사한 경험이 있는 전문가를 이사로 선임하여 다양성과 전문성을 갖춘</p>
												<p>이사들이 회사를 관리 감독할 수 있도록 하고 있습니다.</p>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">이사의 선임 및 임기</h4>
											<div class="desc-area">
												<p class="group-top">이사는 주주총회에서 선임되며, 회사는 주주총회일 2주 전에 이사 후보에 대한 정보를 공시하여 주주들이 원활하게 의결권을 행사할 수 있도록 하고 있습니다.</p>
												<p>사내이사 후보는 이사회의 추천, 사외이사 후보는 사외이사 후보추천위원회의 추천을 통해 선정되며, 선임된 이사의 임기는 3년을 초과하지 못합니다.</p>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">사외이사의 독립성</h4>
											<div class="desc-area">
												<p class="group-top">상법 제382조, 제542조의8의 요건에 따라 사외이사의 「독립성」을 판단하며, 결격요건에 해당되는 경우 그 직을 상실합니다.</p>
												<p>당사 사외이사는 법령에 규정하는 기준을 충족하여 이사회의 독립성을 확보하고 있습니다.</p>
											</div>
										</div>
										
										<div class="csr-cont">
											<h4 class="title-sub">이사회 구성현황</h4>
											<div class="desc-area">
												<h2 class="section-title">사내이사</h2>
												<table class="board-table">
												  <colgroup>
												    <col style="width:9%">
												    <col style="width:6%">
												    <col style="width:13%">
												    <col style="width:6%">
												    <col style="width:7%">
												    <col style="width:12%">
												    <col style="width:12%">
												    <col style="width:auto">
												  </colgroup>
												  <thead>
												    <tr>
												      <th>성명</th>
												      <th>성별</th>
												      <th>직책</th>
												      <th>연임</th>
												      <th>임기</th>
												      <th class="nowrap">임기만료예정일</th>
												      <th>전문 분야</th>
												      <th>주요 경력</th>
												    </tr>
												  </thead>
												  <tbody>
												    <tr>
												      <td class="tac">김영윤</td>
												      <td class="tac">남</td>
												      <td class="tac">사내이사/회장/의장</td>
												      <td class="tac">여</td>
												      <td class="tac">3년</td>
												      <td class="tac">2028-03-26</td>
												      <td class="tac">경영지원</td>
												      <td class="tal">서울대학교 토목공학<br>現 (주)도화엔지니어링 이사회 의장</td>
												    </tr>
												    <tr>
												      <td class="tac">박승우</td>
												      <td class="tac">남</td>
												      <td class="tac">대표이사/회장</td>
												      <td class="tac">여</td>
												      <td class="tac">3년</td>
												      <td class="tac">2027-03-21</td>
												      <td class="tac">경영지원</td>
												      <td class="tal">고려대학교 토목공학<br>現 (주)도화엔지니어링 대표이사</td>
												    </tr>
												    <tr>
												      <td class="tac">곽준상</td>
												      <td class="tac">남</td>
												      <td class="tac">대표이사/부회장</td>
												      <td class="tac">여</td>
												      <td class="tac">3년</td>
												      <td class="tac">2026-03-23</td>
												      <td class="tac">경영지원</td>
												      <td class="tal">고려대학교(대학원) 재료금속공학<br>現) (주)채널에이 사외이사</td>
												    </tr>
												    <tr>
												      <td class="tac">손영일</td>
												      <td class="tac">남</td>
												      <td class="tac">대표이사/사장</td>
												      <td class="tac">부</td>
												      <td class="tac">3년</td>
												      <td class="tac">2026-03-23</td>
												      <td class="tac">경영지원</td>
												      <td class="tal">연세대학교 토목공학<br>現 (주)도화엔지니어링 사장</td>
												    </tr>
												    <tr>
												      <td class="tac">김덕구</td>
												      <td class="tac">남</td>
												      <td class="tac">대표이사/사장</td>
												      <td class="tac">부</td>
												      <td class="tac">3년</td>
												      <td class="tac">2027-03-21</td>
												      <td class="tac">CM부문</td>
												      <td class="tal">고려대학교 대학원 사회환경시스템공학과<br>現 (주)도화엔지니어링 사장</td>
												    </tr>
												    <tr>
												      <td class="tac">김용구</td>
												      <td class="tac">남</td>
												      <td class="tac">사내이사/사장</td>
												      <td class="tac">부</td>
												      <td class="tac">3년</td>
												      <td class="tac">2026-03-23</td>
												      <td class="tac">지원부문</td>
												      <td class="tal">인하대학교 대학원 토질 및 기초공학<br>現 (주)도화엔지니어링 사장</td>
												    </tr>
												    <tr>
												      <td class="tac">정수동</td>
												      <td class="tac">남</td>
												      <td class="tac">사내이사/사장</td>
												      <td class="tac">부</td>
												      <td class="tac">3년</td>
												      <td class="tac">2026-03-23</td>
												      <td class="tac">교통부문</td>
												      <td class="tal">인하대학교 대학원 기계구조<br>現 (주)도화엔지니어링 사장</td>
												    </tr>
												  </tbody>
												</table>
												
												<h2 class="section-title mt-40">사외이사</h2>
												<table class="board-table">
												  <colgroup>
												    <col style="width:9%">
												    <col style="width:6%">
												    <col style="width:18%">
												    <col style="width:6%">
												    <col style="width:6%">
												    <col style="width:12%">
												    <col style="width:12%">
												    <col style="width:auto">
												  </colgroup>
												  <thead>
												    <tr>
												      <th>성명</th>
												      <th>성별</th>
												      <th>직책</th>
												      <th>연임</th>
												      <th>임기</th>
												      <th class="nowrap">임기만료예정일</th>
												      <th>전문 분야</th>
												      <th>주요 경력</th>
												    </tr>
												  </thead>
												  <tbody>
												    <tr>
												      <td class="tac">박영봉</td>
												      <td class="tac">남</td>
												      <td class="tac">사외이사/감사위원회 위원장</td>
												      <td class="tac">여</td>
												      <td class="tac">2</td>
												      <td class="tac">2026-03-21</td>
												      <td class="tac">회계</td>
												      <td class="tal">성균관대학교 경제학과<br>現) 대원 회계와 세무 대표 공인회계사</td>
												    </tr>
												    <tr>
												      <td class="tac">배보경</td>
												      <td class="tac">여</td>
												      <td class="tac">사외이사/감사위원회 위원</td>
												      <td class="tac">여</td>
												      <td class="tac">2</td>
												      <td class="tac">2026-03-21</td>
												      <td class="tac">기업경영</td>
												      <td class="tal">이화여자대학교 국제사무학과<br>고려대학교 경영학 박사<br>現) 한미사이언스(주) 기타비상무이사</td>
												    </tr>
												    <tr>
												      <td class="tac">이상진</td>
												      <td class="tac">남</td>
												      <td class="tac">사외이사/감사위원회 위원</td>
												      <td class="tac">부</td>
												      <td class="tac">2.5</td>
												      <td class="tac">2026-03-21</td>
												      <td class="tac">법률</td>
												      <td class="tal">American University WashingtonCollege of Law<br>고려대학교 법과대학원<br>現) 김앤장 법률사무소 변호사</td>
												    </tr>
												  </tbody>
												</table>
											</div>
										</div>
									</div>
									
									<div class="inner-tab-cont">
									<!-- 운영 및 부의사항 -->
										<div class="csr-cont">
											<h4 class="title-sub">이사회 운영</h4>
											<div class="desc-area">
												<p class="group-top">이사회는 분기별 1회 개최되는 정기 이사회와, 필요에 따라 개최되는 임시 이사회로 운영되며 이사회 규정을 마련하여,</p>
												<p>매 회의마다 의사록을 작성하여 보존하고 있습니다.</p>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">이사회 소집</h4>
											<div class="desc-area">
												<p class="group-top">이사회를 소집함에는 의장이 회의일 1주일 전까지 통지하며, 이사의 전원의 동의가 있을 때에는 소집 절차를 생략할 수 있습니다.</p>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">결의방법</h4>
											<div class="desc-area">
												<p class="group-top">이사회의 결의는 이사 과반수의 출석과 출석이사의 과반수로 한다. 다만 상법 제397조의2(회사기회유용금지)</p>
												<p class="group">및 제398조(자기거래금지)에 해당하는 사안에 대한 이사회 결의는 이사 3분의2이상의 수로 합니다.</p>
												<p>이사회는 이사의 전부 또는 일부가 직접 회의에 출석하지 아니하고 모든 이사가 음성을 동시에 송․수신하는 통신수단에</p>
												<p>의하여 결의에 참가하는 것을 허용할 수 있다. 이 경우 당해 이사는 이사회에 직접 출석한 것으로 봅니다.</p>
												<p>이사회의 결의에 관하여 특별한 이해관계가 있는 자는 의결권을 행사하지 못하며, 이 경우 의결권을 행사할 수 없는</p>
												<p>이사의 수는 출석한 이사의 수에 산입하지 않습니다.</p>
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">이사회의 결정사항</h4>
											<div class="acc" id="accordion">
											  <!-- 1. 주주총회에 관한 사항 -->
											  <section class="acc-item">
											    <button class="acc-header" id="hdr-a1" aria-expanded="false" aria-controls="panel-a1">1. 주주총회에 관한 사항</button>
											    <div class="acc-panel" id="panel-a1" role="region" aria-labelledby="hdr-a1" hidden>
											      <div class="panel-inner">
											        <p>(1) 주주총회의 소집</p>
											        <p>(2) 영업보고서의 승인</p>
											        <p>(3) 재무제표의 승인</p>
											        <p>(4) 정관의 변경</p>
											        <p>(5) 자본의 감소</p>
											        <p>(6) 회사의 해산, 합병, 분할합병, 회사의 계속</p>
											        <p>(7) 주식의 소각</p>
											        <p>(8) 회사의 영업 전부 또는 중요한 일부의 양도 및 다른 회사의 영업 전부의 양수</p>
											        <p>(9) 영업 전부의 임대 또는 경영위임, 타인과 영업의 손익 전부를 같이하는 계약, 기타 이에 준할 계약의 체결이나 변경 또는 해약</p>
											        <p>(10) 이사의 선임 및 해임</p>
											        <p>(11) 주식의 액면미달발행</p>
											        <p>(12) 이사의 회사에 대한 책임의 면제</p>
											        <p>(13) 주식배당 결정</p>
											        <p>(14) 주식매수선택권의 부여</p>
											        <p>(15) 이사의 보수</p>
											        <p>(16) 회사의 최대주주(그의 특수관계인을 포함함) 및 특수관계인과의 거래의 승인 및 주주총회에의 보고</p>
											        <p>(17) 기타 주주총회에 부의할 의안</p>
											      </div>
											    </div>
											  </section>
											
											  <!-- 2. 경영에 관한 사항 -->
											  <section class="acc-item">
											    <button class="acc-header" id="hdr-a2" aria-expanded="false" aria-controls="panel-a2">2. 경영에 관한 사항</button>
											    <div class="acc-panel" id="panel-a2" role="region" aria-labelledby="hdr-a2" hidden>
											      <div class="panel-inner">
											       	<p>(1) 회사경영의 기본방침의 결정 및 변경</p>
													<p>(2) 신규사업 또는 신제품의 개발</p>
													<p>(3) 자금계획 및 예산운용</p>
													<p>(4) 대표이사의 선임 및 해임</p>
													<p>(5) 공동대표의 결정</p>
													<p>(7) 이사회 내 위원회의 설치, 운영 및 폐지</p>
													<p>(8) 이사회 내 위원회의 선임 및 해임</p>
													<p>(9) 이사회 내 위원회의 결의사항에 대한 재결의. 단 감사위원회 결의에 대하여는 그러하지 아니함.</p>
													<p>(10) 이사의 전문가 조력의 결정</p>
													<p>(11) 지배인의 선임 및 해임</p>
													<p>(11-2) 준법지원인의 선임 및 해임, 준법통제기준의 제․개정 및 폐지</p>
													<p>(12) 직원의 채용계획 및 훈련의 기본방침</p>
													<p>(13) 급여체계, 상여 및 후생제도</p>
													<p>(14) 노조정책에 관한 중요사항</p>
													<p>(15) 기본조직의 제정 및 개폐</p>
													<p>(16) 사규, 사칙의 규정 및 개폐</p>
													<p>(17) 지점, 공장, 사무소, 사업장의 설치‧이전 또는 폐지</p>
													<p>(18) 간이합병, 간이분할합병, 소규모합병 및 소규모분할합병의 결정</p>
													<p>(19) 흡수합병 또는 신설합병의 보고</p>
											      </div>
											    </div>
											  </section>
											
											  <!-- 3. 재무에 관한 사항 -->
											  <section class="acc-item">
											    <button class="acc-header" id="hdr-a3" aria-expanded="false" aria-controls="panel-a3">3. 재무에 관한 사항</button>
											    <div class="acc-panel" id="panel-a3" role="region" aria-labelledby="hdr-a3" hidden>
											      <div class="panel-inner">
											        <p>(1) 최근 사업연도말 별도재무제표상 자기자본 1%이상의 타법인출자 및 처분 등</p>
													<p>(1-1) 누적 금액이 최근 사업연도말 별도재무제표상 자기자본 1% 이상의 타법인출자 및 처분 등</p>
													<p>(2) 중요한 계약의 체결</p>
													<p>(3) 최근 사업연도말 별도재무제표상 자산총액 1%이상의 자산취득 및 처분 등</p>
													<p>(4) 결손의 처분</p>
													<p>(5) 중요시설의 신설 및 개폐</p>
													<p>(6) 신주의 발행</p>
													<p>(7) 사채의 모집</p>
													<p>(8) 준비금의 자본전입</p>
													<p>(9) 전환사채의 발행</p>
													<p>(10) 신주인수권부사채의 발행</p>
													<p>(11)-1 최근 사업연도말 별도재무제표상 자기자본 1% 이상의 자금 차입 등</p>
													<p>(11)-2 최근 사업연도말 별도재무제표상 자기자본 1% 이상의 담보제공, 채무보증, 채무인수 및 채무면제, 신용공여 등</p>
													<p>(11)-3 누적 금액이 최근 사업연도말 별도재무제표상 자기자본 1% 이상의 담보제공, 채무보증, 채무인수 및 채무면제, 신용공여 등</p>
													<p>(12) 최근 사업연도말 별도재무제표상 자기자본 1% 이상에 해당하는 중요한 재산에 대한 저당권, 담보제공, 질권의 설정 등</p>
													<p>(13)-1 최근 사업연도말 별도재무제표상 자기자본 1%이상의 자금대여 등</p>
													<p>(13)-2 대여가 출자로 전환되는 등 계약에 중대한 조건이 변경되는 경우</p>
													<p>(13)-3 누적 금액이 최근 사업연도말 별도재무제표상 자기자본 1% 이상의 자금대여 등</p>
													<p>(14) 기승인된 투자사업 또는 PROJECT에 대해 별도재무제표상 자기자본 1%이상의 추가적으로 소요되는 자금과 관련한 사항</p>
													<p>(15) 경영지배권을 갖게 되는 자회사 설립, 자회사의 대표이사, 등기임원의 선임, 해임. 단, 자회사의 등기임원 선임시 임기는 선임일로부터 3년 이내로 한다.</p>
													<p>(16) 최대 출자자로 참여하는 투자사업</p>
													<p>(17) 기타 재무에 관한 중요한 사항</p>
											      </div>
											    </div>
											  </section>
											
											  <!-- 4. 이사에 관한 사항 -->
											  <section class="acc-item">
											    <button class="acc-header" id="hdr-a4" aria-expanded="false" aria-controls="panel-a4">4. 이사에 관한 사항</button>
											    <div class="acc-panel" id="panel-a4" role="region" aria-labelledby="hdr-a4" hidden>
											      <div class="panel-inner">
											        <!-- 여기에 내용 -->
											        <p>(1) 이사와 회사간 거래의 승인</p>
											        <p>(2) 타회사의 임원 겸임</p>
											      </div>
											    </div>
											  </section>
											
											  <!-- 5. 기타 -->
											  <section class="acc-item">
											    <button class="acc-header" id="hdr-a5" aria-expanded="false" aria-controls="panel-a5">5. 기타</button>
											    <div class="acc-panel" id="panel-a5" role="region" aria-labelledby="hdr-a5" hidden>
											      <div class="panel-inner">
											        <!-- 여기에 내용 -->
											        <p>(1) 중요한 소송의 제기</p>
													<p>(2) 주식매수선택권 부여의 취소</p>
													<p>(3) 종속회사의 자산총액, 자기자본, 부채총액 중 하나 이상이 지배회사의 최근사업연도 연결재무제표 기준 자기자본 1% 이상 변경</p>
													<p>(4) 기타 법령 또는 정관에 정하여진 사항, 주주총회에서 위임받은 사항 및 대표이사가 필요하다고 인정하는 사항</p>
													<p>② 이사회에 보고할 사항은 다음과 같다.</p>
													<p>1. 이사회 내 위원회에 위임한 사항의 처리결과</p>
													<p>2. 이사가 법령 또는 정관에 위반한 행위를 하거나 그 행위를 할 염려가 있다고 감사위원회가 인정한 사항</p>
													<p>3. 기타 경영상 중요한 업무집행에 관한 사항</p>
											      </div>
											    </div>
											  </section>
											
											</div>
										</div>
										<div class="csr-cont">
											<h4 class="title-sub">이사회 활동내역</h4>
											<div class="acc board-activity-acc">
											    <section class="acc-item">
												  <button class="acc-header" id="hdr-board-2025" aria-expanded="false" aria-controls="panel-board-2025">
												    2025
												  </button>
												  <div class="acc-panel" id="panel-board-2025" role="region" aria-labelledby="hdr-board-2025" hidden>
												    <div class="panel-inner">
												      <div class="table-wrap">
												        <table class="board">
												          <colgroup>
												            <col style="width:6%;">   <!-- 회차 -->
												            <col style="width:12%;">  <!-- 개최일자 -->
												            <col style="width:56%;">  <!-- 의안내용 -->
												            <col style="width:12%;">  <!-- 가결여부 -->
												            <col style="width:14%;">  <!-- 사외이사 참석현황 -->
												          </colgroup>
												          <thead>
												            <tr>
												              <th>회차</th>
												              <th>개최일자</th>
												              <th>의안내용</th>
												              <th>가결여부</th>
												              <th>사외이사 참석현황</th>
												            </tr>
												          </thead>
												          <tbody>
												            <!-- 1회 -->
												            <tr>
												              <td class="center">1</td>
												              <td class="center">2025.01.24</td>
												              <td>
												                1. 재무제표 연결재무제표 승인의 건<br>
												                2. 영업보고서 승인의 건<br>
												                3. 임직원 성과급 지급의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">2/3</td>
												            </tr>
												
												            <!-- 2회 -->
												            <tr>
												              <td class="center">2</td>
												              <td class="center">2025.02.11</td>
												              <td>
												                1. 재무제표 연결재무제표 재승인의 건<br>
												                2. 영업보고서 재승인의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">0/3</td>
												            </tr>
												
												            <!-- 3회 -->
												            <tr>
												              <td class="center">3</td>
												              <td class="center">2025.02.21</td>
												              <td>
												                1. 제63기 정기주주총회 소집 승인의 건<br>
												                2. 사내이사 후보 추천 승인의 건<br>
												                3. 현금배당액 결정 의 건<br>
												                4. 전자투표제도 도입 의 건<br>
												                5. 컴플라이언스 개선, 수립 보고 및 승인의 건<br>
												                6. 하자보수 보증의 건<br>
												                7. 방글라데시 지사장 변경의 건<br>
												                8. 탄자니아 지사장 변경의 건<br>
												              </td>
												              <td class="center">가결</td>
												              <td class="center">3/3</td>
												            </tr>
												
												            <!-- 4회 -->
												            <tr>
												              <td class="center">4</td>
												              <td class="center">2025.03.27</td>
												              <td>
												               	1. 금전 차입의 건
												                2. 폴란드 자회사 도화 폴스카의 금전 대여 연장에 관한 건<br>
												                3. 폴란드 자회사 도화 폴스카의 출자에 관한 건<br>
												                4. 윤리경영책임자(부패방지책임자) 선임의 건<br>
												                5. 캄보디아 지사(Branch Office) 설립의 건<br>
												                6. 영덕동대산 풍력발전㈜ 법인장 변경의 건<br>
												              </td>
												              <td class="center">가결</td>
												              <td class="center">3/3</td>
												            </tr>
												
												            <!-- 5회 -->
												            <tr>
												              <td class="center">5</td>
												              <td class="center">2025.05.07</td>
												              <td>
												                1. 자회사(DHJ)의 타법인 주식 취득의 건(슈키, 키츠키1)<br>
												                2. 자회사(DHJ)의 채무보증의 건(DHJ → 신한은행)
												                3. 채무보증의 건(도화 → DHJ)<br>
												                4. 자회사(DHJ)의 대표이사 변경의 건<br>
												                5. 자회사(DHJ)의 본점 소재지 변경의 건<br>
												                6. 자회사(DHJ)의 유상증자의 건<br>
												                7. 자회사(DRD)의 금전 대여에 관한 건<br>
												                8. 자회사(DRD)의 채무보증에 관한 건(도화 → DRD)<br>
												                9. 사규 개정의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">3/3</td>
												            </tr>
												
												            <!-- 6회 -->
												            <tr>
												              <td class="center">6</td>
												              <td class="center">2025.06.05</td>
												              <td>
												                1. 루마니아 지사(Branch Office)설립 및 지사장 선임의 건<br>
												                2. 우크라이나 대표사무소(Representative Office)설립 및 소장 선임의 건<br>
												                3. 스리랑카 지사의 계좌 동결 조치 철회, 지사장 및 주소 변경의 건<br>
												                4. 페루 지사장 변경의 건<br>
												                5. 도화 폴스카 기업구조 변경의 건<br>
												                6. 외화 지급보증 한도 설정의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">3/3</td>
												            </tr>
												
												            <!-- 7회 -->
												            <tr>
												              <td class="center">7</td>
												              <td class="center">2025.07.23</td>
												              <td>
												                1. 폴란드 자회사 도화 폴스카의 금전 대여에 관한 건<br>
												                2. 폴란드 자회사 도화 폴스카의 금전 대여 연장에 관한 건<br>
												                3. 외화 지급보증 한도 재약정의 건<br>
												                4. 일본 키츠키1, 슈키 태양광 사업시행법인 주소 변경의 건<br>
												                5. 케냐 유한회사(LLP) 설립의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">2/3</td>
												            </tr>
												
												            <!-- 8회 -->
												            <tr>
												              <td class="center">8</td>
												              <td class="center">2025.08.21</td>
												              <td>
												                1. 우간다 지사장 및 지사 주소 변경의 건<br>
												                2. 사규 개정에 관한 건<br>
												                3. 외화 지급보증 한도 연장의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">2/3</td>
												            </tr>
												
												            <!-- 9회 -->
												            <tr>
												              <td class="center">9</td>
												              <td class="center">2025.09.24</td>
												              <td>
												                1. 자회사의 금전 대여에 관한 건<br>
												                2. 채무보증 결정의 건<br>
												                3. 하자보수 보증금 변경의 건
												              </td>
												              <td class="center">가결</td>
												              <td class="center">2/3</td>
												            </tr>
												
												          </tbody>
												        </table>
												      </div>
												    </div>
												  </div>
												</section>
											</div>
										</div>
										
										<!-- 외부감사인 -->
										<div class="csr-cont">
											<h4 class="title-sub">외부감사인</h4>
											 <div class="panel-inner">
												<p>외부감사인은 관련 법령에 따라 감사위원회에서 선임되며, 회사와 경영진 및 주주 등으로부터</p>
												<p>독립적인 입장에서 공정하게 감사업무를 수행하고 있습니다.</p>
											</div>
										</div>
										<div class="table-wrap">
										  <table class="board">
										    <colgroup>
										      <col style="width:15%"> <!-- 사업연도 -->
										      <col style="width:35%"> <!-- 감사인 -->
										      <col style="width:25%"> <!-- 감사의견 -->
										      <col style="width:25%"> <!-- 비고 -->
										    </colgroup>
										    <thead>
										      <tr>
										        <th class="center">사업연도</th>
										        <th class="center">감사인</th>
										        <th class="center">감사의견</th>
										        <th class="center">비고</th>
										      </tr>
										    </thead>
										    <tbody>
										      <tr>
										        <td class="center">2025</td>
										        <td class="center">삼정회계법인</td>
										        <td class="center">-</td>
										        <td class="center">-</td>
										      </tr>
										      <tr>
										        <td class="center">2024</td>
										        <td class="center">대주회계법인</td>
										        <td class="center">적정</td>
										        <td class="center">-</td>
										      </tr>
										      <tr>
										        <td class="center">2023</td>
										        <td class="center">대주회계법인</td>
										        <td class="center">적정</td>
										        <td class="center">-</td>
										      </tr>
										      <tr>
										        <td class="center">2022</td>
										        <td class="center">대주회계법인</td>
										        <td class="center">적정</td>
										        <td class="center">-</td>
										      </tr>
										    </tbody>
										  </table>
										</div>		
										<!-- 외부감사인 -->					
									</div>
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
		  component.tabContent(".director-tab .tab-list", ".director-tab .inner-tab-cont");
		
		  // 아코디언: 같은 .acc 그룹 내에서 하나만 열리고,
		  // 열고 닫힐 때 부드러운 애니메이션 적용
		  (function () {
		    var TRANSITION = 'height 0.45s cubic-bezier(0.25, 0.1, 0.25, 1)'; // 느리고 자연스럽게
		
		    document.querySelectorAll('.acc').forEach(function (accEl) {
		      var headers = accEl.querySelectorAll('.acc-header');
		
		      headers.forEach(function (h) {
		        var panelId = h.getAttribute('aria-controls');
		        var panel = document.getElementById(panelId);
		        if (!panel) return;
		
		        // 패널에 트랜지션 설정 (중복 설정해도 문제 없음)
		        panel.style.overflow = 'hidden';
		        panel.style.transition = TRANSITION;
		
		        h.addEventListener('click', function () {
		          var isExpanded = h.getAttribute('aria-expanded') === 'true';
		
		          // 1) 같은 .acc 안의 다른 패널들은 모두 닫기
		          headers.forEach(function (otherH) {
		            if (otherH === h) return;
		
		            var otherPanel = document.getElementById(otherH.getAttribute('aria-controls'));
		            if (!otherPanel) return;
		
		            otherH.setAttribute('aria-expanded', 'false');
		            // 부드럽게 닫기
		            if (!otherPanel.hidden) {
		              otherPanel.style.height = otherPanel.scrollHeight + 'px';
		              requestAnimationFrame(function () {
		                otherPanel.style.height = '0px';
		              });
		              otherPanel.addEventListener('transitionend', function end() {
		                otherPanel.hidden = true;
		                otherPanel.style.height = '';
		                otherPanel.removeEventListener('transitionend', end);
		              });
		            } else {
		              otherPanel.hidden = true;
		              otherPanel.style.height = '';
		            }
		          });
		
		          // 2) 클릭한 패널 토글
		          if (isExpanded) {
		            // 닫기
		            h.setAttribute('aria-expanded', 'false');
		            panel.style.height = panel.scrollHeight + 'px';
		            requestAnimationFrame(function () {
		              panel.style.height = '0px';
		            });
		            panel.addEventListener('transitionend', function end() {
		              panel.hidden = true;
		              panel.style.height = '';
		              panel.removeEventListener('transitionend', end);
		            });
		          } else {
		            // 열기
		            h.setAttribute('aria-expanded', 'true');
		            panel.hidden = false;
		            // 0에서 시작해서 실제 높이까지 부드럽게
		            panel.style.height = '0px';
		            requestAnimationFrame(function () {
		              panel.style.height = panel.scrollHeight + 'px';
		            });
		            panel.addEventListener('transitionend', function end() {
		              panel.style.height = 'auto'; // 열려있을 때는 auto로 전환
		              panel.removeEventListener('transitionend', end);
		            });
		          }
		        });
		      });
		    });
		  })();
		</script>
	</body>
</html>
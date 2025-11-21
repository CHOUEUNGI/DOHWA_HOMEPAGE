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
		 body {
		    font-family: "Noto Sans KR", sans-serif;
		    margin: 40px;
		    color: #222;
		  }
		
		  /* 상단 탭 네비게이션 (가로형) */
		  .tab-wrap {
		    max-width: 1200px;
		    margin: 0 auto;
		  }
		
		  .tab-nav {
		    display: flex;
		    justify-content: center; /* 중앙 정렬 */
		    align-items: center;
		    gap: 36px;
		    list-style: none;
		    padding: 0 0 16px;
		    margin: 0 0 30px;
		    border-bottom: 2px solid #e5e5e5;
		    flex-wrap: wrap;
		  }
		
		  .tab-nav li {
		    margin: 0;
		  }
		
		  .tab-nav button {
		    border: none;
		    background: none;
		    font-size: 18px;
		    cursor: pointer;
		    color: #444;
		    position: relative;
		    padding: 8px 0;
		  }
		
		  .tab-nav button span {
		    border-bottom: 3px solid transparent;
		    padding-bottom: 4px;
		    display: inline-block;
		  }
		
		  .tab-nav button.active span {
		    color: #0b7a4b;
		    font-weight: 700;
		    border-color: #0b7a4b; /* 활성 탭 밑줄 */
		  }
		
		  /* 탭 콘텐츠 영역 */
		  .tab-content {
		    display: none;
		    padding-top: 20px;
		  }
		  .tab-content.active {
		    display: block;
		  }
		
		  .chapter-title {
		    font-size: 26px;
		    font-weight: 800;
		    margin-bottom: 18px;
		  }
		
		  /* 아코디언 스타일 (기존 동일) */
		  .acc {
		    border-top: 1px solid #222;
		  }
		  .acc-item {
		    border-bottom: 1px solid #eee;
		  }
		  .acc-header {
		    width: 100%;
		    text-align: left;
		    padding: 16px 40px 16px 0;
		    font-size: 18px;
		    border: 0;
		    background: #fff;
		    cursor: pointer;
		    position: relative;
		  }
		  .acc-header::after {
		    content: "";
		    position: absolute;
		    right: 8px;
		    top: 50%;
		    width: 9px;
		    height: 9px;
		    border-right: 2px solid #999;
		    border-bottom: 2px solid #999;
		    transform: translateY(-50%) rotate(45deg);
		    transition: transform 0.2s ease;
		  }
		  .acc-header[aria-expanded="true"]::after {
		    transform: translateY(-50%) rotate(-135deg);
		  }
		
		  .acc-panel {
		    overflow: hidden;
		    height: 0;
		    transition: height 0.25s ease;
		    background: #fff;
		  }
		  .acc-panel[hidden] {
		    display: block;
		    height: 0;
		  }
		
		  .panel-inner {
		    padding: 12px 0 18px;
		    border-top: 1px solid #eee;
		    font-size: 15px;
		    line-height: 1.7;
		    color: #444;
		  }
		
		  .panel-inner p {
		    margin: 0 0 6px;
		  }
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
								<li class="active"><a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005.002" text="정관" /></span></a></li>
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
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.005.002" text="정관" /></h3>
								<div class="tab-wrap">
								  <!-- 가로형 탭 -->
								  <ul class="tab-nav" role="tablist">
								    <li><button class="active" data-target="tab-ch1"><span>제1장 총칙</span></button></li>
								    <li><button data-target="tab-ch2"><span>제2장 주식</span></button></li>
								    <li><button data-target="tab-ch3"><span>제3장 사채</span></button></li>
								    <li><button data-target="tab-ch4"><span>제4장 주주총회</span></button></li>
								    <li><button data-target="tab-ch5"><span>제5장 이사 및 이사회</span></button></li>
								    <li><button data-target="tab-ch6"><span>제6장 감사위원회</span></button></li>
								    <li><button data-target="tab-ch7"><span>제7장 계산</span></button></li>
								    <li><button data-target="tab-add"><span>부칙</span></button></li>
								  </ul>
								
								  <!-- 각 장 콘텐츠 -->
								  <div id="tab-ch1" class="tab-content active">
								    <div class="chapter-title">총칙</div>
								    <div class="acc">
								      <section class="acc-item">
								        <button class="acc-header" aria-expanded="false" aria-controls="art1">제1조 (상호)</button>
								        <div class="acc-panel" id="art1" hidden>
								          <div class="panel-inner">
								            <p>이 회사는 주식회사 도화엔지니어링이라 한다. 영문으로는 DOHWA ENGINEERING Co., Ltd.라 표기한다.</p>
								          </div>
								        </div>
								      </section>
								      <section class="acc-item">
								        <button class="acc-header" aria-expanded="false" aria-controls="art2">제2조 (목적)</button>
								        <div class="acc-panel" id="art2" hidden>
								          <div class="panel-inner">
								            <p>이 회사는 다음의 사업을 영위함을 목적으로 한다.</p>
											<p>1. 토목, 건축, 산업설비, 조경 및 환경관련사업 등에 관한 기획, 타당성조사, 설계, 분석, 구매, 조달, 시험, 감리, 시운전, 평가, 자문, 지도 및 기타 엔지니어링기술진흥법에 의거한 사업일체</p>
											<p>2. 건설엔지니어링업(토목, 건축, 설비)</p>
											<p>3. 설계감리업</p>
											<p>4. 건설사업관리업</p>
											<p>5. 건설업(토목, 건축, 산업환경설비, 조경 공사업)</p>
											<p>6. 소방시설 설계업 및 소방공사 감리업</p>
											<p>7. 전력시설물의 종합설계 및 종합감리업</p>
											<p>8. 환경영향평가업, 교통영향평가대행자, 방재관리대책대행자</p>
											<p>9. 방재안전대책수립대행업</p>
											<p>10. 환경컨설팅업</p>
											<p>11. 환경전문공사업(대기, 수질, 소음진동)</p>
											<p>12. 플랜트 및 각종 설비의 설계, 철거설계, 제작, 설치, 감리, 시운전, 판매 및 운영업</p>
											<p>13. 폐기물처리시설(매립시설, 소각시설, 재활용시설, 기타처리관련시설 등), 가축분뇨처리시설, 개인하수처리시설, 하∙폐수종말처리시설 및 완충저류시설 등 각종 환경시설에 대한 설계, 시공, 운영 및 관리에 관한 일체의 사업</p>
											<p>14. 측량업(측지측량업, 공공측량업, 일반측량업, 연안조사측량업, 항공사진촬영업, 항공사진도화업, 수치지도제작업, 지도제작업, 지하시설물측량업, 지적측량업)</p>
											<p>15. 시설물 안전진단업 및 성능평가업</p>
											<p>16. 군납(설계엔지니어링, 감리업, 건설업, 측량업)</p>
											<p>17. 해외건설업(종합건설업(토목건축, 산업환경설비공사업), 건설엔지니어링업, 환경전문공사업, 전기공사업, 정보통신공사업) 및 해외 건설 엔지니어링</p>
											<p>18. 기술의 해외진출을 위한 시장개발</p>
											<p>19. 해외기술의 알선, 보급사업</p>
											<p>20. 무역(대리)업, 수출입업, 산업설비 수출입업</p>
											<p>21. 지하수영향 조사업</p>
											<p>22. 토양정화업 및 지하수정화업</p>
											<p>23. 보링 및 그라우팅 공사업</p>
											<p>24. 에너지 사용계획 수립대행업</p>
											<p>25. 에너지 절약전문기업(ESCO)</p>
											<p>26. 신∙재생 에너지 사업</p>
											<p>27. 국내외 자원 및 에너지개발사업</p>
											<p>28. 정보통신 공사업(조사, 설계, 시공, 감리, 사업관리 및 유지관리 등)</p>
											<p>29. 시스템 통합사업</p>
											<p>30. 소프트웨어 수탁개발사업</p>
											<p>31. 패키지 소프트웨어 개발 및 공급사업</p>
											<p>32. 정보시스템구축 및 정보기술 컨설팅사업</p>
											<p>33. 정보시스템 감리사업</p>
											<p>34. 정보시스템 품질측정 및 평가사업</p>
											<p>35. 정보기술관련 교육훈련서비스 및 서적출판업</p>
											<p>36. 데이터베이스 구축 및 운영사업</p>
											<p>37. 하드웨어 및 소프트웨어 유통 및 임대사업</p>
											<p>38. 인터넷 컨텐츠 개발, 제공사업 및 포탈사이트 운영업</p>
											<p>39. 인터넷 기타서비스사업(게임, 복권, 광고 등)</p>
											<p>40. 지능형 교통정보시스템관련 자문 및 개발사업</p>
											<p>41. 위치정보시스템 관련 자문, 개발, 운영업</p>
											<p>42. 부동산 매매, 임대 및 시설물 운영관리에 관한 사업</p>
											<p>43. 주택, 상가업 사무실, 오피스텔 등 제 건물의 건설, 매매, 임대 및 운영 관리업</p>
											<p>44. 시설물 유지 관리업</p>
											<p>45. 주택건설, 대지조성업</p>
											<p>46. 종합 레저사업</p>
											<p>47. 체육시설의 설치 및 운영업</p>
											<p>48. 사회 간접자본 시설투자 및 운영업</p>
											<p>49. 리모델링 및 인테리어업</p>
											<p>50. 주차장운영업</p>
											<p>51. 기술개발 및 연구사업</p>
											<p>52. 씨씨티브이(CCTV)검사 및 상수도 누수탐사업</p>
											<p>53. 국내외 원자력 및 기타의 발전 및 집단에너지 사업에 필요한 엔지니어링 사업</p>
											<p>가. 타당성 조사</p>
											<p>나. 계획, 예비엔지니어링 및 기본 설계</p>
											<p>다. 세부 엔지니어링 및 설계</p>
											<p>라. 구매</p>
											<p>마. 건설사업관리</p>
											<p>바. 품질보증 및 관리</p>
											<p>사. 발전소 시험 및 시운전</p>
											<p>아. 고장 배제 및 설비개선 기술 업무</p>
											<p>자. 기술 훈련</p>
											<p>54. 지형조사 및 지형도 작성 사업</p>
											<p>55. 지하수 개발, 이용시공업</p>
											<p>56. 공공교통시설 개발사업 타당성 평가대행자</p>
											<p>57. 환경컨설팅 회사업의 연구, 개발, 투자업</p>
											<p>58. 상하수도 설비 공사업</p>
											<p>59. 해외 기술 협력에 관한 사업</p>
											<p>60. 해역이용영향평가 대행업</p>
											<p>61. 산업시설용 기자재 제작 및 판매</p>
											<p>62. 도시철도사업</p>
											<p>63. 발전시설 운영 및 에너지 공급사업</p>
											<p>64. 공공하수도 기술진단업</p>
											<p>65. 공공하수도 관리대행업</p>
											<p>66. 산업디자인업</p>
											<p>67. 물절약 전문업</p>
											<p>68. 「지방공기업법」 제3조에 따른 지방공기업 또는 「공공기관의 운영에 관한 법률」 제4조에 따른 공공기관에 대한 사업타당성 검토</p>
											<p>69. 온실가스 저감, 전환, 포집 기술 엔지니어링과 배출권거래에 관한 업</p>
											<p>70. 일반교통안전진단업(도로, 철도)</p>
											<p>71. 초경량비행장치사용사업</p>
											<p>72. 산업용수, 생활용수 공급업</p>
											<p>73. 지하안전평가전문기관</p>
											<p>74. 자연환경보전사업</p>
											<p>75. 전기공사업</p>
											<p>76. 통합환경허가 사업</p>
											<p>77. 환경관리대행업</p>
											<p>78. 산림기술사업(산림휴양, 녹지조경)</p>
											<p>79. 산업부문(가스)-LNG배관, 공급시설</p>
											<p>80. 기업적 농수산업 경영을 통한 농수산물의 생산, 가공, 판매, 유통, 영농 시설의 신설, 개량, 유지관리 컨설팅 및 관광휴양사업</p>
											<p>81. 상수도 관망관리 대행업</p>
											<p>82. 수소 및 암모니아 산업 엔지니어링 및 건설업</p>
											<p>83. 철도시설 안전진단업(궤도)</p>
											<p>84. 열공급배관 교체 및 신설 설계 및 공사업</p>
											<p>85. 비계구조물해체 설계 및 공사업</p>
											<p>86. 금속창호·지붕건축물조립공사업</p>
											<p>87. 위 각 호에 필요한 각종조사, 측량, 토질조사, 지질조사 및 각종시험 (수질시험, 토질시험, 지질시험, 재료시험 등)</p>
											<p>88. 위 각호에 관련된 제반 사업 및 투자</p>
								          </div>
								        </div>
								      </section>
								      <section class="acc-item">
								        <button class="acc-header" aria-expanded="false" aria-controls="art3">제3조 (본점의 소재지 및 지점 등의 설치)</button>
								        <div class="acc-panel" id="art3" hidden>
								          <div class="panel-inner">
								            <p>① 이 회사는 본점을 서울특별시에둔다.</p>
											<p>② 이 회사는 필요에 따라 이사회의 결의로 지점을 둘 수 있다.</p>
								          </div>
								        </div>
								      </section>
								      <section class="acc-item">
								        <button class="acc-header" aria-expanded="false" aria-controls="art4">제4조 (공고방법)</button>
								        <div class="acc-panel" id="art4" hidden>
								          <div class="panel-inner">
								            <p>이 회사의 공고는 서울특별시에서 발행되는 동아일보에 게재한다. 다만, 폐간, 휴간, 기타 부득이한 사유로 동아일보에 게재할 수 없는 경우에는 서울특별시에서 발행되는 한국경제신문에 게재한다.</p>
								          </div>
								        </div>
								      </section>
								    </div>
								  </div>
								
								  <!-- 나머지 장들 동일 구조 -->
								  <div id="tab-ch2" class="tab-content">
								    <div class="chapter-title">주식</div>
								     <div class="acc">
									      <section class="acc-item">
									        <button class="acc-header" aria-expanded="false" aria-controls="art5">제5조 (발행예정주식의 총수)</button>
									        <div class="acc-panel" id="art5" hidden>
									          <div class="panel-inner">
									            <p>이 회사가 발행할 주식의 총수는 壹億貳千萬株로 한다.</p>
									          </div>
									        </div>
									      </section>
									       	<section class="acc-item">
											<button class="acc-header" aria-expanded="false" aria-controls="art6">제6조 (壹주의 금액)</button>
										        <div class="acc-panel" id="art6" hidden>
										          <div class="panel-inner">
										            <p>이 회사가 발행하는 주식壹주의 금액은 五百원으로 한다.</p>
										          </div>
										        </div>
									      	</section>
											<section class="acc-item">
											<button class="acc-header" aria-expanded="false" aria-controls="art7">제7조 (설립시에 발행하는 주식의 총수)</button>
										        <div class="acc-panel" id="art7" hidden>
										          <div class="panel-inner">
										            <p>이 회사가 설립시에 발행하는 주식의    총수는 2,500주로 한다.(1주의 금액은 1,000원)</p>
										          </div>
										        </div>
									      </section>
									      <section class="acc-item">
											<button class="acc-header" aria-expanded="false" aria-controls="art8">제8조 (주식의 종류)</button>
										        <div class="acc-panel" id="art8" hidden>
										          <div class="panel-inner">
										            <p>이 회사가 발행할 주식은 기명식 보통주식으로 한다.</p>
										          </div>
										        </div>
									      </section>
									      <section class="acc-item">
											<button class="acc-header" aria-expanded="false" aria-controls="art9">제9조 (주식 및 신주인수권증서에 표시되어야 할 권리의 전자등록)</button>
										        <div class="acc-panel" id="art9" hidden>
										          <div class="panel-inner">
										            <p>이 회사는 주권 및 신주인수권증서를 발행하는 대신 전자등록기관의 전자등록계좌부에 주식 및 신주인수권증서에 표시되어야 할 권리를 전자등록한다.</p>
										          </div>
										        </div>
									      </section>
									      <section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art10">제10조 (주식의 발행 및 배정)</button>
										  <div class="acc-panel" id="art10" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사가 이사회의 결의로 신주를 발행하는 경우 다음 각 호의 방식에 의한다.</p>
										      <p>1. 주주에게 그가 가진 주식 수에 따라서 신주를 배정하기 위하여 신주인수의 청약을 할 기회를 부여하는 방식</p>
										      <p>2. 발행주식총수의 100분의 20을 초과하지 않는 범위 내에서 신기술의 도입, 재무구조의 개선 등 회사의 경영상 목적을 달성하기 위하여 필요한 경우 제1호 외의 방법으로</p>
										      <p>특정한 자(이 회사의 주주를 포함한다)에게 신주를 배정하기 위하여 신주인수의 청약을 할 기회를 부여하는 방식</p>
										      <p>3. 발행주식총수의 100분의 50을 초과하지 않는 범위 내에서 제1호 외의 방법으로 불특정 다수인(이 회사의 주주를 포함한다)에게 신주인수의 청약을 할 기회를 부여하고</p>
										      <p>이에 따라 청약을 한 자에 대하여 신주를 배정하는 방식</p>
										
										      <p>② 제1항 제3호의 방식으로 신주를 배정하는 경우에는 이사회의 결의로 다음 각 호의 어느 하나에 해당하는 방식으로 신주를 배정하여야 한다.</p>
										      <p>1. 신주인수의 청약을 할 기회를 부여하는 자의 유형을 분류하지 아니하고 불특정 다수의 청약자에게 신주를 배정하는 방식</p>
										      <p>2. 관계 법령에 따라 우리사주조합원에 대하여 신주를 배정하고 청약되지 아니한 주식까지 포함하여 불특정 다수인에게 신주인수의 청약을 할 기회를 부여하는 방식</p>
										      <p>3. 주주에 대하여 우선적으로 신주인수의 청약을 할 수 있는 기회를 부여하고 청약되지 아니한 주식이 있는 경우 이를 불특정 다수인에게 신주를 배정받을 기회를 부여하는 방식</p>
										      <p>4. 투자매매업자 또는 투자중개업자가 인수인 또는 주선인으로서 마련한 수요예측 등 관계 법규에서 정하는 합리적인 기준에 따라 특정한 유형의 자에게 신주인수의 청약을 할 수 있는 기회를 부여하는 방식</p>
										
										      <p>③ 제1항 제2호 및 제3호에 따라 신주를 배정하는 경우 상법 제416조제1호, 제2호, 제2호의2, 제3호 및 제4호에서 정하는 사항을 그 납입기일의 2주 전까지 주주에게 통지하거나 공고하여야 한다.</p> 
										      <p>다만, 자본시장과 금융투자업에 관한 법률 제165조의9에 따라 주요사항보고서를 금융위원회 및 거래소에 공시함으로써 그 통지 및 공고를 갈음할 수 있다.</p>
										
										      <p>④ 제1항 각호의 어느 하나의 방식에 의해 신주를 발행할 경우에는 발행할 주식의 종류와 수 및 발행가격 등은 이사회의 결의로 정한다.</p>
										
										      <p>⑤ 회사는 신주를 배정하는 경우 그 기일까지 신주인수의 청약을 하지 아니하거나 그 가액을 납입하지 아니한 주식이 발생하는 경우에</p>
										      <p>그 처리방법은 발행가액의 적정성 등 관련 법령에서 정하는 바에 따라 이사회 결의로 정한다.</p>
										
										      <p>⑥ 회사는 신주를 배정하면서 발생하는 단주에 대한 처리방법은 이사회의 결의로 정한다.</p>
										
										      <p>⑦ 회사는 제1항 제1호에 따라 신주를 배정하는 경우에는 주주에게 신주인수권증서를 발행하여야 한다.</p>
										    </div>
										  </div>
										</section>
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art10_2">제10조의2 (주식매수선택권)</button>
										  <div class="acc-panel" id="art10_2" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 임직원(상법 시행령 제30조에서 정하는 관계회사의 임ㆍ직원을 포함한다.</p> 
											  <p>이하 이 조에서 같다)에게 발행주식총수의 100분의 15의 범위 내에서 주식매수선택권을 주주총회의 특별결의에 의하여 부여할 수 있다.</p>
											  <p>다만 발행주식총수의 100분의 3의 범위 내에서는 이사회 결의로 회사의 이사를 제외한 자에 대하여 주식매수선택권을 부여할 수 있다.</p>
											  <p>이사회의 결의로 주식매수선택권을 부여한 경우 회사는 부여 후 처음으로 소집되는 주주총회의 승인을 받아야 한다.</p>
											  <p>주주총회 또는 이사회 결의에 의해 부여하는 주식매수선택권은 경영성과 또는 시장지수 등에 연동하는 성과연동형으로 할 수 있다.</p>
										
										      <p>② 주식매수선택권을 부여받을 자는 회사의 설립ㆍ경영과 기술혁신 등에 기여하거나 기여할 수 있는 자로 한다.</p>
										
										      <p>③ 주식매수선택권의 행사로 교부할 주식(주식매수선택권의 행사가격과 시가와의 차액을 현금 또는 자기주식으로 교부하는 경우에는 그 차액의 산정기준이 되는 주식을 말한다)은 기명식 보통주식으로 한다.</p>
										
										      <p>④ 주식매수선택권의 부여대상이 되는 임ㆍ직원의 수는 재직하는 임ㆍ직원의 100분의 90을 초과할 수 없고, 임원 또는 직원 1인에 대하여 부여하는 주식매수선택권은 발행주식총수의 100분의 10을 초과할 수 없다.</p>
										
										      <p>⑤ 주식매수선택권을 행사할 주식의 1주당 행사가격은 다음 각 호의 가액 이상이어야 한다. 주식매수선택권을 부여한 후 그 행사가격을 조정하는 경우에도 또한 같다.</p>
										      <p>1. 새로이 주식을 발행하여 교부하는 경우에는 다음 각 목의 가격 중 높은 금액</p>
										      <p>가. 주식매수선택권의 부여일을 기준으로 한 주식의 실질가액</p>
										      <p>나. 당해 주식의 권면액</p>
										      <p>2. 자기주식을 양도하는 경우에는 주식매수선택권 부여일을 기준으로 한 주식의 실질가액</p>
										
										      <p>⑥ 주식매수선택권은 제1항의 결의 일로부터 2년이 경과한 날로부터 7년 내에 행사할 수 있다.</p>
										
										      <p>⑦ 주식매수선택권을 부여받은 자는 제1항의 결의 일로부터 2년 이상 재임 또는 재직하여야 행사할 수 있다.</p> 
										      <p>다만, 주식매수선택권을 부여받은 자가 제1항의 결의 일부터 2년 내에 사망하거나 기타 본인의 귀책사유가 아닌 사유로 퇴임 또는 퇴직한 경우에는 그 행사기간 동안 주식매수선택권을 행사할 수 있다.</p>
										
										      <p>⑧ 다음 각 호의 1에 해당하는 경우에는 이사회의 결의로 주식매수선택권의 부여를 취소할 수 있다.</p>
										      <p>1. 주식매수선택권을 부여받은 임ㆍ직원이 본인의 의사에 따라 퇴임하거나 퇴직한 경우</p>
										      <p>2. 주식매수선택권을 부여받은 임ㆍ직원이 고의 또는 과실로 회사에 중대한 손해를 끼친 경우</p>
										      <p>3. 회사의 파산 또는 해산 등으로 주식매수선택권의 행사에 응할 수 없는 경우</p>
										      <p>4. 기타 주식매수선택권 부여계약에서 정한 취소사유가 발생한 경우</p>
										    </div>
										  </div>
										</section>
										<section class="acc-item">
											<button class="acc-header" aria-expanded="false" aria-controls="art10_3">제10조의3 (동등배당) </button>
										        <div class="acc-panel" id="art10_3" hidden>
										          <div class="panel-inner">
										            <p>이 회사는 배당 기준일 현재 발행(전환된 경우를 포함한다)된 동종 주식에 대하여 발행일과 관계 없이 모두 동등하게 배당한다.</p>
										          </div>
										        </div>
									    </section>
									    <section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art11">제11조 (명의개서대리인)</button>
										  <div class="acc-panel" id="art11" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 주식의 명의개서대리인을 둔다.</p>
										      <p>② 명의개서대리인 및 그 사무 취급장소와 대행업무의 범위는 이사회의 결의로 정하고 이를 공고한다.</p>
										      <p>③ 이 회사의 주주명부 또는 그 복본을 명의개서대리인의 사무취급장소에 비치하고 주식의 전자등록, 주주명부의 관리, 기타 주식에 관한 사무는 명의개서대리인으로 하여금 취급케 한다.</p>
										      <p>④ 제3항의 사무취급에 관한 절차는 명의개서대리인이 정한 관련 업무 규정에 따른다.</p>
										    </div>
										  </div>
										</section>
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art12">제12조 (주주명부 작성·비치)</button>
										  <div class="acc-panel" id="art12" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 전자등록기관으로부터 소유자명세를 통지받은 경우 통지받은 사항과 통지 연월일을 기재하여 주주명부를 작성·비치하여야 한다.</p>
										      <p>② 이 회사는 5% 이상 지분을 보유한 주주(특수관계인 등을 포함한다)의 현황에 변경이 있는 등 필요한 경우에 전자등록기관에 소유자명세의 작성을 요청할 수 있다.</p>
										    </div>
										  </div>
										</section>
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art13">제13조 (기준일)</button>
										  <div class="acc-panel" id="art13" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 매년 12월 31일 최종의 주주명부에 기재되어 있는 주주를 그 결산기에 관한 정기주주총회에서 권리를 행사할 주주로 한다.</p>
										      <p>② 이 회사는 임시주주총회의 소집 기타 필요한 경우 이사회의 결의로 정한 날에 주주명부에 기재되어 있는 주주를 그 권리를 행사할 주주로 할 수 있으며,</p> 
										      <p>회사는 이사회의 결의로 정한 날의 2주간 전에 이를 공고하여야 한다.</p>
										    </div>
										  </div>
										</section>															      
								      </div>
								  </div>
								  
								  <div id="tab-ch3" class="tab-content">
								    <div class="chapter-title">사채</div>
								     <div class="acc">
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art14">제14조 (사채의 발행)</button>
										  <div class="acc-panel" id="art14" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 이사회의 결의에 의하여 사채를 발행할 수 있다.</p>
										      <p>② 이사회는 대표이사에게 사채의 금액 및 종류를 정하여 1년을 초과하지 아니하는 기간 내에 사채를 발행할 것을 위임할 수 있다.</p>
										      <p>※ 이사회에서 대표이사에게 사채발행을 위임하는 경우 제2항에서 정한 사항 이외에도 발행조건, 상환기간 등을 정하여 위임할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art14_2">제14조의2 (전환사채의 발행 및 배정)</button>
										  <div class="acc-panel" id="art14_2" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 다음 각 호의 어느 하나에 해당하는 경우 이사회의 결의로 주주 외의 자에게 전환사채를 발행할 수 있다.</p>
										      <p>1. 사채의 액면총액이 육백억원을 초과하지 않는 범위 내에서 신기술의 도입, 재무구조의 개선 등 회사의 경영상 목적을 달성하기 위하여 필요한 경우 제10조 제1항 제1호 외의 방법으로</p>
										      <p>특정한 자(이 회사의 주주를 포함한다)에게 사채를 배정하기 위하여 사채인수의 청약을 할 기회를 부여하는 방식으로 전환사채를 발행하는 경우</p>
										      <p>2. 사채의 액면총액이 일천억원을 초과하지 않는 범위 내에서 제10조 제1항 제1호 외의 방법으로 불특정 다수인(이 회사의 주주를 포함한다)에게 사채인수의 청약을 할 기회를 부여하고</p>
										      <p>이에 따라 청약을 한 자에 대하여 사채를 배정하는 방식으로 전환사채를 발행하는 경우</p>
										      <p>② 제1항 제2호의 방식으로 사채를 배정하는 경우에는 이사회의 결의로 다음 각 호의 어느 하나에 해당하는 방식으로 사채를 배정하여야 한다.</p>
										      <p>1. 사채인수의 청약을 할 기회를 부여하는 자의 유형을 분류하지 아니하고 불특정 다수의 청약자에게 사채를 배정하는 방식</p>
										      <p>2. 주주에 대하여 우선적으로 사채인수의 청약을 할 수 있는 기회를 부여하고 청약되지 아니한 사채가 있는 경우 이를 불특정 다수인에게 사채를 배정받을 기회를 부여하는 방식</p>
										      <p>3. 투자매매업자 또는 투자중개업자가 인수인 또는 주선인으로서 마련한 수요예측 등 관계 법규에서 정하는 합리적인 기준에 따라 특정한 유형의 자에게 사채인수의 청약을 할 수 있는 기회를 부여하는 방식</p>
										      <p>③ 제1항의 전환사채에 있어서 이사회는 그 일부에 대하여만 전환권을 부여하는 조건으로도 이를 발행할 수 있다.</p>
										      <p>④ 전환으로 인하여 발행하는 주식은 보통주식으로 하고 전환가액은 주식의 액면금액 또는 그 이상의 가액으로 사채 발행 시 이사회가 정한다.</p>
										      <p>⑤ 전환을 청구할 수 있는 기간은 당해 사채의 발행일 후 1개월이 경과하는 날로부터 그 상환기일의 직전일까지로 한다. 그러나 위 기간 내에서 이사회의 결의로써 전환청구기간을 조정할 수 있다.</p>
										      <p>⑥ 주식으로 전환된 경우 회사는 전환 전에 지급시기가 도래한 이자에 대하여만 이자를 지급한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art15">제15조 (신주인수권부사채의 발행 및 배정)</button>
										  <div class="acc-panel" id="art15" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 다음 각 호의 어느 하나에 해당하는 경우 이사회 결의로 주주 외의 자에게 신주인수권부사채를 발행할 수 있다.</p>
										      <p>1. 사채의 액면총액이 육백억원을 초과하지 않는 범위 내에서 신기술의 도입, 재무구조의 개선 등 회사의 경영상 목적을 달성하기 위하여 필요한 경우 제10조 제1항 제1호 외의 방법으로 특정한 자</p>
										      <p>(이 회사의 주주를 포함한다)에게 사채를 배정하기 위하여 사채인수의 청약을 할 기회를 부여하는 방식으로 신주인수권부사채를 발행하는 경우</p>
										      <p>2. 사채의 액면총액이 일천억원을 초과하지 않는 범위 내에서 제10조 제1항 제1호 외의 방법으로 불특정 다수인(이 회사의 주주를 포함한다)에게 사채인수의 청약을 할 기회를 부여하고</p>
										      <p>이에 따라 청약을 한 자에 대하여 사채를 배정하는 방식으로 신주인수권부사채를 발행하는 경우</p>
										      <p>② 제1항 제2호의 방식으로 사채를 배정하는 경우에는 이사회의 결의로 다음 각 호의 어느 하나에 해당하는 방식으로 사채를 배정하여야 한다.</p>
										      <p>1. 사채인수의 청약을 할 기회를 부여하는 자의 유형을 분류하지 아니하고 불특정 다수의 청약자에게 사채를 배정하는 방식</p>
										      <p>2. 주주에 대하여 우선적으로 사채인수의 청약을 할 수 있는 기회를 부여하고 청약되지 아니한 사채가 있는 경우 이를 불특정 다수인에게 사채를 배정받을 기회를 부여하는 방식</p>
										      <p>3. 투자매매업자 또는 투자중개업자가 인수인 또는 주선인으로서 마련한 수요예측 등 관계 법규에서 정하는 합리적인 기준에 따라 특정한 유형의 자에게 사채인수의 청약을 할 수 있는 기회를 부여하는 방식</p>
										      <p>③ 신주인수를 청구할 수 있는 금액은 사채의 액면총액을 초과하지 않는 범위 내에서 이사회가 정한다.</p>
										      <p>④ 신주인수권의 행사로 발행하는 주식은 보통주식으로 하고 그 발행가액은 액면금액 또는 그 이상의 가액으로 사채 발행 시 이사회가 정한다.</p>
										      <p>⑤ 신주인수권을 행사할 수 있는 기간은 당해 사채 발행일 후 1개월이 경과한 날로부터 그 상환기일의 직전일까지로 한다. 그러나 위 기간 내에서 이사회의 결의로써 신주인수권의 행사기간을 조정할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art15_2">제15조의2 (사채 및 신주인수권증권에 표시되어야 할 권리의 전자등록)</button>
										  <div class="acc-panel" id="art15_2" hidden>
										    <div class="panel-inner">
										      <p>이 회사는 사채권 및 신주인수권증권을 발행하는 대신 전자등록기관의 전자등록계좌부에 사채권 및 신주인수권증권에 표시되어야 할 권리를 전자등록한다.</p>
										      <p>다만, 사채의 경우 법령에 따라 전자등록이 의무화된 상장사채 등을 제외하고는 전자등록을 하지 않을 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art16">제16조 (사채발행에 관한 준용규정)</button>
										  <div class="acc-panel" id="art16" hidden>
										    <div class="panel-inner">
										      <p>제11조의 규정은 사채발행의 경우에 준용한다.</p>
										    </div>
										  </div>
										</section>
								     </div>								    
								  </div>
								  <div id="tab-ch4" class="tab-content">
								    <div class="chapter-title">주주총회</div>
								    <div class="acc">
									    <section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art17">제17조 (소집시기)</button>
										  <div class="acc-panel" id="art17" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사의 주주총회는 정기주주총회와 임시주주총회로 한다.</p>
										      <p>② 정기주주총회는 제13조 제1항에서 정한 기준일로부터 3월 이내에, 임시주주총회는 필요에 따라 소집한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art18">제18조 (소집권자)</button>
										  <div class="acc-panel" id="art18" hidden>
										    <div class="panel-inner">
										      <p>① 주주총회의 소집은 법령에 다른 규정이 있는 경우를 제외하고는 이사회의 결의에 따라 대표이사가 소집한다.</p>
										      <p>② 대표이사 유고시에는 제34조 제2항의 규정을 준용한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art19">제19조 (소집통지 및 공고)</button>
										  <div class="acc-panel" id="art19" hidden>
										    <div class="panel-inner">
										      <p>① 주주총회를 소집함에는 그 일시, 장소 및 회의의 목적사항을 총회일 2주간 전에 주주에게 서면으로 통지를 발송하여야 한다.</p>
										      <p>② 의결권이 있는 발행주식총수의 100분의 1 이하의 주식을 소유한 주주에 대한 소집통지는 2주간 전에 주주총회를 소집한다는 뜻과 회의 목적사항을 서울특별시에서 발행하는</p>
										      <p>동아일보와 한국경제신문에 2회 이상 공고하거나 금융감독원 또는 한국거래소가 운영하는 전자공시시스템에 공고함으로써 제1항의 소집통지에 갈음할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art20">제20조 (소집지)</button>
										  <div class="acc-panel" id="art20" hidden>
										    <div class="panel-inner">
										      <p>주주총회는 본점 소재지에서 개최하되 필요에 따라 이의 인접지역에서도 개최할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art21">제21조 (의장)</button>
										  <div class="acc-panel" id="art21" hidden>
										    <div class="panel-inner">
										      <p>① 주주총회의 의장은 대표이사로 한다.</p>
										      <p>② 대표이사 유고시에는 제34조 제2항의 규정을 준용한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art22">제22조 (의장의 질서유지권)</button>
										  <div class="acc-panel" id="art22" hidden>
										    <div class="panel-inner">
										      <p>① 주주총회의 의장은 그 주주총회에서 고의로 의사진행을 방해하기 위한 발언·행동을 하는 등 현저히 질서를 문란케 하는 자에 대하여 그 발언의 정지 또는 퇴장을 명할 수 있다.</p>
										      <p>② 주주총회의 의장은 의사진행의 원활을 기하기 위하여 필요하다고 인정할 때에는 주주의 발언의 시간 및 회수를 제한할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art23">제23조 (주주의 의결권)</button>
										  <div class="acc-panel" id="art23" hidden>
										    <div class="panel-inner">
										      <p>주주의 의결권은 1주마다 1개로 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art24">제24조 (상호주에 대한 의결권 제한)</button>
										  <div class="acc-panel" id="art24" hidden>
										    <div class="panel-inner">
										      <p>이 회사, 모회사 및 자회사 또는 자회사가 다른 회사의 발행주식총수의 10분의 1을 초과하는 주식을 가지고 있는 경우 그 다른 회사가 가지고 있는 이 회사의 주식은 의결권이 없다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art25">제25조 (의결권의 불통일행사)</button>
										  <div class="acc-panel" id="art25" hidden>
										    <div class="panel-inner">
										      <p>① 2 이상의 의결권을 가지고 있는 주주가 의결권의 불통일행사를 하고자 할 때에는 회일의 3일 전에 회사에 대하여 서면으로 그 뜻과 이유를 통지하여야 한다.</p>
										      <p>② 회사는 주주의 의결권의 불통일행사를 거부할 수 있다. 그러나 주주가 주식의 신탁을 인수하였거나 기타 타인을 위하여 주식을 가지고 있는 경우에는 그러하지 아니하다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art26">제26조 (의결권의 대리행사)</button>
										  <div class="acc-panel" id="art26" hidden>
										    <div class="panel-inner">
										      <p>① 주주는 대리인으로 하여금 그 의결권을 행사하게 할 수 있다.</p>
										      <p>② 제1항의 대리인은 주주총회 개시 전에 그 대리권을 증명하는 서면(위임장)을 제출하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art27">제27조 (주주총회의 결의방법)</button>
										  <div class="acc-panel" id="art27" hidden>
										    <div class="panel-inner">
										      <p>주주총회의 결의는 법령 및 정관에 다른 정함이 있는 경우를 제외하고는 출석한 주주의 의결권의 과반수로 하되 발행주식 총수의 4분의 1 이상의 수로 하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art27_2">제27조의2 (서면에 의한 의결권의 행사)</button>
										  <div class="acc-panel" id="art27_2" hidden>
										    <div class="panel-inner">
										      <p>① 주주는 총회에 출석하지 아니하고 서면에 의하여 의결권을 행사할 수 있다.</p>
										      <p>② 회사는 제1항의 경우 총회의 소집통지서에 주주의 의결권 행사에 필요한 서면과 참고자료를 첨부하여야 한다.</p>
										      <p>③ 서면에 의하여 의결권을 행사하고자 하는 주주는 제2항의 서면에 필요한 사항을 기재하여 회일의 전일까지 회사에 제출하여야 한다.</p>
										      <p>④ 총회의 소집을 결정하기 위한 이사회결의시 서면투표 여부를 결정할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art28">제28조 (주주총회의 의사록)</button>
										  <div class="acc-panel" id="art28" hidden>
										    <div class="panel-inner">
										      <p>주주총회의 의사는 그 경과의 요령과 결과를 의사록에 기재하고 의장과 출석한 이사가 기명날인 또는 서명을 하여 본점과 지점에 비치한다.</p>
										    </div>
										  </div>
										</section>							    
								    </div>
								  </div>
								  
								  <div id="tab-ch5" class="tab-content">
								    <div class="chapter-title">이사 및 이사회</div>
								    <div class="acc">
								    	<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art29">제29조 (이사의 수)</button>
										  <div class="acc-panel" id="art29" hidden>
										    <div class="panel-inner">
										      <p>이 회사의 이사는 3명 이상으로 하고, 사외이사는 이사 총 수의 4분의 1 이상으로 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art30">제30조 (이사의 선임)</button>
										  <div class="acc-panel" id="art30" hidden>
										    <div class="panel-inner">
										      <p>① 이사는 주주총회에서 선임한다.</p>
										      <p>② 이사의 선임은 출석한 주주의 의결권의 과반수로 하되 발행주식 총수의 4분의 1 이상의 수로 하여야 한다.</p>
										      <p>③ 2인 이상의 이사를 선임하는 경우 상법 제382조의2에서 규정하는 집중투표제는 적용하지 아니한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art31">제31조 (이사의 임기)</button>
										  <div class="acc-panel" id="art31" hidden>
										    <div class="panel-inner">
										      <p>이사의 임기는 3년 이내로 한다. 그러나 그 임기가 최종의 결산기 종료 후 당해 결산기에 관한 정기주주총회 전에 만료될 경우에는 그 총회의 종결 시까지 그 임기를 연장한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art32">제32조 (이사의 보선)</button>
										  <div class="acc-panel" id="art32" hidden>
										    <div class="panel-inner">
										      <p>① 이사 중 결원이 생긴 때에는 주주총회에서 이를 선임한다. 그러나 이 정관 제29조에서 정하는 원수를 결하지 아니하고 업무수행상 지장이 없는 경우에는 그러하지 아니한다.</p>
										      <p>② 사외이사가 사임ㆍ사망 등의 사유로 인하여 정관 제29조에서 정하는 원수를 결한 경우에는 그 사유가 발생한 후 최초로 소집되는 주주총회에서 그 요건에 충족되도록 하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art33">제33조 (대표이사 등의 선임)</button>
										  <div class="acc-panel" id="art33" hidden>
										    <div class="panel-inner">
										      <p>이 회사는 이사회의 결의로 대표이사를 선임할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art34">제34조 (이사의 직무)</button>
										  <div class="acc-panel" id="art34" hidden>
										    <div class="panel-inner">
										      <p>① 대표이사는 회사를 대표하고 업무를 총괄한다.</p>
										      <p>② 사장, 부사장, 전무, 상무 및 이사는 대표이사를 보좌하고 이사회에서 정하는 바에 따라 이 회사의 업무를 분장 집행하며 대표이사 유고 시에는 위의 순서로 그 직무를 대행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art34_3">제34조의3 (이사의 보고의무)</button>
										  <div class="acc-panel" id="art34_3" hidden>
										    <div class="panel-inner">
										      <p>① 이사는 3월에 1회 이상 업무의 집행상황을 이사회에 보고하여야 한다.</p>
										      <p>② 이사는 회사에 현저하게 손해를 미칠 염려가 있는 사실을 발견한 때에는 즉시 감사위원회에 이를 보고하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art34_4">제34조의4 (이사의 회사에 대한 책임감경)</button>
										  <div class="acc-panel" id="art34_4" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 주주총회 결의로 이사의 상법 제399조에 따른 책임을 그 행위를 한 날 이전 최근 1년 간의 보수액(상여금과 주식매수선택권의 행사로 인한 이익 등을 포함한다)</p>
										      <p>의 6배(사외이사의 경우는 3배)를 초과하는 금액에 대하여 면제할 수 있다.</p>
										      <p>② 이사가 고의 또는 중대한 과실로 손해를 발생시킨 경우와 이사가 상법 제397조(경업금지), 제397조의2(회사기회유용금지) 및 상법 제398조(자기거래금지)에</p>
										      <p>해당하는 경우에는 제1항의 규정을 적용하지 아니한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art35">제35조 (이사회의 구성과 소집)</button>
										  <div class="acc-panel" id="art35" hidden>
										    <div class="panel-inner">
										      <p>① 이사회는 이사로 구성하며 이 회사 업무의 중요사항을 결의한다.</p>
										      <p>② 이사회는 대표이사 또는 이사회에서 따로 정한 이사가 있을 때에는 그 이사가 회일 1주일 전에 각 이사에게 통지하여 소집한다.</p> 
										      <p>그러나 이사 전원의 동의가 있을 때에는 소집 절차를 생략할 수 있다.</p>
										      <p>③ 이사회의 의장은 제2항의 규정에 의한 이사회의 소집권자로 한다.</p>
										      <p>④ 이사회 소집통지 시 의안과 관련 서류를 함께 송부한다. 단, 이사회 소집통지 이후 발생한 의안의 경우는 예외로 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art36">제36조 (이사회의 결의방법)</button>
										  <div class="acc-panel" id="art36" hidden>
										    <div class="panel-inner">
										      <p>① 이사회의 결의는 이사 과반수의 출석과 출석이사의 과반수로 한다.</p>
										      <p>다만 상법 제397조의2(회사기회유용금지) 및 제398조(자기거래금지)에 해당하는 사안에 대한 이사회 결의는 이사 3분의 2 이상의 수로 한다.</p>
										      <p>② 이사회는 이사의 전부 또는 일부가 직접 회의에 출석하지 아니하고 모든 이사가 음성을 동시에 송ㆍ수신하는 통신수단에 의하여 결의에 참가하는 것을 허용할 수 있다.</p> 
										      <p>이 경우 당해 이사는 이사회에 직접 출석한 것으로 본다.</p>
										      <p>③ 이사회의 결의에 관하여 특별한 이해관계가 있는 자는 의결권을 행사하지 못한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art36_2">제36조의2 (이사회 의사록)</button>
										  <div class="acc-panel" id="art36_2" hidden>
										    <div class="panel-inner">
										      <p>① 이사회의 의사에 관하여는 의사록을 작성하여야 한다.</p>
										      <p>② 의사록에는 의사의 안건, 경과 요령, 그 결과, 반대하는 자와 그 반대 이유를 기재하고 출석한 이사가 기명날인 또는 서명하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art36_3">제36조의3 (위원회)</button>
										  <div class="acc-panel" id="art36_3" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 이사회 내에 감사위원회를 둔다.</p>
										      <p>② 위원회의 구성, 권한, 운영 등에 관한 세부사항은 이사회의 결의로 정한다.</p>
										      <p>③ 위원회에 대해서는 제35조, 제36조 및 제36조의2의 규정을 준용한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art37">제37조 (이사의 보수와 퇴직금)</button>
										  <div class="acc-panel" id="art37" hidden>
										    <div class="panel-inner">
										      <p>① 이사의 보수는 주주총회의 결의로 이를 정한다.</p>
										      <p>② 이사의 퇴직금의 지급은 주주총회의 결의를 거친 임원퇴직금지급규정에 의한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art38">제38조 (상담역 및 고문)</button>
										  <div class="acc-panel" id="art38" hidden>
										    <div class="panel-inner">
										      <p>이 회사는 이사회의 결의로 상담역 또는 고문 약간 명을 둘 수 있다.</p>
										    </div>
										  </div>
										</section>
								    </div>
								  </div>
								  <div id="tab-ch6" class="tab-content">
								    <div class="chapter-title">감사위원회</div>
								    <div class="acc">
								    	<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art39">제39조 (감사위원회의 구성)</button>
										  <div class="acc-panel" id="art39" hidden>
										    <div class="panel-inner">
										      <p>① 이 회사는 감사에 갈음하여 제36조의3의 규정에 의한 감사위원회를 둔다.</p>
										      <p>② 감사위원회는 3인 이상의 이사로 구성한다.</p>
										      <p>③ 위원의 3분의 2 이상은 사외이사이어야 하고, 사외이사 아닌 위원은 상법 제542조의10 제2항의 요건을 갖추어야 한다.</p>
										      <p>④ 감사위원회 위원은 주주총회에서 이사를 선임한 후 선임된 이사 중에서 감사위원을 선임하여야 한다. 이 경우 감사위원회 위원 3명은 주주총회 결의로 다른 이사들과 분리하여</p>
										      <p>감사위원회 위원이 되는 이사로 선임하여야 한다.</p>
										      <p>⑤ 감사위원회 위원의 선임은 출석한 주주의 의결권의 과반수로 하되 발행주식총수의 4분의 1 이상의 수로 하여야 한다.</p> 
										      <p>다만, 상법 제368조의4 제1항에 따라 전자적 방법으로 의결권을 행사할 수 있도록 한 경우에는 출석한 주주의 의결권의 과반수로써 감사위원회 위원의 선임을 결의할 수 있다.</p>
										      <p>⑥ 감사위원회위원은 상법 제434조에 따른 주주총회의 결의로 해임할 수 있다. 이 경우 제4항 단서에 따른 감사위원회 위원은 이사와 감사위원회 위원의 지위를 모두 상실한다.</p>
										      <p>⑦ 감사위원회 위원의 선임과 해임에는 의결권 없는 주식을 제외한 발행주식총수의 100분의 3을 초과하는 수의 주식을 가진 주주(최대주주인 경우에는 사외이사가 아닌 감사위원회 위원을 선임</p> 
										      <p>또는 해임할 때에는 그의 특수관계인,그 밖에 상법시행령으로 정하는 자가 소유하는 주식을 합산한다)는 그 초과하는 주식에 관하여 의결권을 행사하지 못한다.</p>
										      <p>⑧ 감사위원회는 그 결의로 위원회를 대표할 자를 선정하여야 한다. 이 경우 위원장은 사외이사이어야 한다.</p>
										      <p>⑨ 사외이사의 사임·사망 등의 사유로 인하여 사외이사의 수가 이 조에서 정한 감사위원회의 구성요건에 미달하게 되면 그 사유가 발생한 후 처음으로 소집되는 주주총회에서 그 요건에 합치되도록 하여야 한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art40">제40조 (감사위원회의 직무)</button>
										  <div class="acc-panel" id="art40" hidden>
										    <div class="panel-inner">
										      <p>① 감사위원회는 이 회사의 회계와 업무를 감사한다.</p>
										      <p>② 감사위원회는 필요하면 회의의 목적사항과 소집이유를 서면에 적어 이사(소집권자가 있는 경우에는 소집권자를 말한다. 이하 같다.)에게 제출하여 이사회 소집을 청구할 수 있다.</p>
										      <p>③ 제2항의 청구를 하였는데도 이사가 지체 없이 이사회를 소집하지 아니하면 그 청구한 감사위원회가 이사회를 소집할 수 있다.</p>
										      <p>④ 감사위원회는 회의의 목적사항과 소집의 이유를 기재한 서면을 이사회에 제출하여 임시총회의 소집을 청구할 수 있다.</p>
										      <p>⑤ 감사위원회는 그 직무를 수행하기 위하여 필요한 때에는 자회사에 대하여 영업의 보고를 요구할 수 있다. 이 경우 자회사가 지체 없이 보고를 하지 아니할 때 또는 </p>
										      <p>그 보고의 내용을 확인할 필요가 있는 때에는 자회사의 업무와 재산 상태를 조사할 수 있다.</p>
										      <p>⑥ 감사위원회는 회사의 외부감사인을 선정한다.</p>
										      <p>⑦ 감사위원회는 제1항 내지 제6항 외에 이사회가 위임한 사항을 처리한다.</p>
										      <p>⑧ 감사위원회 결의에 대하여 이사회는 재 결의 할 수 없다.</p>
										      <p>⑨ 감사위원회는 회사의 비용으로 전문가의 도움을 구할 수 있다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="art41">제41조 (감사록)</button>
										  <div class="acc-panel" id="art41" hidden>
										    <div class="panel-inner">
										      <p>감사위원회는 감사에 관하여 감사록을 작성하여야 하며, 감사록에는 감사의 실시요령과 그 결과를 기재하고 감사를 실시한 감사위원회 위원이 기명날인 또는 서명하여야 한다.</p>
										    </div>
										  </div>
										</section>

								    
								    </div>
								  </div>
								  <div id="tab-ch7" class="tab-content">
								    <div class="chapter-title">계산</div>
								     <div class="acc">
								     <section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art42">제42조 (사업년도)</button>
									  <div class="acc-panel" id="art42" hidden>
									    <div class="panel-inner">
									      <p>이 회사의 사업년도는 매년 1월 1일부터 12월 31일까지로 한다.</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art43">제43조 (재무제표와 영업보고서의 작성, 비치 등)</button>
									  <div class="acc-panel" id="art43" hidden>
									    <div class="panel-inner">
									      <p>① 이 회사의 대표이사는 정기 주주총회 회일의 6주간 전에 다음의 서류와 그 부속명세서 및 영업보고서를 작성하여 감사위원회의 감사를 받아야 하며,</p> 
									      <p>다음 각 호의 서류와 영업보고서를 정기총회에 제출하여야 한다.</p>
									      <p>1. 대차대조표</p>
									      <p>2. 손익계산서</p>
									      <p>3. 그 밖에 회사의 재무상태와 경영성과를 표시하는 것으로서 상법시행령에서 정하는 서류</p>
									      <p>② 이 회사가 상법시행령에서 정하는 연결재무제표 작성대상회사에 해당하는 경우에는 제1항의 각 서류에 연결재무제표를 포함한다.</p>
									      <p>③ 감사위원회는 정기주주총회일의 1주 전까지 감사보고서를 대표이사에게 제출하여야 한다.</p>
									      <p>④ 제1항에 불구하고 이 회사는 다음 각 호의 요건을 모두 충족한 경우에는 이사회의 결의로 이를 승인할 수 있다.</p>
									      <p>1. 제1항의 각 서류가 법령 및 정관에 따라 회사의 재무상태 및 경영성과를 적정하게 표시하고 있다는 외부감사인의 의견이 있을 때</p>
									      <p>2. 감사위원 전원의 동의가 있을 때</p>
									      <p>⑤ 제4항에 따라 이사회가 승인한 경우에는 대표이사는 제1항의 각 서류의 내용을 주주총회에 보고하여야 한다.</p>
									      <p>⑥ 대표이사는 제1항의 서류와 감사보고서를 정기주주총회일의 1주간 전부터 본사에 5년간, 그 등본을 지점에 3년간 비치하여야 한다.</p>
									      <p>⑦ 대표이사는 제1항 각 서류에 대한 주주총회의 승인 또는 제4항에 의한 이사회의 승인을 얻은 때에는 지체없이 대차대조표와 외부감사인의 감사의견을 공고하여야 한다.</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art43_2">제43조의2 (외부감사인의 선임)</button>
									  <div class="acc-panel" id="art43_2" hidden>
									    <div class="panel-inner">
									      <p>회사는 「주식회사 등의 외부감사에 관한 법률」의 규정에 의한 감사인선임위원회의 승인을 받아 감사위원회가 선정한 외부감사인을 선임하며, </p>
									      <p>그 사실을 선임한 이후에 소집되는 정기총회에 보고하거나 「주식회사 등의 외부감사에 관한 법률 시행령」에서 정하는 바에 따라 주주에게 통지 또는 공고하여야 한다.</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art44">제44조 (이익금의 처분)</button>
									  <div class="acc-panel" id="art44" hidden>
									    <div class="panel-inner">
									      <p>이 회사의 매 사업년도의 처분 전 이익잉여금을 다음과 같이 처분한다.</p>
									      <p>1. 이익준비금</p>
									      <p>2. 기타의 법정적립금</p>
									      <p>3. 배당금</p>
									      <p>4. 임의적립금</p>
									      <p>5. 기타의 이익잉여금 처분액</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art45">제45조 (이익배당)</button>
									  <div class="acc-panel" id="art45" hidden>
									    <div class="panel-inner">
									      <p>① 이익의 배당은 금전, 주식 및 기타의 재산으로 할 수 있다.</p>
									      <p>② 제1항의 배당은 제13조 제1항에서 정한 현재의 주주명부에 기재된 주주 또는 등록된 질권자에게 지급한다.</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art45_2">제45조의2 (분기배당)</button>
									  <div class="acc-panel" id="art45_2" hidden>
									    <div class="panel-inner">
									      <p>① 이 회사는 사업년도 개시 일부터 3월, 6월 및 9월 말일 현재의 주주에게 「자본시장과 금융투자업에 관한 법률」 제165조의12에 의한 분기배당을 할 수 있다. 분기배당은 금전으로 한다.</p>
									      <p>② 제1항의 분기배당은 이사회의 결의로 하되, 그 결의는 제1항의 각 기준일 이후 45일 내에 하여야 한다.</p>
									      <p>③ 분기배당은 직전결산기의 대차대조표상의 순자산액에서 다음 각 호의 금액을 공제한 액을 한도로 한다.</p>
									      <p>1. 직전결산기의 자본금의 액</p>
									      <p>2. 직전결산기까지 적립된 자본준비금과 이익준비금의 합계액</p>
									      <p>3. 상법시행령에서 정하는 미실현이익</p>
									      <p>4. 직전결산기의 정기주주총회에서 이익배당하기로 정한 금액</p>
									      <p>5. 직전결산기까지 정관의 규정 또는 주주총회의 결의에 의하여 특정목적을 위해 적립한 임의준비금</p>
									      <p>6. 분기배당에 따라 당해 결산기에 적립하여야 할 이익준비금</p>
									      <p>7. 당해 영업년도 중에 분기배당이 있었던 경우 그 금액의 합계액</p>
									    </div>
									  </div>
									</section>
									
									<section class="acc-item">
									  <button class="acc-header" aria-expanded="false" aria-controls="art46">제46조 (배당금지급청구권의 소멸시효)</button>
									  <div class="acc-panel" id="art46" hidden>
									    <div class="panel-inner">
									      <p>① 배당금의 지급청구권은 5년간 이를 행사하지 아니하면 소멸시효가 완성한다.</p>
									      <p>② 제1항의 시효의 완성으로 인한 배당금은 이 회사에 귀속된다.</p>
									    </div>
									  </div>
									</section>
																	     
								     </div>
								  </div>
								  <div id="tab-add" class="tab-content">
								    <div class="chapter-title">부칙</div>
								    <div class="acc">
									    <section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20240322">부칙(2024.03.22)</button>
										  <div class="acc-panel" id="supplement-20240322" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2024년 3월 22일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20220318">부칙(2022.03.18)</button>
										  <div class="acc-panel" id="supplement-20220318" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2022년 3월 18일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20210319">부칙(2021.03.19)</button>
										  <div class="acc-panel" id="supplement-20210319" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2021년 3월 19일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20200320">부칙(2020.03.20)</button>
										  <div class="acc-panel" id="supplement-20200320" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2020년 3월 20일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20190322">부칙(2019.03.22)</button>
										  <div class="acc-panel" id="supplement-20190322" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2019년 3월 22일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20180323">부칙(2018.03.23)</button>
										  <div class="acc-panel" id="supplement-20180323" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2018년 3월 23일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20170324">부칙(2017.03.24)</button>
										  <div class="acc-panel" id="supplement-20170324" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2017년 3월 24일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20160311">부칙(2016.03.11)</button>
										  <div class="acc-panel" id="supplement-20160311" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2016년 3월 11일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20150320">부칙(2015.03.20)</button>
										  <div class="acc-panel" id="supplement-20150320" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2015년 3월 20일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20140321">부칙(2014.03.21)</button>
										  <div class="acc-panel" id="supplement-20140321" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2014년 3월 21일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20131025">부칙(2013.10.25)</button>
										  <div class="acc-panel" id="supplement-20131025" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 날(2013년 10월 25일)부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20130322">부칙(2013.03.22)</button>
										  <div class="acc-panel" id="supplement-20130322" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 2013년 3월 22일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20120323">부칙(2012.03.23)</button>
										  <div class="acc-panel" id="supplement-20120323" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 주주총회에서 승인한 2012년 3월 23일부터 시행한다.</p>
										      <p>다만 제10조 제3항, 제14조, 제14조의2, 제34조의2, 제34조의4, 제36조, 제40조, 제43조, 제44조의2, 제45조 및 제45조의2의 개정내용은 2012년 4월 15일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20110325">부칙(2011.03.25)</button>
										  <div class="acc-panel" id="supplement-20110325" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2011년 3월 25일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20100120">부칙(2010.01.20)</button>
										  <div class="acc-panel" id="supplement-20100120" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2010년 1월 20일부터 시행한다. 다만, 제10조의2 1항의 단서조항과 1항의 "관계회사의 임직원에 관한 사항" 등 상법 제542조의2 내지 제542조의12(상장회사에 대한 특례)의</p>
										      <p>적용을 받는 사항은 회사가 한국거래소가 개설한 증권시장에 주권을 신규 상장한 때부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20090326">부칙(2009.03.26)</button>
										  <div class="acc-panel" id="supplement-20090326" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2009년 3월 26일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20070405">부칙(2007.04.05)</button>
										  <div class="acc-panel" id="supplement-20070405" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2007년 4월 5일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20020517">부칙(2002.05.17)</button>
										  <div class="acc-panel" id="supplement-20020517" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2002년 5월 17일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20020502">부칙(2002.05.02)</button>
										  <div class="acc-panel" id="supplement-20020502" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2002년 5월 2일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-20010619">부칙(2001.06.19)</button>
										  <div class="acc-panel" id="supplement-20010619" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 2001년 6월 19일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19990714">부칙(1999.07.14)</button>
										  <div class="acc-panel" id="supplement-19990714" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1999년 7월 14일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19980831">부칙(1998.08.31)</button>
										  <div class="acc-panel" id="supplement-19980831" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1998년 8월 31일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19950818">부칙(1995.08.18)</button>
										  <div class="acc-panel" id="supplement-19950818" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1995년 8월 18일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19920425">부칙(1992.04.25)</button>
										  <div class="acc-panel" id="supplement-19920425" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1992년 4월 25일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
										
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19890815">부칙(1989.08.15)</button>
										  <div class="acc-panel" id="supplement-19890815" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1989년 8월 15일부터 시행한다.</p>
										    </div>
										  </div>
										</section>
									
										<section class="acc-item">
										  <button class="acc-header" aria-expanded="false" aria-controls="supplement-19620505">부칙(1962.05.05)</button>
										  <div class="acc-panel" id="supplement-19620505" hidden>
										    <div class="panel-inner">
										      <p>이 정관은 1962년 5월 5일부터 시행한다.</p>
										    </div>
										  </div>
										</section>				    
								    </div>
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
		  // 탭 전환 (그대로 유지)
		  const tabs = document.querySelectorAll(".tab-nav button");
		  const contents = document.querySelectorAll(".tab-content");
		
		  tabs.forEach(tab => {
		    tab.addEventListener("click", () => {
		      const target = tab.dataset.target;
		      tabs.forEach(btn => btn.classList.toggle("active", btn === tab));
		      contents.forEach(c => c.classList.toggle("active", c.id === target));
		    });
		  });
		
		  // 아코디언: 한 개만 열리면서 부드럽게 열리고 닫히도록
		  (function () {
		    const TRANSITION = 'height 0.45s cubic-bezier(0.25, 0.1, 0.25, 1)';
		
		    document.querySelectorAll('.acc').forEach(accContainer => {
		      const headers = accContainer.querySelectorAll('.acc-header');
		
		      headers.forEach(header => {
		        const panelId = header.getAttribute('aria-controls');
		        const panel = document.getElementById(panelId);
		        if (!panel) return;
		
		        // 패널 기본 설정
		        panel.style.overflow = 'hidden';
		        panel.style.transition = TRANSITION;
		
		        header.addEventListener('click', () => {
		          const isExpanded = header.getAttribute('aria-expanded') === 'true';
		
		          // 1) 같은 .acc 그룹 내 다른 패널들 닫기
		          headers.forEach(otherHeader => {
		            if (otherHeader === header) return;
		
		            const otherPanel = document.getElementById(otherHeader.getAttribute('aria-controls'));
		            if (!otherPanel) return;
		
		            // 이미 닫혀 있으면 건드리지 않음
		            if (!otherPanel.hidden) {
		              otherHeader.setAttribute('aria-expanded', 'false');
		
		              // 현재 높이에서 0으로 애니메이션
		              otherPanel.style.height = otherPanel.scrollHeight + 'px';
		              requestAnimationFrame(() => {
		                otherPanel.style.height = '0px';
		              });
		
		              otherPanel.addEventListener('transitionend', function end() {
		                otherPanel.hidden = true;
		                otherPanel.style.height = '';
		                otherPanel.removeEventListener('transitionend', end);
		              });
		            } else {
		              otherHeader.setAttribute('aria-expanded', 'false');
		              otherPanel.hidden = true;
		              otherPanel.style.height = '';
		            }
		          });
		
		          // 2) 클릭한 패널 토글
		          if (isExpanded) {
		            // 닫기
		            header.setAttribute('aria-expanded', 'false');
		            panel.style.height = panel.scrollHeight + 'px';
		            requestAnimationFrame(() => {
		              panel.style.height = '0px';
		            });
		            panel.addEventListener('transitionend', function end() {
		              panel.hidden = true;
		              panel.style.height = '';
		              panel.removeEventListener('transitionend', end);
		            });
		          } else {
		            // 열기
		            header.setAttribute('aria-expanded', 'true');
		            panel.hidden = false;
		            panel.style.height = '0px';
		            requestAnimationFrame(() => {
		              panel.style.height = panel.scrollHeight + 'px';
		            });
		            panel.addEventListener('transitionend', function end() {
		              panel.style.height = 'auto'; // 열려있는 동안은 auto 유지
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="wrap-personality">
<security:authorize access="isAuthenticated()">
	<div class="dv-part"><span><security:authentication property="principal.adminUser.dept" /></span></div>
	<div class="dv-name"><span><security:authentication property="principal.adminUser.name" /></span><em>님</em></div>
	<div class="bx-btn"><a class="btns btn-back-w" href="<c:url value="/admin/logout"/>"><span>로그아웃</span></a><a id="btn-password-change-popup" class="btns btn-back-w" style="width: 92px;"><span>비밀번호변경</span></a></div>
	<div class="bx-info">
		<security:authentication property="principal.adminUser.loginDt" var="loginDt"/>

		<c:set var="sLoginDt" value="${loginDt}"/>
		<c:set var="reLoginDt" value="${fn:replace(sLoginDt, 'T', ' ')}"/>

		<p><span>최근 로그인</span></p>
		<p><span><c:out value="${reLoginDt}"/></span></p>
		<br>
		<p><span>최근 접속IP</span></p>
		<p><span><security:authentication property="principal.adminUser.loginIp" /></span></p>
	</div>
</security:authorize>
</div>

<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<div class="lnb">

	<c:if test="${null ne path && fn:contains(path, '/admin/main')}">
	<ul class="depth-01">
		<li><a href="/admin/main/banner" <c:if test="${fn:contains(path, '/admin/main/banner')}">class="on"</c:if>>배너 관리</a></li>
		<li><a href="/admin/main/popup" <c:if test="${fn:contains(path, '/admin/main/popup')}">class="on"</c:if>>팝업 관리</a></li>
	</ul>
	</c:if>

	<c:if test="${null ne path && fn:contains(path, '/admin/contents')}">
	<ul class="depth-01">
		<li><a href="/admin/contents/people" <c:if test="${path eq '/admin/contents/people'}">class="on"</c:if>>People 관리</a></li>
		<li><a href="/admin/contents/license" <c:if test="${path eq '/admin/contents/license'}">class="on"</c:if>>면허 관리</a></li>
		<li><a href="/admin/contents/board" <c:if test="${path eq '/admin/contents/board'}">class="on"</c:if>>최신뉴스 관리</a></li>
		<li><a href="/admin/contents/press" <c:if test="${path eq '/admin/contents/press'}">class="on"</c:if>>보도자료 관리</a></li>
		<li><a href="/admin/contents/donate" <c:if test="${path eq '/admin/contents/donate'}">class="on"</c:if>>CSR(사회공헌) 관리</a></li>
	</ul>
	</c:if>

	<c:if test="${null ne path && fn:contains(path, '/admin/invest')}">
	<ul class="depth-01">
		<li><a href="/admin/invest/finance/main" <c:if test="${fn:contains(path, '/admin/invest/finance')}">class="on"</c:if>>재무정보</a>
			<ul class="depth-02">
				<li><a <c:if test="${fn:contains(path, '/admin/invest/finance/main')}">class="on"</c:if> href="/admin/invest/finance/main">주요경영실적</a></li>
				<li><a <c:if test="${fn:contains(path, '/admin/invest/finance/summary')}">class="on"</c:if> href="/admin/invest/finance/summary">요약재무재표</a></li>
			</ul>
		</li>
		<li><a href="/admin/invest/refer/eAnno" <c:if test="${fn:contains(path, '/admin/invest/refer/eAnno')}">class="on"</c:if>>전자공고 및 공시</a>
			<ul class="depth-02">
				<li><a <c:if test="${fn:contains(path, '/admin/invest/refer/eAnno')}">class="on"</c:if> href="/admin/invest/refer/eAnno">전자공고</a></li>
			</ul>
		</li>
		<li><a href="/admin/invest/refer/ir" <c:if test="${fn:contains(path, '/admin/invest/refer/ir') or fn:contains(path, '/admin/invest/refer/annr') or fn:contains(path, '/admin/invest/refer/anar')}">class="on"</c:if>>IR 자료실</a>
			<ul class="depth-02">
				<li><a <c:if test="${fn:contains(path, '/admin/invest/refer/ir')}">class="on"</c:if> href="/admin/invest/refer/ir">IR Book</a></li>
				<li><a <c:if test="${fn:contains(path, '/admin/invest/refer/annr')}">class="on"</c:if> href="/admin/invest/refer/annr">Annual Report</a></li>
				<li><a <c:if test="${fn:contains(path, '/admin/invest/refer/anar')}">class="on"</c:if> href="/admin/invest/refer/anar">Analyst Report</a></li>
			</ul>
		</li>
		<li><a href="/admin/invest/stock/shcp" <c:if test="${fn:contains(path, '/admin/invest/stock')}">class="on"</c:if>>주식 및 주주정보 관리</a>
			<ul class="depth-02">
				<li><a <c:if test="${fn:contains(path, '/admin/invest/stock/shcp')}">class="on"</c:if> href="/admin/invest/stock/shcp">주주구성</a></li>
				<li><a <c:if test="${fn:contains(path, '/admin/invest/stock/shmt')}">class="on"</c:if> href="/admin/invest/stock/shmt">주주총회</a></li>
				<li><a <c:if test="${fn:contains(path, '/admin/invest/stock/dvst')}">class="on"</c:if> href="/admin/invest/stock/dvst">배당현황</a></li>
			</ul>
		</li>
	</ul>
	</c:if>

	<c:if test="${null ne path && fn:contains(path, '/admin/project')}">
	<ul class="depth-01">
		<li><a href="/admin/project" <c:if test="${path eq '/admin/project' || fn:contains(path, '/admin/project/view') || fn:contains(path, '/admin/project/proc')}">class="on"</c:if>>Project 관리</a></li>
		<li><a href="/admin/project/item" <c:if test="${path eq '/admin/project/item'}">class="on"</c:if>>Project 항목 관리</a></li>
	</ul>
	</c:if>

	<c:if test="${null ne path && fn:contains(path, '/admin/custInqr')}">
	<ul class="depth-01">
		<li><a href="/admin/custInqr" <c:if test="${fn:contains(path, '/admin/custInqr')}">class="on"</c:if>>고객문의 관리</a></li>
	</ul>
	</c:if>

	<c:if test="${null ne path && fn:contains(path, '/admin/manage')}">
	<ul class="depth-01">
		<li><a href="/admin/manage/msgProp" <c:if test="${fn:contains(path, '/admin/manage/msgProp')}">class="on"</c:if>>메시지 프로퍼티 관리</a></li>
		<li><a href="/admin/manage/excelUpload" <c:if test="${fn:contains(path, '/admin/manage/excelUpload')}">class="on"</c:if>>초기 데이터 관리</a></li>
		<li><a href="/admin/manage/downloadExcelForDBTableSpecs" <c:if test="${fn:contains(path, '/admin/manage/downloadExcelForDBTableSpecs')}">class="on"</c:if>>테이블정의서 다운로드<br />(화면없음.)</a></li>
		<li><a href="/admin/manage/downloadExcelSheetsByTableForDBTableSpecs" <c:if test="${fn:contains(path, '/admin/manage/downloadExcelSheetsByTableForDBTableSpecs')}">class="on"</c:if>>테이블정의서 다운로드<br />(화면없음. 테이블별 시트.)</a></li>
	</ul>
	</c:if>
</div>
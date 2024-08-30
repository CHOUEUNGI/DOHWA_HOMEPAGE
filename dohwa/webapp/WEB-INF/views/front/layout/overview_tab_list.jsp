<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="activeMenu" value="${fn:split(path, '/')[fn:length(fn:split(path, '/'))-1] }" />
<ul class="tab-list">
	<li ${activeMenu eq 'overview' ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/overview" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001" /></a>
	</li>
	<li ${activeMenu eq 'vision' ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/vision" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002" /></a>
	</li>
	<li ${activeMenu eq 'people' ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/people" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003" /></a>
	</li>
	<li ${activeMenu eq 'history' ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/history" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004" /></a>
	</li>
	
	<c:set var="csrFlag" value="${activeMenu eq 'csr_01' or activeMenu eq 'csr_02' or activeMenu eq 'csr_03' 
			or fn:contains(path, 'speak') or fn:contains(path, 'tipoff') or fn:contains(path, 'result') }" />
	<li ${csrFlag or fn:contains(path, 'result') ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/csr_01" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005" /></a>
	</li>
	
	<c:set var="contactusFlag" value="${activeMenu eq 'contactus' or activeMenu eq 'overseas' or activeMenu eq 'custInqr' }" />
	<li ${contactusFlag ? 'class="active"' : '' }>
		<a class="item" href="/aboutus/contactus" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006" /></a>
	</li>
</ul>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="activeMenu" value="${fn:split(path, '/')[fn:length(fn:split(path, '/'))-1] }" />
<ul class="tab-list">
	
	<c:set var="dirFlag" value="${activeMenu eq 'director' or activeMenu eq 'article' or activeMenu eq 'committee' 
			or fn:contains(path, 'invest') or fn:contains(path, 'tipoff') or fn:contains(path, 'result') }" />
	<li ${dirFlag or fn:contains(path, 'result') ? 'class="active"' : '' }>
		<a class="item" href="/invest/director" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005" /></a>
	</li>

	<li ${activeMenu eq 'finance' ? 'class="active"' : '' }>
		<a class="item" href="/invest/finance" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001" /></a>
	</li>
	<li ${activeMenu eq 'eAnno' ? 'class="active"' : '' }>
		<a class="item" href="/invest/eAnno" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" /></a>
	</li>
	<li ${activeMenu eq 'ir' ? 'class="active"' : '' }>
		<a class="item" href="/invest/ir" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" /></a>
	</li>
	<li ${activeMenu eq 'stock' ? 'class="active"' : '' }>
		<a class="item" href="/invest/stock" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" /></a>
	</li>
</ul>

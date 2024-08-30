<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="activeMenu" value="${fn:split(path, '/')[fn:length(fn:split(path, '/'))-1] }" />
<ul class="tab-list swiper-wrapper">
	<li ${activeMenu eq 'overview' ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/overview" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001" /></a>
	</li>
	<li ${activeMenu eq 'vision' ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/vision" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002" /></a>
	</li>
	<li ${activeMenu eq 'people' ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/people" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003" /></a>
	</li>
	<li ${activeMenu eq 'history' ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/history" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004" /></a>
	</li>
	
	<c:set var="csrFlag" value="${activeMenu eq 'csr_01' or activeMenu eq 'csr_02' or activeMenu eq 'csr_03' or fn:contains(path, 'speak') or fn:contains(path, 'tipoff') or fn:contains(path, 'result') }" />
	<li ${csrFlag or fn:contains(path, 'result') ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/csr_01" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005" /></a>
	</li>
	
	<c:set var="contactusFlag" value="${activeMenu eq 'contactus' or activeMenu eq 'overseas' or activeMenu eq 'custInqr' }" />
	<li ${contactusFlag ? 'class="swiper-slide active"' : 'class="swiper-slide"' }>
		<a class="item" href="<c:url value="${mobileStartPath}aboutus/contactus" />" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006" /></a>
	</li>
</ul>

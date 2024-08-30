<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("newLineChar", "\n"); %> <%--개행문자 --%>
<% pageContext.setAttribute("_lang", response.getLocale().getLanguage()); %> <%--언어코드 소문자. --%>
<c:url var="contextPath" value="/" scope="request"/>
<spring:eval var="WEB_URL" scope="request" expression="@config['web.url']" />
<c:set var="rowPerPage" value="10" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta charset="utf-8" />
<c:choose>
	<c:when test="${'ko' eq _lang }">
		<title>도화엔지니어링</title>
	</c:when>
	<c:when test="${'en' eq _lang }">
		<title>DOHWA ENGINEERING</title>
	</c:when>
	<c:when test="${'es' eq _lang }">
		<title>DOHWA ENGINEERING</title>
	</c:when>
	<c:otherwise>
		<title><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" /></title>
	</c:otherwise>
</c:choose>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta property="og:title" content="" />
<meta property="og:url" content="" />
<meta property="og:image" content="" />
<meta property="og:description" content="" />
<link rel="shortcut icon" href="/resources/favicon.ico" />
<link href="/inc/css/font.css" type="text/css" rel="stylesheet" />
<link href="/inc/css/reset.css" type="text/css" rel="stylesheet" />
<link href="/inc/css/print.css" type="text/css" rel="stylesheet" />
<link href="/inc/css/common.css" type="text/css" rel="stylesheet" />
<link href="/inc/css/category.css" type="text/css" rel="stylesheet" />
<link href="/inc/css/swiper.css" type="text/css" rel="stylesheet" />
<!-- // am_chart start  
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/dataviz.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/material.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/kelly.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/dark.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/frozen.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/moonrisekingdom.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/spiritedaway.js?ver=20200717-eac'></script>
<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/animated.js?ver=20200717-eac'></script>
 // am_chart end  -->
<!-- kakao talk -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- //kakao talk -->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-146339006-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-146339006-1');
</script>
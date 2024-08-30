<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("newLineChar", "\n"); %> <%--개행문자 --%>
<c:url var="contextPath" value="/" scope="request"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="Author" content="">
<link href="<c:url value="/admin/css/admin.css"/>" type="text/css" rel="stylesheet" class="head-css">
<title>도화 엔지니어링 관리자</title>
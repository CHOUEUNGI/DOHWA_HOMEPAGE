<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 지도-->
<!-- 영상-->
<!-- paging-->
<!-- location-->
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/views/front/layout/head.jsp" %>
	</head>
	<body>
		<div class="etc etc-error" id="wrap">
			<div id="container">
				<div id="content" role="main">
					<div class="contents">
						<div class="section-cont">
							<img src="/images/common/img_footer_logo.jpg" alt="DOHWA 엔지니어링" />
							<h2 class="title-sect">서비스 이용에 불편을 드려 죄송합니다.</h2>
							<i class="ico-exmark" aria-hidden="true"></i>
							<div class="error-msg">
								<p>요청하신 페이지는 접근권한이 없거나, 사용이 중지된 페이지로 존재하지 않습니다.</p>
								<p>다시 한번 URL을 확인하시고 접근을 시도해 주시기 바랍니다. 감사합니다.</p>
							</div>
							<div class="bttn-area">
								<a class="bttn type01 style02" href="<c:url value="/admin/main/banner" />">
									<span class="txt01">돌아가기</span>
									<i class="ico01" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
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
								<p>일시적인 서버장애로 인하여 요청하신 서비스를 진행하지 못하고 있습니다.</p>
								<p>원활한 서비스를 제공하지 못해 대단히 죄송하며, 잠시 후 다시 서비스를 이용해 주시길 바랍니다.</p>
								<p>빠른 시간 안에 정상 서비스하도록 하겠습니다. 감사합니다.</p>
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
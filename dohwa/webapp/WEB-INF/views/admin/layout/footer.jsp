<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test='${not empty sessionScope.DOHWA_MESSAGE}'>
<script type="text/javascript">
	alert('<c:out value="${sessionScope.DOHWA_MESSAGE}" />');
</script>
<c:remove var="DOHWA_MESSAGE" scope="session" />
</c:if>
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
            	<div class="pop-inner-type01">
	                <div class="find-info">
						<label for="nameBox">기존 비밀번호</label>
						<div class="ip-area"><input class="ip-text" type="password" title="비밀번호" id="pswd"></div>
					</div>
					<div class="find-info">
						<label for="nameBox">변경 비밀번호</label>
						<div class="ip-area"><input class="ip-text" type="password" title="비밀번호" id="updPswd"></div>
					</div>
					<div class="find-info">
						<label for="nameBox">변경 비밀번호 확인</label>
						<div class="ip-area"><input class="ip-text" type="password" title="비밀번호확인" id="updPswdRe"></div>
					</div>
				</div>
                <div class="btn-r">
                	<a class="btn-layerSave">저장</a>
                    <a class="btn-layerClose">닫기</a>
                </div>
            </div>
        </div>
    </div>
</div>
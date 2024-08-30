<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
</head>
<body>
	<div class="wrap"><a href="#contents" class="skip">본문바로가기</a>
		<div id="header"><%@ include file="/WEB-INF/views/admin/layout/header.jsp" %></div>
		<div id="container">
			<div id="lefter"><%@ include file="/WEB-INF/views/admin/layout/lefter.jsp" %></div>
			<div class="wrap-cont">
				<h2 style="margin-bottom: 50px;">People 관리</h2>
				<form:form id="form" modelAttribute="peopleVO" method="post">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" onclick="return false;" delete-btn><span>삭제</span></a>
						<a class="btns btn-back-o" href="/admin/contents/people/save?_method=update"><span>수정</span></a>
						<a class="btns btn-back-o" href="/admin/contents/people/save?_method=insert"><span>등록</span></a>
					</div>
					<div class="wrap-tb tb-list" style="overflow:auto; height: 700px;">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:3%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="">
								<col style="width:18%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>순서</th>
									<th>노출</th>
									<th>이름</th>
									<th>직급</th>
									<th>부서명</th>
									<th>Interview</th>
									<th>이미지</th>
									<th>등록일시</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${peopleList }" var="list" varStatus="sts">
								
								<tr>
									<td><span class="chk-box"><input type="checkbox" name="seq" value="${list.seq }"></span></td>
									<td><c:out value="${list.order }"></c:out></td>
									<td><c:out value="${list.dispYn eq 'Y' ? '노출' : '미노출' }"></c:out></td>
									<td><c:out value="${list.peopleMlVO.name }"></c:out></td>
									<td><c:out value="${list.peopleMlVO.staffLevel }"></c:out></td>
									<td><c:out value="${list.peopleMlVO.partname }"></c:out></td>
									<td style="text-align: left;"><c:out value="${list.peopleMlVO.interview }"></c:out></td>
									<td style="text-align: left;"><c:out value="${list.fileVO.orgName }"></c:out></td>
									<td>
										<fmt:parseDate value="${list.regDt}" pattern="yyyy-MM-dd'T'HH:mm" var="regDt" type="both"/>
										<fmt:formatDate value="${regDt}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
								</tr>
							
							</c:forEach>
							
							<c:if test="${fn:length(peopleList) <= 0 }">
							
								<tr>
									<td colspan="9">등록된 정보가 없습니다.</td>
								</tr>
							
							</c:if>
								
							</tbody>
						</table>
					</div>
				</form:form>
				<%@include file="/WEB-INF/views/admin/layout/pagination.jsp" %>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/admin/layout/after_script.jsp" %>
	<script type="text/javascript">
	
		$(function() {
			
			// 전체 체크박스 선택 event
			$('#checkAll').on('click', function() {

				if ($(this).prop('checked')) {
					$('input[name="seq"]').prop('checked', true);
				} else {
					$('input[name="seq"]').prop('checked', false);
				}
			});
			
			// 삭제 체크박스 선택 event
			$('input[name="seq"]').on('click', function() {

				if ($('input[name="seq"]:not(:checked)').length > 0) {
					$('#checkAll').prop('checked', false);
				} else {
					$('#checkAll').prop('checked', true);
				}
			});
			
			// 삭제 버튼 event
			$('[delete-btn]').on('click', function() {
				
				if ($('input[name="seq"]:checked').length <= 0) {
					
					alert('<spring:message code="ADMIN.VALIDATE.DELETE.NOCHECKED" javaScriptEscape="true" />');
					return false;
				}
				
				if (confirm('<spring:message code="ADMIN.VALIDATE.DELETE.CONFIRM" javaScriptEscape="true" />')) {
					
					$('#form').attr('action', '/admin/contents/people/delete').submit();
				}
			});
		});
	
	</script>
</body>
</html>
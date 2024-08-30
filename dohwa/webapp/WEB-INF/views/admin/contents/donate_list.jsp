<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h2 style="margin-bottom: 50px;">CSR(사회공헌) 관리 조회</h2>
				<form:form id="form" modelAttribute="searchVO" method="get" action="/admin/contents/donate">
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:90%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<div class="ip-area" style="float: right; width: 300px;">
											<form:input path="searchText" class="ip-text" placeholder="검색어를 입력해주세요" title="검색어 입력" />
										</div>
									</td>
									<td class="btn-searchform" btn-search>검 색</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" onclick="return false;" delete-btn><span>삭제</span></a>
						<a class="btns btn-back-o" onclick="return false;" insert-btn><span>등록</span></a>
					</div>
					<div class="bx-btn a-right">
						<p class="page-sum float-left">조회결과 <span class="cl-orange"><c:out value="${page.totalCount }" /></span>건</p>
					</div>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:8%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>번호</th>
									<th>구분</th>
									<th>제목</th>
									<th>등록일</th>
									<th>공개여부</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${donateList }" var="list" varStatus="sts">
								<tr>
									<td><span class="chk-box"><input type="checkbox" name="seq" value="${list.seq }"></span></td>
									<td><c:out value="${page.totalCount - page.startRowNum - sts.index + 1}"/></td>
									<td><c:out value="${list.typeCd eq '01' ? '희망나눔기금' : '봉사활동' }" /></td>
									<td style="text-align: left;">
										<a href="#" onclick="return false;" data-url="/admin/contents/donate/save/${list.seq }"><c:out value="${list.koTitle }" /></a>
									</td>
									<td><c:out value="${list.writeDt }" /></td>
									<td><c:out value="${list.dispYn eq 'Y' ? '공개' : '비공개' }" /></td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(donateList) <= 0 }">
								<tr>
									<td colspan="6">등록된 정보가 없습니다.</td>
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
		function goViewPage(url) {
			
			var linkForm = $('<form/>', {method:'get', action:url});
			linkForm.append($('<input/>',{type:'hidden', name:'page', value:'${searchVO.page}'}));
			linkForm.append($('<input/>',{type:'hidden', name:'searchText', value:'${searchVO.searchText}'}));
			linkForm.append($('<input/>',{type:'hidden', name:'searchLangType', value:'${searchVO.searchLangType}'}));
			$('#form').after(linkForm);
			
			linkForm.submit();
		}
	
		$(function() {
			
			// 검색 버튼 event
			$('[btn-search]').on('click', function() {
				$('#form').submit();
			});
			
			// 등록 버튼 event
			$('[insert-btn]').on('click', function() {
				
				goViewPage('/admin/contents/donate/save');
			});	
			
			// 상세 이동 Link event
			$('[data-url]').on('click', function() {
				
				goViewPage($(this).data('url'));
			});
			
			// 전체 체크박스 선택 event
			$('#checkAll').on('click', function() {

				$('input[name="seq"]').prop('checked', $(this).prop('checked'));
			});
			
			// 삭제 체크박스 선택 event
			$('input[name="seq"]').on('click', function() {

				$('#checkAll').prop('checked', $('input[name="seq"]:not(:checked)').length <= 0);
			});
			
			// 삭제 버튼 event
			$('[delete-btn]').on('click', function() {
				
				if ($('input[name="seq"]:checked').length <= 0) {
					
					alert('<spring:message code="ADMIN.VALIDATE.DELETE.NOCHECKED" javaScriptEscape="true" />');
					return false;
				}
				
				if (confirm('<spring:message code="ADMIN.VALIDATE.DELETE.CONFIRM" javaScriptEscape="true" />')) {
					
					$('#form').attr('method', 'post').attr('action', '/admin/contents/donate/delete').submit();
				}
			});
		});
		
	</script>
</body>
</html>
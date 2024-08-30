<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<h2 style="margin-bottom: 50px;">투자정보 관리 > 재무정보 > 요약재무재표 조회</h2>
				<form:form id="form" modelAttribute="searchVO" method="post">
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th>검색</th>
									<td>
										<div class="ip-area selec">
											<form:select path="searchType" name="searchType">
												<option value="title">구분(연도)</option>
											</form:select>
										</div>
										<div class="ip-area w90">
											<form:input path="searchText" name="" class="ip-text" placeholder="검색어를 입력해주세요" title="검색어 입력" />
										</div>
									</td>
									<td class="btn-searchform" id="searchButton">검 색</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-back-o" id="deleteButton"><span>삭제</span></a>
						<a class="btns btn-line-g" href="/admin/invest/finance/summary/0"><span>등록</span></a>
					</div>
					<div class="bx-btn a-right">
						<p class="page-sum float-left">조회결과 <span class="cl-orange"><c:out value="${page.totalCount }"></c:out> </span>건</p>
					</div>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:20%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>번호</th>
									<th>구분(연도)</th>
									<th>등록일</th>
									<th>공개여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
								<tr>
									<td colspan="5">조회 데이터가 없습니다.</td>
								</tr>
								</c:if>

								<c:if test="${not empty list}">
									<c:forEach items="${list }" var="row" varStatus="stat">
									<tr>
										<td><span class="chk-box"><input type="checkbox" id="chk_<c:out value="${row.yyyy }"/>" name="delSeq" value="<c:out value="${row.yyyy }"/>"><label class="chk hidden" for="chk_<c:out value="${row.yyyy }"/>">선택</label></span></td>
										<td><c:out value="${page.totalCount - page.startRowNum - stat.index + 1 }"/></td>
										<td><a href="/admin/invest/finance/summary/<c:out value="${row.yyyy }"/>"><c:out value="${row.yyyy }"/></a></td>
										<td>
											<fmt:parseDate value="${row.regDt}" pattern="yyyy-MM-dd'T'HH:mm" var="convRegDt" type="both"/>
											<fmt:formatDate value="${convRegDt}" pattern="yyyy-MM-dd"/>
										</td>
										<td><c:out value="${row.dispYnNm }"/></td>
									</tr>
									</c:forEach>
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
	'use strict';

	(function ($) {

		var form = $('#form');
		var checkAll = $('#checkAll');
		var check = form.find(':checkbox').not(checkAll);

		$('#searchButton').on('click', function (e) {
			e.preventDefault();
			form.submit();
		});

		$('#deleteButton').on('click', function(e) {
			e.preventDefault();

			if(0 == $('[name=delSeq]:checked').length) {
				alert("체크된 항목이 없습니다.");
				return;
			}

			if(!confirm("선택한 항목을 정말 삭제하시겠습니까?")) {
				return;
			}

			var arrYyyy = new Array();
			$('[name=delSeq]:checked').each(function(){
				arrYyyy.push($(this).val());
			});

			$.ajax({
				url : '/admin/invest/finance/summary/delete',
				type : 'post',
				data : {
					arrYyyy : arrYyyy.join(','),
				},
				dataType: 'json',
				success : function(data) {
					alert(data.message);
					if(data.success){
						location.reload();
					}
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});

		});

		checkAll.on('click', function () {
			check.prop('checked', $(this).prop('checked'));
		});

		check.on('click', function () {
			checkAll.prop('checked', check.length === check.filter(':checked').length);
		});

	}(jQuery));
	</script>
</body>
</html>
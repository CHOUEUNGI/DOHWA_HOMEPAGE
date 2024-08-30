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
				<c:if test="${not empty financeVO.yyyy }">
				<h2 style="margin-bottom: 50px;">투자정보 관리 > 재무정보 > 주요경영실적 수정 ( * 필수등록 )</h2>
				</c:if>
				<c:if test="${empty financeVO.yyyy }">
				<h2 style="margin-bottom: 50px;">투자정보 관리 > 재무정보 > 주요경영실적 등록 ( * 필수등록 )</h2>
				</c:if>
				<form:form id="form" modelAttribute="financeVO" method="post">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="/admin/invest/finance/main"><span>취소</span></a>
						<a class="btns btn-back-o" id="saveButton"><span>저장</span></a>
					</div>
					<div class="wrap-tb tb-search">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;구분(연도)</th>
									<td colspan="3">
										<div class="ip-area w5">
											<form:input path="yyyy" title="구분(연도)" type="text" class="ip-text" maxlength="4" readonly="readonly"></form:input>
										</div>
										<form:errors path="yyyy" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;공개여부</th>
									<td>
										<span class="radio-box">
											<form:radiobutton path="dispYn" value="N" label="비공개"  />&nbsp;&nbsp;
											<form:radiobutton path="dispYn" value="Y" label="공개" />
										</span>
										<form:errors path="dispYn" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;매출액(억원)</th>
									<td colspan="3">
										<div class="ip-area w10">
											<form:input path="salesAmt" title="매출액(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="salesAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;영업이익(억원)</th>
									<td colspan="3">
										<div class="ip-area w10">
											<form:input path="oprtIncmAmt" title="영업이익(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="oprtIncmAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;신규수주(억원)</th>
									<td colspan="3">
										<div class="ip-area w10">
											<form:input path="newOrdrAmt" title="신규수주(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="newOrdrAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;수주잔고(억원)</th>
									<td colspan="3">
										<div class="ip-area w10">
											<form:input path="ordrBcklAmt" title="수주잔고(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="ordrBcklAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/admin/layout/after_script.jsp" %>
	<script type="text/javascript">
	'use strict';

	(function ($) {
		var form = $('#form');

		$('#saveButton').on('click', function(e) {
			e.preventDefault();

			if(!confirm("저장하시겠습니까?")) {
				return;
			}

			form.attr('method', 'post');
			<c:if test="${not empty financeVO.yyyy }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'update'}))
			</c:if>
			<c:if test="${empty financeVO.yyyy }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'insert'}))
			</c:if>
			form.submit();
		});
	}(jQuery));
	</script>
</body>
</html>
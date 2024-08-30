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
				<h2 style="margin-bottom: 50px;">
					투자정보 관리 > 주식 및 주주정보 > 배당현황 <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
				</h2>
				<form:form id="form" modelAttribute="stockVO"  method="post" enctype="multipart/form-data">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="<c:out value="${parentURI}"/>"><span>취소</span></a>
						<a class="btns btn-back-o" id="saveButton"><span>저장</span></a>
					</div>
					<div class="wrap-tb tb-search">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;언어</th>
									<td>
										<span class="radio-box">
											<form:radiobutton path="lang" value="KO" label="국문" />&nbsp;&nbsp;
											<form:radiobutton path="lang" value="EN" label="영문" />&nbsp;&nbsp;
											<form:radiobutton path="lang" value="ES" label="스페인" />&nbsp;&nbsp;
										</span>
										<form:errors path="lang" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;구분(연도)</th>
									<td>
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
											<form:radiobutton path="dispYn" value="N" label="비공개"/>&nbsp;&nbsp;
											<form:radiobutton path="dispYn" value="Y" label="공개" />
										</span>
										<form:errors path="dispYn" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주당액면가액(원)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="pvpsAmt" title="주당액면가액" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="pvpsAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;당기순이익 (백만원)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="nticAmt" title="당기순이익" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="nticAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주당순이익 (원)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="ntpsAmt" title="주주당순이익" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="ntpsAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;현금배당금총액 (백만원)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="tcdvAmt" title="현금배당금총액" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="tcdvAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;현금배당성향 (%)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="cdpoRatio" title="현금배당성향" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="cdpoRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;현금배당수익률 (%)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="cdpoRate" title="현금배당수익률" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="cdpoRate" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주당 현금배당금 (원)</th>
									<td>
										<div class="ip-area w100">
											<form:input path="cdpsAmt" title="주당 현금배당금 (원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="cdpsAmt" cssStyle="color: #ff0000;" />
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
			<c:if test="${stockVO.seq > 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'update'}))
			</c:if>
			<c:if test="${stockVO.seq <= 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'insert'}))
			</c:if>
			form.submit();
		});

	}(jQuery));
	</script>
</body>
</html>
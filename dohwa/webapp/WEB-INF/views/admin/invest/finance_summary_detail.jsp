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
				<h2 style="margin-bottom: 50px;">투자정보 관리 > 재무정보 > 요약재무재표 수정 ( * 필수등록 )</h2>
				</c:if>
				<c:if test="${empty financeVO.yyyy }">
				<h2 style="margin-bottom: 50px;">투자정보 관리 > 재무정보 > 요약재무재표 등록 ( * 필수등록 )</h2>
				</c:if>
				<form:form id="form" modelAttribute="financeVO" method="post">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="/admin/invest/finance/summary"><span>취소</span></a>
						<a class="btns btn-back-o" id="saveButton"><span>저장</span></a>
					</div>
					<div class="wrap-tb tb-search">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;구분(연도)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="yyyy" title="구분(연도)" type="text" class="ip-text" maxlength="4" readonly="readonly"></form:input>
										</div>
										<form:errors path="yyyy" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;공개여부</th>
									<td>
										<span class="radio-box">
											<form:radiobutton path="dispYn" value="N" label="비공개" />&nbsp;&nbsp;
											<form:radiobutton path="dispYn" value="Y" label="공개" />
										</span>
										<form:errors path="dispYn" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<td colspan="3" class="tr-title"> - 손익계산서 </td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;영업수익(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="oprtRvnsAmt" title="영업수익(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="oprtRvnsAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;영업비용(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="oprtAmt" title="영업비용(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="oprtAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;영업이익(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="oprtIncmAmt" title="영업이익(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="oprtIncmAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;법인세비용 차감전순이익(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="incmBftxExpnAmt" title="법인세비용 차감전순이익(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="incmBftxExpnAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;당기순이익(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="netIncmAmt" title="당기순이익(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="netIncmAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<td colspan="3" class="tr-title"> ㅡ 재무상태표 </td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;유동자산(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="currAsstAmt" title="유동자산(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="currAsstAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;비유동자산(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="nonCurrAsstAmt" title="비유동자산(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="nonCurrAsstAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr class="tr-summary">
									<th colspan="2"><span class="required">필수항목</span>&nbsp;자산총계(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="totAsstAmt" title="자산총계(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="totAsstAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;유동부채(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="currLbltAmt" title="유동부채(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="currLbltAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;비유동부채(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="nonCurrLbltAmt" title="비유동부채(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="nonCurrLbltAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr class="tr-summary">
									<th colspan="2"><span class="required">필수항목</span>&nbsp;부채총계(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="totLbltAmt" title="부채총계(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="totLbltAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr class="tr-summary">
									<th colspan="2"><span class="required">필수항목</span>&nbsp;자본총계(억원)</th>
									<td>
										<div class="ip-area w10">
											<form:input path="totCptlAmt" title="자본총계(억원)" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="totCptlAmt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<td colspan="3" class="tr-title"> - 주요지표 </td>
								</tr>
								<tr>
									<th rowspan="4">수익성</th>
									<th><span class="required">필수항목</span>&nbsp;PER</th>
									<td>
										<div class="ip-area w10">
											<form:input path="per" title="PER" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="per" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;ROE</th>
									<td>
										<div class="ip-area w10">
											<form:input path="roe" title="ROE" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="roe" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;PBR</th>
									<td>
										<div class="ip-area w10">
											<form:input path="pbr" title="PBR" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="pbr" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr class="tr-summary">
									<th><span class="required">필수항목</span>&nbsp;영업이익률</th>
									<td>
										<div class="ip-area w10">
											<form:input path="oprtMrgn" title="영업이익률" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="oprtMrgn" cssStyle="color: #ff0000;" />
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

		<c:if test="${empty financeVO.yyyy }">
		$('#dispYn1').prop('checked','checked');	// 등록시 기본적으로 비공개 설정.
		</c:if>

	}(jQuery));
	</script>
</body>
</html>
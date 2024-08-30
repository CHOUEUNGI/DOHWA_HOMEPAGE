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
					투자정보 관리 > 주식 및 주주정보 > 주주구성  <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
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
									<td colspan="2" class="tr-title"> - 주식분포 현황 </td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;기준일</th>
									<td>
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_start"
													type="text"
													path="stdDate"
													value=""
													readonly="readonly" />
										</div>
										<form:errors path="stdDate" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;최대주주/특수관계인</th>
									<td>
										<div class="ip-area w100">
											<form:input path="lgshRatio" title="최대주주/특수관계인" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="lgshRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;기타주주</th>
									<td>
										<div class="ip-area w100">
											<form:input path="otshRatio" title="기타주주" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="otshRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주요주주(10%)/1인</th>
									<td>
										<div class="ip-area w100">
											<form:input path="mjshRatio" title="주요주주(10%)/1인" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="mjshRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;자기주식</th>
									<td>
										<div class="ip-area w100">
											<form:input path="trshRatio" title="자기주식" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="trshRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;우리주식</th>
									<td>
										<div class="ip-area w100">
											<form:input path="orshRatio" title="우리주식" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="orshRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 주식소유 현황 -->
						<table style="border-top: 0px solid #666666;">
							<caption>주식소유 현황</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:23%;">
								<col style="width:34%;">
								<col style="width:33%;">
							</colgroup>
							<tbody>
								<tr class="tr-title">
									<td colspan="4">- 주식소유 현황</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;기준일</th>
									<td  colspan="3">
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_start"
													type="text"
													path="ownStdDate"
													value=""
													readonly="readonly" />
										</div>
										<form:errors path="ownStdDate" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;성명</th>
									<th><span class="required">필수항목</span>&nbsp;소유주식주</th>
									<th><span class="required">필수항목</span>&nbsp;지분율</th>
								</tr>
								<c:forEach begin="0" end="4" step="1" varStatus="ownrStat">
								<tr>
									<td colspan="2">
										<div class="ip-area w100">
											<form:input path="stockOwnerList[${ownrStat.index }].name" title="성명" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="stockOwnerList[${ownrStat.index }].name" cssStyle="color: #ff0000;" />
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="stockOwnerList[${ownrStat.index }].showCnt" title="소유주식주" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="stockOwnerList[${ownrStat.index }].showCnt" cssStyle="color: #ff0000;" />
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="stockOwnerList[${ownrStat.index }].showRatio" title="지분율" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="stockOwnerList[${ownrStat.index }].showRatio" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<form:errors path="stockOwnerList" cssStyle="color: #ff0000;" />
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

		$.datepicker.formatDate();

	}(jQuery));
	</script>
</body>
</html>
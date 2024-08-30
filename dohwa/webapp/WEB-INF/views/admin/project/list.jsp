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
				<h2 style="margin-bottom: 50px;">Project 조회</h2>
				<form:form id="form" modelAttribute="searchVO" method="get">
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:%;">
								<col style="width:5%;">
							</colgroup>
							<tbody>
								<tr>
									<th>검색 조건</th>
									<td>
										<div class="ip-area selec">
											<form:select path="searchType1">
												<form:option value="" >Market</form:option>
												<form:options items="${markets}" itemValue="code" itemLabel="koText" />
											</form:select>
											<form:select path="searchType2">
												<form:option value="" >Service</form:option>
												<form:options items="${services}" itemValue="code" itemLabel="koText" />
											</form:select>
											<form:select path="searchType3">
												<form:option value="" >Region</form:option>
												<form:options items="${regions}" itemValue="code" itemLabel="koText" />
											</form:select>
										</div>
									</td>
									<td>
										<div class="ip-area selec">
											<form:select path="searchType">
												<form:option value="">전체</form:option>
												<form:option value="name">프로젝트 명</form:option>
												<form:option value="cont">설명</form:option>
											</form:select>
										</div>
										<div class="ip-area w90">
											<form:input path="searchText" class="ip-text" placeholder="검색어를 입력해주세요" title="검색어 입력" />
										</div>
									</td>
									<td class="btn-searchform" id="btn-search">검색</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" id="btn-del"><span>삭제</span></a>
						<a class="btns btn-back-o" href="/admin/project/view"><span>등록</span></a>
					</div>
					<div class="bx-btn a-right">
						<p class="page-sum float-left">조회결과 <span class="cl-orange"><c:out value="${page.totalCount }" /></span>건</p>
					</div>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:;">
								<col style="width:;">
								<col style="width:;">
								<col style="width:40%;">
								<col style="width:5%;">
								<col style="width:;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>번호</th>
									<th>노출여부</th>
									<th>Market</th>
									<th>Service</th>
									<th>Region</th>
									<th>프로젝트명</th>
									<th>-</th>
									<th>준공연도</th>
									<th>등록일시</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
								<tr>
									<td colspan="9">조회 데이터가 없습니다.</td>
								</tr>
								</c:if>
								<c:if test="${not empty list}">
								<c:forEach items="${list}" var="row" varStatus="stat">
								<tr>
									<td>
										<span class="chk-box"><input type="checkbox" name="seqs" value="<c:out value="${row.seq}"/>"></span>
									</td>
									<td><c:out value="${page.totalCount - page.startRowNum - stat.index + 1}"/></td>
									<td>
										<div class="ip-area selec">
											<select name="dispYn">
												<option <c:if test="${'Y' eq row.dispYn}">selected="selected"</c:if> value="Y">노출</option>
												<option <c:if test="${'N' eq row.dispYn}">selected="selected"</c:if> value="N">비노출</option>
											</select>
										</div>
									</td>
									<td><c:out value="${row.type1}"/></td>
									<td><c:out value="${row.type2}"/></td>
									<td><c:out value="${row.type3}"/></td>
									<td class="a-left"><a href="<c:url value="/admin/project/view/${row.seq}"/>"><c:out value="${row.projectMlVO.title}"/></a></td>
									<td><button type="button" onclick="window.open('<c:url value="/business/project/preview/${row.seq}"/>')">미리보기</button></td>
									<td><c:out value="${row.year}"/></td>

									<c:set var="sRegDt" value="${row.regDt}"/>
									<c:set var="reRegDt" value="${fn:replace(sRegDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reRegDt}" pattern="yyyy-MM-dd HH:mm" var="convRegDt" type="both"/>
									<td><fmt:formatDate value="${convRegDt}" pattern="yyyy-MM-dd HH:mm"/></td>
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
		// 검색
		$('#btn-search').off('click').on('click', function() {
			$('#form').submit();
		});

		// 삭제
		$('#btn-del').off('click').on('click', function() {
			if(0 === $('input[name="seqs"]:checked').length) {
				alert('선택된 건이 없습니다.');
			} else if(confirm('선택된 건을 삭제 하시겠습니까?')) {
				$('#form').append($('<input>',{type:'hidden', name:'_method', value:'delete'}));
				$('#form').attr('method', 'post').submit();
			}
		});

		// 전체 체크
		$('#checkAll').on('change', function() {
			$('input[name="seqs"]').prop('checked', $(this).is(':checked'));
		});

		// 체크 박스
		$('input[name="seqs"]').on('change', function() {
			var checked = $('input[name="seqs"]').length === $('input[name="seqs"]:checked').length ? true : false;
			$('#checkAll').prop('checked', checked);
		});
		
		// 노출 처리
		var preValue = '';
		$('select[name="dispYn"]').on('focus', function() {
			preValue = $(this).val();
		}).change(function() {

			if(confirm('노출 여부를 변경 하시겠습니까?')) {
				var o = {};
					o.seq = $(this).closest('tr').find('input[name="seqs"]').val();
					o.dispYn = $(this).val();

				projectDisp(o);
			} else {
				$(this).val(preValue);
			}

		});

		function projectDisp(o) {
			$.ajax({
				url : '/admin/project/disp',
				type : 'post',
				data : JSON.stringify(o),
				dataType: 'json',
				contentType: 'application/json',
				success : function(data) {
					alert(data.message);
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
	</script>
</body>
</html>
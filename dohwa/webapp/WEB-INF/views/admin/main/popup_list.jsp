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
				<h2 style="margin-bottom: 50px;">메인 팝업 조회</h2>
				<form:form id="form" modelAttribute="searchVO" method="get">
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th>언어</th>
									<td colspan="4">
										<div class="ip-area radio">
											<span><form:radiobutton path="searchLangType" value="KO" label=" 국문" /></span>
											<span><form:radiobutton path="searchLangType" value="EN" label=" 영문" /></span>
											<span><form:radiobutton path="searchLangType" value="ES" label=" 스페인" /></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>게시시간</th>
									<td colspan="4">
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_start" id="searchStartDate" path="searchStartDate" readonly="readonly"/>
										</div>
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_end" id="searchEndDate" path="searchEndDate" readonly="readonly"/>
										</div>
										<a class="btn-line-g" data-date="7"><span>1주일</span></a>
										<a class="btn-line-g" data-date="30"><span>1개월</span></a>
										<a class="btn-line-g" data-date="90"><span>3개월</span></a>
										<a class="btn-line-g" data-date="180"><span>6개월</span></a>
										<a class="btn-back-o" data-btn="clear"><span>초기화</span></a>
									</td>
								</tr>
								<tr>
									<th>사용여부</th>
									<td>
										<div class="ip-area radio">
											<span class="radio-box"><form:radiobutton path="searchDispYn" label=" 전체" value="" checked="checked" /></span>
											<span class="radio-box"><form:radiobutton path="searchDispYn" label=" 노출" value="Y" /></span>
											<span class="radio-box"><form:radiobutton path="searchDispYn" label=" 비노출" value="N" /></span>
										</div>
									</td>
									<th>검색</th>
									<td>
										<div class="ip-area w40">
											<form:input path="searchText" class="ip-text" placeholder="검색어를 입력해주세요" title="검색어 입력" />
										</div>
									</td>
									<td class="btn-searchform" data-btn="search">검색</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" id="btn-del"><span>삭제</span></a>
						<a class="btns btn-back-o" href="/admin/main/popup/view"><span>등록</span></a>
					</div>
					<div class="bx-btn a-right">
						<p class="page-sum float-left">조회결과 <span class="cl-orange"><c:out value="${page.totalCount}" /></span>건</p>
					</div>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:;">
								<col style="width:30%;">
								<col style="width:15%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>번호</th>
									<th>언어</th>
									<th>제목</th>
									<th>게시 기간</th>
									<th>등록일시</th>
									<th>사용여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
								<tr>
									<td colspan="7">조회 데이터가 없습니다.</td>
								</tr>
								</c:if>
								<c:if test="${not empty list}">
								<c:forEach items="${list}" var="row" varStatus="stat">
								<tr>
									<td>
										<span class="chk-box"><input type="checkbox" name="seqs" value="<c:out value="${row.seq}"/>"></span>
									</td>
									<td><c:out value="${page.totalCount - page.startRowNum - stat.index + 1}" /></td>
									<td>
										<c:choose>
											<c:when test="${row.lang eq 'KO'}">국문</c:when>
											<c:when test="${row.lang eq 'EN'}">영문</c:when>
											<c:when test="${row.lang eq 'ES'}">스페인</c:when>
										</c:choose>
									</td>
									<td class="a-left"><a href="<c:url value="/admin/main/popup/${row.seq}" />"><c:out value="${row.title}" /></a></td>
									
									<c:set var="sDispStDt" value="${row.dispStDt}"/>
									<c:set var="reDispStDt" value="${fn:replace(sDispStDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reDispStDt}" pattern="yyyy-MM-dd HH:mm" var="convReDispStDt" type="both"/>
									
									<c:set var="sDispEdDt" value="${row.dispEdDt}"/>
									<c:set var="reDispEdDt" value="${fn:replace(sDispEdDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reDispEdDt}" pattern="yyyy-MM-dd HH:mm" var="convReDispEdDt" type="both"/>
									
									<td><fmt:formatDate value="${convReDispStDt}" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${convReDispEdDt}" pattern="yyyy-MM-dd HH:mm"/></td>
									
									<c:set var="sRegDt" value="${row.regDt}"/>
									<c:set var="reRegDt" value="${fn:replace(sRegDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reRegDt}" pattern="yyyy-MM-dd HH:mm" var="convRegDt" type="both"/>
									<td><fmt:formatDate value="${convRegDt}" pattern="yyyy-MM-dd HH:mm"/></td>
									
									<td><c:out value="${'Y' eq row.dispYn ? '노출' : '비노출'}" /></td>
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
		// 전체 체크
		$('#checkAll').on('change', function() {
			$('input[name="seqs"]').prop('checked', $(this).is(':checked'));
		});
		
		// 체크 박스
		$('input[name="seqs"]').on('change', function() {
			var checked = $('input[name="seqs"]').length === $('input[name="seqs"]:checked').length ? true : false;			
			$('#checkAll').prop('checked', checked);
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
		
		// 검색
		$('[data-btn="search"]').off('click').on('click', function() {
			$('#form').submit();
		});
	</script>
</body>
</html>
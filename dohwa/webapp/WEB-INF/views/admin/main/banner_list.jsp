<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="count" value="1" />
<c:set var="type" value="NONE" />
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
				<h2 style="margin-bottom: 50px;">메인 배너 조회</h2>
				<form:form id="form" modelAttribute="searchVO" method="get">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" id="btn-del"><span>삭제</span></a>
						<a class="btns btn-line-g" id="btn-save-order"><span>순서저장</span></a>
						<a class="btns btn-back-o" href="/admin/main/banner/view"><span>등록</span></a>
					</div>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th><span class="chk-box"><input type="checkbox" id="checkAll"><label class="chk hidden" for="chk1">선택</label></span></th>
									<th>구분</th>
									<th>구분 순서</th>
									<th>이미지 순서</th>
									<th>이미지 명</th>
									<th>등록일</th>
									<th>노출여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
								<tr>
									<td colspan="7">조회 데이터가 없습니다.</td>
								</tr>
								</c:if>
								
								<c:if test="${not empty list}">
								<c:forEach items="${list}" var="row" varStatus="status">
								<tr>
									<td>
										<span class="chk-box">
											<input type="checkbox" 
													name="seqs" 
													value="<c:out value="${row.seq}"/>" 
													data-banner="<c:out value="${row.bannerType}"/>" />
										</span>
									</td>
									<td><c:out value="${row.bannerType}" /></td>
									
									<c:forEach var="entry" items="${grouping}">
									
									<c:choose>
									<c:when test="${row.bannerType eq entry.key && 1 eq count && 1 < entry.value}">
										<c:set var="count" value="${count + 1}" />
										<td rowspan="<c:out value="${entry.value}" />">
											<div class="ip-area selec">
												<select name="bannerOrder">
												<c:forEach var="i" begin="1" end="5">
													<option <c:if test="${i == row.bannerOrder}">selected="selected"</c:if> value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
												</c:forEach>
												</select>
											</div>
										</td>
									</c:when>
									<c:when test="${row.bannerType eq entry.key && 1 eq entry.value}">
										<c:set var="count" value="1" />
										<td>
											<div class="ip-area selec">
												<select name="bannerOrder">
												<c:forEach var="i" begin="1" end="5">
													<option <c:if test="${i == row.bannerOrder}">selected="selected"</c:if> value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
												</c:forEach>
												</select>
											</div>
										</td>
									</c:when>
									<c:when test="${row.bannerType eq entry.key && entry.value eq count}">
										<c:set var="count" value="1" />
									</c:when>
									<c:when test="${row.bannerType eq entry.key && 1 < count}">
										<c:set var="count" value="${count + 1}" />
									</c:when>
									
									</c:choose>
									
									</c:forEach>
									
									<td>
										<div class="ip-area selec">
											<select name="typeOrder">
											<c:forEach var="i" begin="1" end="3">
												<option <c:if test="${i == row.typeOrder}">selected="selected"</c:if> value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
											</c:forEach>
											</select>
										</div>
									</td>
									<td class="a-left"><a href="<c:url value="/admin/main/banner/${row.seq}"/>"><c:out value="${empty row.imgName ? '국문 이미지를 등록해야 합니다.' : row.imgName }"/></a></td>
									
									<c:set var="sRegDt" value="${row.regDt}"/>
									<c:set var="reRegDt" value="${fn:replace(sRegDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reRegDt}" pattern="yyyy-MM-dd HH:mm" var="convRegDt" type="both"/>
									<td><fmt:formatDate value="${convRegDt}" pattern="yyyy-MM-dd"/></td>
									<td>
										<div class="ip-area selec">
											<select name="dispYn">
												<option <c:if test="${'Y' eq row.dispYn}">selected="selected"</c:if> value="Y">노출</option>
												<option <c:if test="${'N' eq row.dispYn}">selected="selected"</c:if> value="N">비노출</option>
											</select>
										</div>
									</td>
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

		// 순서 저장
		$('#btn-save-order').off('click').on('click', function() {
			saveOrder();
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
					o.seq = $(this).closest('tr').find('input:checkbox').val();
					o.dispYn = $(this).val();
					
					mainBannerDisp(o);
			} else {
				$(this).val(preValue);
			}
		});
		
		// 순서
		function saveOrder() {
			var _orderDatas = [];
			function init() {
				if(bannerOrderValidate() && typeOrderValidate() && confirm('순서 저장 하시겠습니까?')) {
					orderData();
				}
			}
			
			// 구분 순서 중복 체크
			function bannerOrderValidate() {
				var _index = null;
				var _checked = true;
				var _ordValueArray = [];
				
				$.each($('select[name=bannerOrder]'), function(idx, obj) {
					for(var i = 0; i < _ordValueArray.length; i++) {
						if($(obj).val() === _ordValueArray[i].ord) {
							alert('구분 순서에 중복 값이 있습니다.');
							$(obj).focus();
							
							_checked = false;
							return false;
						}
					}
					
					var subObj = {};
						subObj.ord = $(obj).val();
						
					_ordValueArray.push(subObj);
				});
				
				return _checked;
			}
			
			// 이미지 순서 중복 체크
			function typeOrderValidate() {
				var _index = null;
				var _checked = true;
				var _ordValueArray = [];
				var _bannerValueArray = [];
				
				$.each($('[data-banner]'), function(i, o) {
					if('' !== $(this).data('banner') && null !== $(this).data('banner')) {
						_bannerValueArray.push($(this).data('banner'));
					}
				});
				
				var _bannerValueFilterArray = _bannerValueArray.reduce(function(a, b) {
					if (a.indexOf(b) < 0 ) a.push(b);
					return a;
				}, []);
				
				for(var item in _bannerValueFilterArray) {
					var _type = _bannerValueFilterArray[item];
					_ordValueArray = [];
					
					if(_checked) {
						$.each($('[data-banner="'+ _type +'"]').closest('tr'), function(idx, obj) {
							var $selectObj = $(obj).find('select[name=typeOrder]');
							for(var i = 0; i < _ordValueArray.length; i++) {
								if($selectObj.val() === _ordValueArray[i].ord) {
									alert(_type + ' 이미지 순서에 중복 값이 있습니다.');
									$selectObj.focus();
								
									_checked = false;
									return false;
								}
							}
						
							var subObj = {};
								subObj.ord = $selectObj.val();
						
							_ordValueArray.push(subObj);
						});
					}
				}
				return _checked;
			}
			
			// 정렬 데이터
			function orderData() {
				$.each($('.tb-list table tbody').find('tr'), function(idx, obj) {
					var o = {};
						o.seq = Number($(this).find('input:checkbox').val());
						o.bannerType = $(this).find('input:checkbox').data('banner');
						o.bannerOrder = 0 === $(this).find('select[name="bannerOrder"]').length ? 
											Number(_orderDatas[idx - 1].bannerOrder) : Number($(this).find('select[name="bannerOrder"]').val());
						o.typeOrder = Number($(this).find('select[name="typeOrder"]').val());
						
					_orderDatas.push(o);
				});
				
				console.log(_orderDatas);
				
				if(0 < _orderDatas.length) {
					$.ajax({
						url : '/admin/main/banner/order',
						type : 'post',
						data : JSON.stringify(_orderDatas),
						dataType: 'json',
						contentType: 'application/json',
						success : function(data) {
							alert(data.message);
							window.location.reload();
						},
						error : function(jqXHR) {
							console.log(jqXHR);
						}
					});
				}
			}
			
			init();
		}
		
		// 노출 변경
		function mainBannerDisp(o) {
			$.ajax({
				url : '/admin/main/banner/disp',
				type : 'post',
				data : JSON.stringify(o),
				dataType: 'json',
				contentType: 'application/json',
				success : function(data) {
					alert(data.message);
					window.location.reload();
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
	</script>
</body>
</html>
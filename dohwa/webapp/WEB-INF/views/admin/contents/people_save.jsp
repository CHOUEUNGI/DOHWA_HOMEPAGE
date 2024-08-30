<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
				<form:form id="form" action="/admin/contents/people/save" modelAttribute="peopleVO" method="post" enctype="multipart/form-data">
					<input type="hidden" name="_method" value="${param._method }" />
				
					<c:if test="${param._method ne 'insert' }">
					
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:90%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<div class="ip-area radio">
											<span><form:radiobutton path="lang" value="KO" label="국문" /></span>
											<span><form:radiobutton path="lang" value="EN" label="영문" /></span>
											<span><form:radiobutton path="lang" value="ES" label="스페인" /></span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					</c:if>
				
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="/admin/contents/people"><span>취소</span></a>
						
						<c:if test="${peopleVO.lang eq 'KO' }">
						<a class="btns btn-back-o" btn-clear-order><span>순서초기화</span></a>
						<a class="btns btn-back-o" btn-add><span>추가</span></a>
						</c:if>
						
						<a class="btns btn-back-o" btn-save><span>저장</span></a>
					</div>
					<div class="wrap-tb tb-list" style="overflow:auto; height: 660px;">
						<table>
							<colgroup>
								<col style="width:3%;">
								<col style="width:5%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="">
								<col style="width:18%;">
								<col style="width:10%;">
								<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th>순서</th>
									<th>노출</th>
									<th>이름</th>
									<th>직급</th>
									<th>부서명</th>
									<th>Interview</th>
									<th>이미지<br/><p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 377 X 377</p></th>
									<th>등록일시</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								
								<c:set var="listSize" value="${fn:length(peopleVO.peoples) }" />
								<c:forEach items="${peopleVO.peoples }" var="list" varStatus="sts">
								
								<tr>
									<td>
										<form:hidden path="peoples[${sts.index }].seq" />
										
										<div class="ip-area selec">
											<form:select path="peoples[${sts.index }].order" disabled="${peopleVO.lang eq 'KO' ? 'false' : 'true' }">
												<option value="">-</option>
												
												<c:forEach begin="1" end="${listSize }" var="i">
												<option value="${i }" ${i eq list.order ? 'selected="selected"' : '' }>${i }</option>
												</c:forEach>
											</form:select>
										</div>
										<form:errors path="peoples[${sts.index }].order" cssStyle="color: #ff0000;"/>
									</td>
									<td>
										<div class="ip-area selec">
											<form:select path="peoples[${sts.index }].dispYn" disabled="${peopleVO.lang eq 'KO' ? 'false' : 'true' }">
												<option value="Y" ${list.dispYn eq 'Y' ? 'selected="selected"' : '' }>노출</option>
												<option value="N" ${list.dispYn eq 'N' ? 'selected="selected"' : '' }>미노출</option>
											</form:select>
										</div>
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="peoples[${sts.index }].peopleMlVO.name" class="ip-text" title="이름" maxlength="30" />
										</div>
										<form:errors path="peoples[${sts.index }].peopleMlVO.name" cssStyle="color: #ff0000;"/>
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="peoples[${sts.index }].peopleMlVO.staffLevel" class="ip-text" title="직급" maxlength="100" />
										</div>
										<form:errors path="peoples[${sts.index }].peopleMlVO.staffLevel" cssStyle="color: #ff0000;"/>
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="peoples[${sts.index }].peopleMlVO.partname" class="ip-text" title="부서명" maxlength="100" />
										</div>
										<form:errors path="peoples[${sts.index }].peopleMlVO.partname" cssStyle="color: #ff0000;"/>
									</td>
									<td>
										<form:textarea path="peoples[${sts.index }].peopleMlVO.interview" cssStyle="width:100%; height:70px; resize:none;" maxlength="3000" placeholder="내용을 입력하세요."/>
										<form:errors path="peoples[${sts.index }].peopleMlVO.interview" cssStyle="color: #ff0000;"/>
									</td>
									<td style="text-align: left;">
									
									<c:choose>
										<c:when test="${empty list.fileVO.id }">
										
										<div class="ip-area w100">
											<input type="file" name="peoples[${sts.index }].multipartFileVO.file" value="">
										</div>
										<form:errors path="peoples[0].multipartFileVO.message" cssStyle="color: #ff0000;"/>
										
										</c:when>
										<c:otherwise>
							
											<div class="w100">
												<c:out value="${list.fileVO.orgName }" />
											</div>
											<form:hidden path="peoples[${sts.index }].fileVO.id" />
											<form:hidden path="peoples[${sts.index }].fileVO.orgName" />
																	
										</c:otherwise>
									</c:choose>
									
									</td>
									<td>
										<fmt:parseDate value="${list.regDt}" pattern="yyyy-MM-dd'T'HH:mm" var="regDt" type="both"/>
										<fmt:formatDate value="${regDt}" pattern="yyyy-MM-dd HH:mm"/>
										<form:hidden path="peoples[${sts.index }].regDt"/>
									</td>
									<td>
										<c:if test="${peopleVO.lang eq 'KO' }">
										<a class="btns btn-line-g" data-seq="${list.seq }" delete-btn><span>삭제</span></a>
										</c:if>
									</td>
								</tr>
								
								</c:forEach>
								
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
	
	// row 개수 조회
	function getRowCount() {
		return $('.tb-list table > tbody > tr').length;
	}
	
	// form name 설정
	function setFormNames() {
		
		$('.tb-list table > tbody > tr').each(function(idx) {
			
			$(this).find('select, input, textarea').each(function() {
				
				$(this).attr('name', $(this).attr('name').replace(/\[[0-9]]/, '['+idx+']'));
			});
		});
	}
	
	// 순서 select 설정
	function setOrders() {
		
		var count = getRowCount();
		var sb = new StringBuilder();
		
		$('select[name$=".order"]').each(function(idx) {
			
			sb.clear();
			sb.append('<option value="">-</option>');
			$(this).append($('option', {value:'', text:'-'}));
			
			for (var i = 0; i < count; i++) {
				sb.append('<option value="{0}" {1}>{2}</option>', i+1, i === idx ? 'selected="selected"' : '', i+1);
			}

			$(this).empty().html(sb.toString());
		});
	}
	
	// row 삭제
	function removeRow(idx) {
		
		if(getRowCount() <= 1) return false;
		
		$('.tb-list table > tbody > tr').eq(idx).remove();
		
		// 순서 select 설정
		setOrders();
		
		// form name 설정
		setFormNames();
	}
	
	// row 추가
	function drawHtml() {
		
		var count = getRowCount();
		if (count >= 50) return false; 
		
		var sb = new StringBuilder();
		
		sb.append('<tr>');
		sb.append('	<td><div class="ip-area selec">');
		sb.append('		<select name="peoples[{0}].order">', count);
		sb.append('		</select></div>');
		sb.append('	</td>');
		sb.append('	<td><div class="ip-area selec">');
		sb.append('			<select name="peoples[{0}].dispYn">', count);
		sb.append('				<option value="Y">노출</option>');
		sb.append('				<option value="N">미노출</option>');
		sb.append('			<select>');
		sb.append('		</div>');
		sb.append('	</td>');
		sb.append('	<td><div class="ip-area w100"><input name="peoples[{0}].peopleMlVO.name" class="ip-text" title="이름" maxlength="15" /></div></td>', count);
		sb.append('	<td><div class="ip-area w100"><input name="peoples[{0}].peopleMlVO.staffLevel" class="ip-text" title="직급" maxlength="12" /></div></td>', count);
		sb.append('	<td><div class="ip-area w100"><input name="peoples[{0}].peopleMlVO.partname" class="ip-text" title="부서명" maxlength="11" /></div></td>', count);
		sb.append('	<td><textarea name="peoples[{0}].peopleMlVO.interview" style="width:100%; height:70px; resize:none;" maxlength="3000" placeholder="내용을 입력하세요." /></td>', count);
		sb.append('	<td><div class="ip-area w100"><input type="file" name="peoples[{0}].multipartFileVO.file"></div></td>', count);
		sb.append('	<td></td>');
		sb.append('	<td><a class="btns btn-line-g" delete-btn><span>삭제</span></a></td>');
		sb.append('</tr>');
		
		$('.tb-list table > tbody').append(sb.toString());
		
		// 순서 select 설정
		setOrders();
	}
	
	$(function() {

		if ('${listSize }' === '0') {
			drawHtml();
		}
		
		// 언어 선택 event
		$('[name="lang"]').on('change', function() {
			
			location.href = '/admin/contents/people/save?'+$.param({lang:$(this).val(), _method:'update'});
		});

		// 순서초기화 event
		$('[btn-clear-order]').on('click', function() {
			
			$('select[name$=".order"]').find('option:eq(0)').prop('selected', true);
		})
		
		// row 추가 event
		$('[btn-add]').on('click', function() {
			drawHtml();
		});
		
		// row 삭제 event
		$(document).on('click', '[delete-btn]', function() {
			
			if (confirm('<spring:message code="ADMIN.VALIDATE.DELETE.CONFIRM" javaScriptEscape="true" />')) {
				
				var idx = $('[delete-btn]').index($(this));
				removeRow(idx);
				
				if ($(this).data('seq')) {
					$('#form').append($('<input/>',{type:'hidden', name:'seqs', value:$(this).data('seq') }));
				}
			}
		});
		
		// 저장 버튼 event
		$('[btn-save]').on('click', function() {
			
			$('#form').submit();
		});
		
		// 순서 변경 event
		$(document).on('change', 'select[name$=".order"]', function() {
			
			var me = $(this);
			var val = $(this).val();
			
			$('select[name$=".order"]').not(me).each(function() {
				
				if (val !== '' && val === $(this).find(':selected').val()) {
					
					alert($(this).find(':selected').text() + '<spring:message code="ADMIN.VALIDATE.PEOPLE.ORDER.OVERLAP" javaScriptEscape="true" />');
					me.find('option:eq(0)').prop('selected', true);
					return false;
				}
			});
		});
	});
	
	</script>
</body>
</html>
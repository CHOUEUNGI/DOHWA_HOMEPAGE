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
				<h2 style="margin-bottom: 30px;">Project <c:out value="${null == projectVO.seq ? '등록' : '수정'}" /></h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" id="btn-cancel"><span>취소</span></a>
					<a class="btns btn-back-o" id="btn-save"><span>저장</span></a>
				</div>
				<form:form id="form" action="/admin/project/proc" modelAttribute="projectVO" method="post" enctype="multipart/form-data">
				<form:hidden path="seq" />
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;프로젝트명(국문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koTitle" class="ip-text" title="프로젝트명(국문)" placeholder="프로젝트명(국문) 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;부제목(국문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koSubTitle" class="ip-text" title="부제목(국문)" placeholder="부제목(국문) 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koSubTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;프로젝트명(영문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enTitle" class="ip-text" title="프로젝트명(영문)" placeholder="프로젝트명(영문) 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="enTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>부제목(영문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enSubTitle" class="ip-text" title="부제목(영문)" placeholder="부제목(영문) 입력해주세요." maxlength="350" />
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;프로젝트명(스페인)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esTitle" class="ip-text" title="프로젝트명(스페인)" placeholder="프로젝트명(스페인) 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="esTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>부제목(스페인)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esSubTitle" class="ip-text" title="부제목(스페인)" placeholder="부제목(스페인) 입력해주세요." maxlength="350" />
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;준공연도</th>
								<td>
									<div class="ip-area w5">
										<form:input path="year" class="ip-text" title="준공연도" placeholder="준공연도" maxlength="4" />
									</div>
									<form:errors path="year" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;기본정보</th>
								<td>
									<div class="ip-area selec">
										<form:select path="type1">
											<form:option value="" >Market</form:option>
											<form:options items="${markets}" itemValue="code" itemLabel="koText" />
										</form:select>
										<form:select path="type4">
											<form:option value="" >2차 분류</form:option>
										</form:select>
										<label class="bar">&nbsp;&nbsp;</label>
										<form:select path="type2">
											<form:option value="" >Service</form:option>
											<form:options items="${services}" itemValue="code" itemLabel="koText" />
										</form:select>
										<label class="bar">&nbsp;&nbsp;</label>
										<form:select path="type3">
											<form:option value="" >Region</form:option>
											<form:options items="${regions}" itemValue="code" itemLabel="koText" />
										</form:select>
										<form:select path="type5">
											<form:option value="" >2차 분류</form:option>
										</form:select>
									</div>
									<div>
										<form:errors path="type1" cssStyle="color: #ff0000;"/>
									</div>
									<div>
										<form:errors path="type2" cssStyle="color: #ff0000;"/>
									</div>
									<div>
										<form:errors path="type3" cssStyle="color: #ff0000;"/>									
									</div>
								</td>
							</tr>
							<tr>
								<th rowspan="3">발주처&nbsp;(<span class="required"></span>&nbsp;국문 필수)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koClient" class="ip-text" title="발주처(국문)" placeholder="발주처(국문) 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="koClient" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<td>
									<div class="ip-area w100">
										<form:input path="enClient" class="ip-text" title="발주처(영문)" placeholder="발주처(영문) 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="enClient" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<td>
									<div class="ip-area w100">
										<form:input path="esClient" class="ip-text" title="발주처(스페인)" placeholder="발주처(스페인) 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="esClient" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<c:if test="${null ne projectVO.seq}">
							<tr>
								<th>&nbsp;등록 일시</th>
								<td>
									<c:set var="sRegDt" value="${projectVO.regDt}"/>
									<c:set var="reRegDt" value="${fn:replace(sRegDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reRegDt}" pattern="yyyy-MM-dd HH:mm" var="convRegDt" type="both"/>
									<fmt:formatDate var="yyyy" value="${convRegDt}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="hh" value="${convRegDt}" pattern="HH"/>
									<fmt:formatDate var="mm" value="${convRegDt}" pattern="mm"/>
									
									<div class="ip-area ico-calenadar">
										<input class="ip-text datepicker fk_start" id="day" title="등록 일" placeholder="날짜" value="<c:out value="${yyyy}"/>" />
									</div>&nbsp;&nbsp;
									<div class="ip-area w3">
										<input class="ip-text" id="hh" title="등록 시간" placeholder="시간" value="<c:out value="${hh}"/>" maxlength="2" />
									</div>&nbsp;시&nbsp;&nbsp;
									<div class="ip-area w3">
										<input class="ip-text" id="mm" title="등록 분" placeholder="분" value="<c:out value="${mm}"/>" maxlength="2" />
									</div>&nbsp;분
									<form:hidden path="strRegDt" />
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;PC 메인 이미지(직사각형) 등록</th>
								<td>
									<c:if test="${not empty projectVO.mainFileName1}">
										<div class="w100"><c:out value="${projectVO.mainFileName1}" /><a class="btn-line-delete" data-btn="<c:out value="${projectVO.mainFileId1}"/>"><span>삭제</span></a></div>
										<form:hidden path="mainFileName1" value="${projectVO.mainFileName1}" />
									</c:if>
									<c:if test="${empty projectVO.mainFileName1}">
										<div class="w100">
											<input type="file" name="main_file_1" />
										</div>
										<form:errors path="main_file_1" cssStyle="color: #ff0000;"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;PC 메인 이미지(정사각형) / 리스트 썸네일 등록</th>
								<td>
									<c:if test="${not empty projectVO.mainFileName2}">
										<div class="w100"><c:out value="${projectVO.mainFileName2}" /><a class="btn-line-delete" data-btn="<c:out value="${projectVO.mainFileId2}"/>"><span>삭제</span></a></div>
										<form:hidden path="mainFileName2" value="${projectVO.mainFileName2}" />
									</c:if>
									<c:if test="${empty projectVO.mainFileName2}">
										<div class="w100">
											<input type="file" name="main_file_2" />
										</div>
										<form:errors path="main_file_2" cssStyle="color: #ff0000;"/>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="bx-btn a-right">
					<a class="btns btn-back-o" id="btn_key_add"><span>이미지 추가</span></a>
				</div>
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
							<col style="width:10%;">
						</colgroup>
						<tbody class="image_area">
						<form:errors path="file" cssStyle="color: #ff0000;" />
						<c:forEach var="item" items="${projectVO.files}" varStatus="status">
							<c:choose>
							<c:when test="${not empty item.id}">
								<c:if test="${status.count % 2 != 0}">
								<tr data-area="<c:out value="${item.attOrder}"/>"
									data-url="<c:url value="/admin/file/delete/${item.id}" />">
									<th>
										<span class="required">필수항목</span>&nbsp;PC 이미지(<c:out value="${item.attOrder}"/>) 등록 
										<c:if test="${1 == item.attOrder}">
										<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1920 X 1440</p>
										</c:if>
									</th>
									<td>
										<div class="w100">
											<c:out value="${item.orgName}" />
										</div>
									</td>
									<th rowspan="2">
										<a class="btns btn-line-g btn_delete" data-btn="<c:out value="${item.attOrder}"/>"><span>삭제</span></a>
									</th>
								</tr>
								</c:if>
								<c:if test="${status.count % 2 == 0}">
								<tr data-area="<c:out value="${item.attOrder}"/>"
									data-url="<c:url value="/admin/file/delete/${item.id}" />">
									<th>
										<span class="required">필수항목</span>&nbsp;Mobile 이미지(<c:out value="${item.attOrder}"/>) 등록
										<c:if test="${1 == item.attOrder}">
										<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 670 X 670</p>
										</c:if>
									</th>
									<td>
										<div class="w100">
											<c:out value="${item.orgName}" />
										</div>
									</td>
								</tr>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${status.count % 2 != 0}">
								<tr data-area="<c:out value="${item.attOrder}"/>">
									<th>
										<span class="required">필수항목</span>&nbsp;PC 이미지(<c:out value="${item.attOrder}"/>) 등록
										<c:if test="${1 == item.attOrder}">
										<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1312 X 640</p>
										</c:if>
									</th>
									<td>
										<div class="w100">
											<input type="file" name="<c:out value="PC_FILE_${item.attOrder}"/>" />
										</div>
									</td>
									<th rowspan="2">
										<a class="btns btn-line-g btn_delete" data-btn="<c:out value="${item.attOrder}"/>"><span>삭제</span></a>
									</th>
								</tr>
								</c:if>
								<c:if test="${status.count % 2 == 0}">
								<tr data-area="<c:out value="${item.attOrder}"/>">
									<th>
										<span class="required">필수항목</span>&nbsp;Mobile 이미지(<c:out value="${item.attOrder}"/>) 등록
										<c:if test="${1 == item.attOrder}">
										<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 670 X 670</p>
										</c:if>
									</th>
									<td>
										<div class="w100">
											<input type="file" name="<c:out value="MO_FILE_${item.attOrder}"/>" />
										</div>
								   </td>
								</tr>
								</c:if>
							</c:otherwise>	
							</c:choose>
							
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th>&nbsp;프로젝트 설명(국문)</th>
								<td>
									<form:textarea id="koCont" path="koCont" maxlength="3000" />
									<form:errors path="koCont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;프로젝트 설명(영문)</th>
								<td>
									<form:textarea id="enCont" path="enCont" maxlength="3000" />
									<form:errors path="enCont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;프로젝트 설명(스페인어)</th>
								<td>
									<form:textarea id="esCont" path="esCont" maxlength="3000" />
									<form:errors path="esCont" cssStyle="color: #ff0000;"/>
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
		var editor = new CKEditor( ['#koCont', '#enCont', '#esCont'] );
		var imageFormArray = [];
		var _type4 = '<c:out value="${projectVO.type4}" />';
		var _type5 = '<c:out value="${projectVO.type5}" />';
		
		$(document).ready(function() {
			if('' === $('#seq').val() && 0 === $('.image_area').find('tr').length) {
				setFileArea(true);
			}
			
			if('' != $('select[name="type1"]').val()) {
				var o = {
					code : $('select[name="type1"]').val()
					,selector : 'type4'
					,value : _type4
				};
				
				getProjectItem(o);
			}
			
			if('' != $('select[name="type3"]').val()) {
				var o = {
					code : $('select[name="type3"]').val()
					,selector : 'type5'
					,value : _type5
				};
				
				getProjectItem(o);
			}
			
		});
		
		// 준공연도
		$('#year,#hh,#mm').on('keyup', function() {
			var text = $(this).val().replace(/[^0-9]/g, '');
			if('hh' === $(this).attr('id') && 23 < Number(text)) {
				text = '';
			} else if('mm' === $(this).attr('id') && 59 < Number(text)) {
				text = '';
			}
			$(this).val(text);
		});
		
		// 저장 버튼
		$('#btn-save').off('click').on('click', function() {
			for(var i in imageFormArray) {
				$('#form').append('<input type="hidden" name="fileOrders" value="'+ imageFormArray[i] +'">');
			}
			
			if('' !== $('#seq').val()) {
				var day = $('#day').val().replace(/[^0-9]/g, '');
				var hh = '' === $('#hh').val() ? '00' : $('#hh').val();
				var mmss = '' === $('#mm').val() ? '0000' : $('#mm').val() + '00';
				$('#strRegDt').val(day + hh + mmss);
			}
			
			$('#form').submit();
		});
		
		// 취소 버튼
		$('#btn-cancel').off('click').on('click', function() {
			window.location.href = "/admin/project";
		});
		
		// 이미지 추가 버튼
		$('#btn_key_add').off('click').on('click', function() {
			setFileArea(true);
		});
		
		// 구분 변경
		$('select[name="type1"],select[name="type3"]').on('change', function() {
			if('type1' === $(this).attr('name')) {
				var o = {
					code : $('select[name="type1"]').val()
					,selector : 'type4'
					,value : ''
				};
				
				getProjectItem(o);
			}
			
			if('type3' === $(this).attr('name')) {
				var o = {
					code : $('select[name="type3"]').val()
					,selector : 'type5'
					,value : ''
				};
				
				getProjectItem(o);
			}
		});
		
		// 메인 이미지 삭제
		$('[data-btn]').on('click', function() {
			if(confirm('선택한 이미지를 삭제 하시겠습니까?')) {
				$.getJSON('/admin/file/delete/' + $(this).data('btn'), function() {
					window.location.reload();
				}).error(function() {console.log(arguments)});
			}
		});
		
		// 이미지 삭제 버튼
		$('.image_area').off('click').on('click', '[data-btn]', function() {
			var removeIdx = Number($(this).data('btn'));
			
			if(confirm('선택 하신 '+ removeIdx +'번째 이미지를 삭제 하시겠습니까?')) {
				var tempArray = imageFormArray.slice(0, imageFormArray.length);
				imageFormArray = [];
				for(var i in tempArray) {
					if(removeIdx !== tempArray[i]) {
						imageFormArray.push(tempArray[i]);
					}
				}
				
				var pcUrl = null;
				var moUrl = null;
				$.each($('[data-area="'+ removeIdx +'"]'), function(idx, obj) {
					if(null != $(obj).data('url') && 0 === idx) {
						pcUrl = $(obj).data('url');
					} else if(null != $(obj).data('url') && 1 === idx) {
						moUrl = $(obj).data('url');
					}
				});
				
				if(null !== pcUrl && null !== moUrl) {
					$.when($.get(pcUrl), $.get(moUrl)).done(function(a1, a2) {
						window.location.reload();
					});
				}
				
				$('[data-area="'+ removeIdx +'"]').remove();
			}
		});
		
		// 이미지 입력 폼 만들기
		function setFileArea(checked) {
			var _limitCount = 5;
			var _lastFormValue = $('.image_area').find('tr').length === 0 ? 1 : Number($('.image_area').find('tr').last().data('area')) + 1;
			var _strElement = '';
			var _appendToChecked = false;
			var _appendToObject = null;
			
			function validate() {
				if(($('.image_area').find('tr').length / 2) >= _limitCount) {
					alert('첨부 이미지는 최대 ' + _limitCount + '까지 가능 합니다.');
					return false;
				}
				
				if(typeof checked !== 'undefined' && checked) {
					var _lastIndex = Number($('.image_area').find('tr').last().data('area'));
					for (var i = 1; i <= _lastIndex; i++) {
						if(0 === $('[data-area="'+ i +'"]').length) {
							_lastFormValue = i;
							_appendToObject = '[data-area="'+ (i - 1) +'"]';
							_appendToChecked = true;
						}
					}
				}
				
				return true;
			}
			
			function draw() {
				var _style = '';
				if(validate()) {
					_strElement += '<tr data-area="'+ _lastFormValue +'">';
					_strElement += '	<th>';
					_strElement += '		<span class="required">필수항목</span>&nbsp;PC 이미지('+ _lastFormValue +') 등록 ';
					
					if(1 === _lastFormValue) {
						_strElement += '	<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1312 X 640</p>';
					}
					
					_strElement += '	</th>';
					_strElement += '	<td>';
					_strElement += '		<div class="w100">';
					_strElement += '			<input type="file" name="PC_FILE_'+ _lastFormValue +'" />';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '	<th rowspan="2">';
					_strElement += '		<a class="btns btn-line-g btn_delete" data-btn="'+ _lastFormValue +'"><span>삭제</span></a>';
					_strElement += '	</th>';
					_strElement += '</tr>';
					_strElement += '<tr data-area="'+ _lastFormValue +'">';
					_strElement += '	<th><span class="required">필수항목</span>&nbsp;Mobile 이미지('+ _lastFormValue +') 등록';
					
					if(1 === _lastFormValue) {
						_strElement += '	<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 670 X 670</p>';
					}
					
					_strElement += '	</th>';	
					_strElement += '	<td>';
					_strElement += '		<div class="w100">';
					_strElement += '			<input type="file" name="MO_FILE_'+ _lastFormValue +'" />';
					_strElement += '		</div>';
					_strElement += '   </td>';
					_strElement += '</tr>';
					
					imageFormArray.push(_lastFormValue);
				}
				
				// 중간에 끼워넣기 여부
				if(!_appendToChecked) {
					$('.image_area').append(_strElement);
				} else {
					if(0 === $(_appendToObject).last().length) {
						$('.image_area').prepend(_strElement);
					} else {
						$(_appendToObject).last().after(_strElement);
					}
				}
			}
			
			draw();
		}
		
		function getProjectItem(o) {
			$('select[name="'+ o.selector +'"] option').not(':first').remove();
			$.ajax({
				url : '/admin/project/item/get/' + o.code,
				type : 'get',
				dataType: 'json',
				success : function(data) {
					if(typeof data.codes !== 'undefined' && 0 < data.codes.length) {
						var s = '';
						for(var i in data.codes) {
							var _t = data.codes[i];
							var _s = '';
							if(typeof o.value !== 'undefined' && o.value === _t.code) {
								_s = 'selected="selected"';
							}
							
							s += '<option value="'+ _t.code +'" '+ _s +'>'+ _t.koText +'</option>';
						}
						$('select[name="'+ o.selector +'"]').append(s);		
					}
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
		
	</script>
</body>
</html>
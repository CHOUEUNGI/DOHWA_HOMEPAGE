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
				<h2 style="margin-bottom: 50px;">Project 항목 관리</h2>
				<form:form id="form" modelAttribute="searchVO" method="get">
					<div class="wrap-tb tb-search">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th>검색 조건</th>
									<td>
										<div class="ip-area radio">
										<c:forEach var="item" items="${parentCodes}" varStatus="status">
											<input type="radio" 
													id="radio<c:out value="${status.count}" />" 
													name="searchType" 
													value="<c:out value="${item.code}" />"
													<c:if test="${item.code eq searchVO.searchType}">checked="checked"</c:if>>
											<label class="chk" for="radio<c:out value="${status.count}" />"><c:out value="${item.koText}" /></label>&nbsp;&nbsp;
										</c:forEach>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form:form>
			</div>
			<div class="wrap-tb-float-left tb-search-border">
				<div class="bx-btn a-right">
					<h3 style="float: left;">1차 분류</h3>
					<a class="btns btn-line-g" id="btn-2depth-add"><span>추가</span></a>
					<a class="btns btn-back-o" id="btn-2depth-save"><span>저장</span></a>
				</div>
				<table class="_2depth-table">
					<colgroup>
						<col style="width:5%;">
						<col style="width:10%;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:12%;">
					</colgroup>
					<thead>
						<tr>
							<th class="td-border"></th>
							<th class="td-border">순서</th>
							<th class="td-border"><span class="required"></span>&nbsp;국문명</th>
							<th class="td-border">영문명</th>
							<th class="td-border">스페인어</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${codes}" varStatus="status">
						<tr>
							<td class="td-border">
								<input type="radio" name="2depthRadio" data-seq="<c:out value="${item.seq}"/>" <c:if test="${0 == status.index}">checked="checked"</c:if> value="<c:out value="${item.code}"/>" />
							</td>
							<td class="td-border td-text-align-center">
								<div class="ip-area selec">
									<select name="order">
									<c:forEach items="${codes}" varStatus="ordStatus">
										<option value="<c:out value="${ordStatus.count}" />"
												<c:if test="${ordStatus.count eq item.order}">selected="selected"</c:if>><c:out value="${ordStatus.count}" /></option>
									</c:forEach>
									</select>
								</div>
							</td>
							<td class="td-border">
								<div class="ip-area w100">
									<input type="text" class="ip-text" name="koText" value="<c:out value="${item.koText}"/>" maxlength="70" />
								</div>
							</td>
							<td class="td-border">
								<div class="ip-area w100">
									<input type="text" class="ip-text" name="enText" value="<c:out value="${item.enText}"/>" maxlength="70" />
								</div>
							</td>
							<td class="td-border">
								<div class="ip-area w100">
									<input type="text" class="ip-text" name="esText" value="<c:out value="${item.esText}"/>" maxlength="70" />
								</div>
							</td>
							<td class="td-text-align-center">
								<div class="ip-area selec">
									<select name="useYn">
										<option <c:if test="${'Y' eq item.useYn}">selected="selected"</c:if> value="Y">노출</option>
										<option <c:if test="${'N' eq item.useYn}">selected="selected"</c:if> value="N">비노출</option>
									</select>
								</div>
							</td>
						</tr>
						</c:forEach>
						<c:if test="${0 == fn:length(codes)}">
							<tr data-empty="true"><td class="td-text-align-center" colspan="6">조회된 내용이 없습니다.</td></tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="wrap-tb-float-right tb-search-border" style="float: right; width: 47%;">
				<div class="bx-btn a-right">
					<h3 style="float: left;">2차 분류</h3>
					<a class="btns btn-line-g" id="btn-3depth-add"><span>추가</span></a>
					<a class="btns btn-back-o" id="btn-3depth-save"><span>저장</span></a>
				</div>
				<table class="_3depth-table">
					<colgroup>
						<col style="width:10%;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:12%;">
					</colgroup>
					<thead>
						<tr>
							<th class="td-border">순서</th>
							<th class="td-border"><span class="required"></span>&nbsp;국문명</th>
							<th class="td-border">영문명</th>
							<th class="td-border">스페인어</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
						<tr data-empty="true"><td class="td-text-align-center" colspan="6">조회된 내용이 없습니다.</td></tr>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/admin/layout/after_script.jsp" %>
	<script type="text/javascript">
		
		$(document).ready(function() {
			if(0 < $('input[name=2depthRadio]:checked').length) {
				projectItemManager().getItem({code : $('input[name=2depthRadio]:checked').val(), depth : '3'});
			}
		});
	
		// 검색 조건
		$('input[name=searchType]').on('change', function() {
			$('#form').submit();
		});
		
		// 2뎁스 추가
		$('#btn-2depth-add').on('click', function() {
			projectItemManager().init('2');
		});
		
		// 2뎁스 저장
		$('#btn-2depth-save').on('click', function() {
			projectItemManager().itemData('2');
		});
		
		// 2뎁스 선택 라디오
		$('._2depth-table').on('change', 'input[name=2depthRadio]', function() {
			projectItemManager().getItem({code : $(this).val(), depth : '3'});
		});
		
		// 3뎁스 추가
		$('#btn-3depth-add').on('click', function() {
			projectItemManager().init('3');
		});
		
		// 3뎁스 저장
		$('#btn-3depth-save').on('click', function() {
			projectItemManager().itemData('3');
		});
		
		// 입력 폼
		function projectItemManager() {
			// 1차 분류 selector
			var _appendSelector2Depth = '_2depth-table tbody';
			// 2차 분류 selector
			var _appendSelector3Depth = '_3depth-table tbody';
			// default Index
			var _itemDepthIndex = '2';
			// default selector
			var _appendSelector = _appendSelector2Depth;
			// 순서 체크(ADD : '버튼으로 추가', GET : '데이터 조회 추가 ')
			var _orderType = 'ADD';
			
			var _strElement = '';
			var _emptyChecked = true;
			var _items = [];
			
			function init(t) {
				
				if(addValidate(t)) {
					_itemDepthIndex = t;
					
					if('3' === _itemDepthIndex) {
						_appendSelector = _appendSelector3Depth;
					} else if('2' === _itemDepthIndex) {
						_appendSelector = _appendSelector2Depth;
					}
					
					if(typeof $('.' + _appendSelector).find('tr').data('empty') !== 'undefined') {
						$('.' + _appendSelector).find('tr').remove();
					}
					
					var _tempObj = {
						seq : null,
 						koText : null,
 						enText : null,
 						esText : null,
 						useYn : false
	 				};
					
	 				_items.push(_tempObj);
	 					
 					_emptyChecked = false;
 					_orderType = 'ADD';
 					
 					draw();
				}
			}
			
			// 체크
			function addValidate(t) {
				if('3' === t && (0 === $('input[name=2depthRadio]:checked').length || '' === $('input[name=2depthRadio]:checked').val())) {
					alert('1차 분류 저장 후 추가 가능합니다.');
					return false;
				}
				
				return true;
			}
			
			// 입력 폼
			function draw() {
				
				if(_emptyChecked) {
					_strElement += '<tr data-empty="true"><td class="td-text-align-center" colspan="6">조회된 내용이 없습니다.</td></tr>';
					$('.' + _appendSelector).append(_strElement);
					return;
				}
				
				for(var i in _items) {
					var _seq =  null === _items[i].seq ? '' : _items[i].seq;
					var _koValue = null === _items[i].koText ? '' : 'value="'+ _items[i].koText +'"';
					var _enValue = null === _items[i].enText ? '' : 'value="'+ _items[i].enText +'"';
					var _esValue = null === _items[i].esText ? '' : 'value="'+ _items[i].esText +'"';
					var _select_Y = 'Y' === _items[i].useYn ? 'selected="selected"' : '';
					var _select_N = 'N' === _items[i].useYn ? 'selected="selected"' : '';
					var _radioValue = typeof _items[i].code === 'undefined' ? '' : _items[i].code;
					var _display = '';
					
					// 버튼 추가 이고 tr 0개 이면 라디오 자동선택, 조회된 추가 이고 i가 0 이면 체크
					var _autoChecked = ('ADD' === _orderType && 0 === $('.' + _appendSelector).find('tr').length) ? 'checked="checked"' : 
						('GET' === _orderType && i === '0') ? 'checked="checked"' : '';

					_strElement += '<tr>';
					
					if('3' === _itemDepthIndex) {
						_display = 'style="display:none;"';
					}
					
					_strElement += '	<td class="td-border" '+ _display +'>';
					_strElement += '		<input type="radio" name="'+ _itemDepthIndex +'depthRadio" data-seq="'+ _seq +'" '+ _autoChecked +' value="'+ _radioValue +'" />';
					_strElement += '	</td>';
					
					_strElement += '	<td class="td-border td-text-align-center">';
					_strElement += '		<div class="ip-area selec">';
					_strElement += '			<select name="order"></select>';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '	<td class="td-border">';
					_strElement += '		<div class="ip-area w100">';
					_strElement += '			<input type="text" class="ip-text" name="koText" maxlength="70" '+ _koValue +'/>';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '	<td class="td-border">';
					_strElement += '		<div class="ip-area w100">';
					_strElement += '			<input type="text" class="ip-text" name="enText" maxlength="70" '+ _enValue +' />';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '	<td class="td-border">';
					_strElement += '		<div class="ip-area w100">';
					_strElement += '			<input type="text" class="ip-text" name="esText" maxlength="70" '+ _esValue +' />';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '	<td class="td-text-align-center">';
					_strElement += '		<div class="ip-area selec">';
					_strElement += '			<select name="useYn">';
					_strElement += '				<option '+ _select_Y +'value="Y">노출</option>';
					_strElement += '				<option '+ _select_N +'value="N">비노출</option>';
					_strElement += '			</select>';
					_strElement += '		</div>';
					_strElement += '	</td>';
					_strElement += '</tr>';
				}
				
				$('.' + _appendSelector).append(_strElement);
				
				addOrder();
			}
			
			// 입력 폼 순서 (순서 다시 추가)
			function addOrder() {
				var $trs = $('.' + _appendSelector).find('tr');
				$.each($trs, function(idx, obj) {
					var s = '';
					$(obj).find('select[name=order]').empty();
					for(var i = 0; i < $trs.length; i++) {
						var c = Number(idx) === i ? 'selected="selected"' : '';
						s += '<option value="'+ (i + 1) +'" '+ c +'>'+ (i + 1) +'</option>';
					}
					
					$(obj).find('select[name=order]').append(s);
				});
			}
			
			// 코드 조회
			function getItem(o) {
				_itemDepthIndex = o.depth;
				_appendSelector = '3' === o.depth ? _appendSelector3Depth : _appendSelector2Depth;
				_orderType = 'GET';
				
				$('.' + _appendSelector).empty();
				
				// 선택된 1차 분류 값이 없을때
				if('' === o.code) {
					_items = [];
					_emptyChecked = true;
						
					draw();
				} else {
					$.ajax({
						url : '/admin/project/item/' + o.code,
						type : 'get',
						dataType: 'json',
						success : function(data) {
							_items = data.codes;
							_emptyChecked = (typeof data === 'undefined' || 0 === data.codes.length) ? true : false;
								
							draw();
						},
						error : function(jqXHR) {
							console.log(jqXHR);
						}
					});
				}
			}
			
			// 코드 저장
			function saveItem(oa) {
				$.ajax({
					url : '/admin/project/item/proc',
					type : 'post',
					data : JSON.stringify(oa),
					dataType: 'json',
					contentType: 'application/json',
					success : function(data) {
						if(typeof data.message !== 'undefined') {
							alert(data.message);
							$('input[name=searchType]').trigger('change');
						}
					},
					error : function(jqXHR) {
						console.log(jqXHR);
					}
				});
			}
			
			// 저장 데이터 만들기
			function itemData(t) {
				var _m = '2' === t ? '1차 분류' : '2차 분류';
				var _parentCode = '';
				if('2' === t) {
					_appendSelector = _appendSelector2Depth;
					_parentCode = $('input[name="searchType"]:checked').val();
				// 2차 분류
				} else if('3' === t) {
					_appendSelector = _appendSelector3Depth;
					_parentCode = $('input[name="2depthRadio"]:checked').val();
				}
				
				var o = {};
					o.message  = _m;
					o.selector = _appendSelector;
				
				if(itemDataValidate(o) && confirm('현재 ' + o.message +' 내용을 저장 하시겠습니까?')) {
					var _array = [];
					$.each($('.' + o.selector).find('tr'), function(idx, obj) {
						var _code  = $(obj).find('input:radio[name="'+ t +'depthRadio"]').val();
						var _order = $(obj).find('select[name="order"]').val();
						var _seq = $(obj).find('input:radio[name="'+ t +'depthRadio"]').data('seq');
							
						o = {};
						o.seq = _seq;
						o.code = '' === _code ? _parentCode + '_' +lpad(_order, 3, '0') : _code;
						o.parentCode = _parentCode;
						o.koText = $.trim($(obj).find('input[name="koText"]').val());
						o.enText = $.trim($(obj).find('input[name="enText"]').val());
						o.esText = $.trim($(obj).find('input[name="esText"]').val());
						o.order  = _order;
						o.useYn  = $(obj).find('select[name="useYn"]').val();
						
						_array.push(o);
					});
					
					//console.log('저장 데이터', _array);
					if(0 < _array.length) {
						saveItem(_array);
					}
				}
			}
			
			// 저장 데이터 검증
			function itemDataValidate(o) {
				var _index = null;
				var _checked = true;
				var _ordValueArray = [];
				
				// 순서 중복 체크
				var $ordSelectObj = $('.' + o.selector).find("select[name=order]");
				$.each($ordSelectObj, function(idx, obj) {
					for(var i = 0; i < _ordValueArray.length; i++) {
						if($(obj).val() === _ordValueArray[i].ord) {
							alert(o.message + " 중복된 순서가 있습니다.");
							$(obj).focus();
							
							_checked = false;
							return false;
						}
					}
					
					var subObj = {};
						subObj.ord = $(obj).val();
						
					_ordValueArray.push(subObj);
				});
				
				if(_checked) {
					// 입력 데이터 체크
					$.each($('.' + o.selector).find('tr'), function(idx, obj) {
						if('' === $.trim($(obj).find('input[name="koText"]').val())) {
							alert(o.message +' '+ (idx + 1) + '줄 필수값이 입력 되지 않았습니다.');
							$(obj).find('input[name="koText"]').focus();
							
							_checked = false;
							return false;
						}
					});
				}
				
				return _checked;
			}
			
			return {
				init : init,
				getItem : getItem,
				itemData : itemData
			}
		}
		
	</script>
</body>
</html>
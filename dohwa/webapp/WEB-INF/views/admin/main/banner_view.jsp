<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pcFile1" value="NONE"/>
<c:set var="pcFile2" value="NONE"/>
<c:set var="pcFile3" value="NONE"/>
<c:set var="moFile1" value="NONE"/>
<c:set var="moFile2" value="NONE"/>
<c:set var="moFile3" value="NONE"/>
<c:set var="pcFileKey1" value="NONE"/>
<c:set var="pcFileKey2" value="NONE"/>
<c:set var="pcFileKey3" value="NONE"/>
<c:set var="moFileKey1" value="NONE"/>
<c:set var="moFileKey2" value="NONE"/>
<c:set var="moFileKey3" value="NONE"/>
<c:forEach var="item" items="${mainBannerVO.files}">
	<c:choose>
		<c:when test="${1 eq item.attOrder && 'PC' eq item.type}">
			<c:set var="pcFile1" value="${item.orgName}"/>
			<c:set var="pcFileKey1" value="${item.id}"/>
		</c:when>
		<c:when test="${2 eq item.attOrder && 'PC' eq item.type}">
			<c:set var="pcFile2" value="${item.orgName}"/>
			<c:set var="pcFileKey2" value="${item.id}"/>
		</c:when>
		<c:when test="${3 eq item.attOrder && 'PC' eq item.type}">
			<c:set var="pcFile3" value="${item.orgName}"/>
			<c:set var="pcFileKey3" value="${item.id}"/>
		</c:when>
		<c:when test="${1 eq item.attOrder && 'MO' eq item.type}">
			<c:set var="moFile1" value="${item.orgName}"/>
			<c:set var="moFileKey1" value="${item.id}"/>
		</c:when>
		<c:when test="${2 eq item.attOrder && 'MO' eq item.type}">
			<c:set var="moFile2" value="${item.orgName}"/>
			<c:set var="moFileKey2" value="${item.id}"/>
		</c:when>
		<c:when test="${3 eq item.attOrder && 'MO' eq item.type}">
			<c:set var="moFile3" value="${item.orgName}"/>
			<c:set var="moFileKey3" value="${item.id}"/>
		</c:when>
	</c:choose>
</c:forEach>
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
				<h2 style="margin-bottom: 30px;">메인 배너 <c:out value="${null eq mainBannerVO.seq ? '등록' : '수정'}" /></h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" href="/admin/main/banner"><span>취소</span></a>
					<a class="btns btn-back-o" id="btn-save"><span>저장</span></a>
				</div>
				<form:form id="form" action="/admin/main/banner/proc" modelAttribute="mainBannerVO" method="post" enctype="multipart/form-data">
				<form:hidden path="seq" />
				<form:hidden path="bannerOrder" />
				<form:hidden path="typeOrder" />
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;메인 구분</th>
								<td>
									<c:if test="${null ne mainBannerVO.seq}">
									<div class="w100">
										<c:out value="${mainBannerVO.bannerType}" />
										<form:hidden path="bannerType" />
									</div>
									</c:if>
									<c:if test="${null eq mainBannerVO.seq}">
									<div class="ip-area selec">
										<select name="bannerType">
											<option <c:if test="${'BRANDING' eq mainBannerVO.bannerType}">selected="selected"</c:if> value="BRANDING">Branding</option>
											<option <c:if test="${'HISTORY'  eq mainBannerVO.bannerType}">selected="selected"</c:if> value="HISTORY" >History</option>
											<option <c:if test="${'BUSINESS' eq mainBannerVO.bannerType}">selected="selected"</c:if> value="BUSINESS">Business</option>
											<option <c:if test="${'CAREERS' eq mainBannerVO.bannerType}">selected="selected"</c:if> value="CAREERS" >Careers</option>
											<option <c:if test="${'PROJECT' eq mainBannerVO.bannerType}">selected="selected"</c:if> value="PROJECT" >Project</option>
										</select>
									</div>
									</c:if>
								</td>
							</tr>
							
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;국문 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1920 X 980</p>
								</th>
								<td>
								<c:if test="${'NONE' ne pcFile1}">
									<div class="w100"><c:out value="${pcFile1}" /><a class="btn-line-delete" data-btn="<c:out value="${pcFileKey1}"/>"><span>삭제</span></a></div>
									<form:hidden path="pcFileName1" value="${pcFile1}" />
								</c:if>
								<c:if test="${'NONE' eq pcFile1}">
									<div class="w100">
										<form:input type="file" path="pc_file_1_ko" title="국문 이미지" />
									</div>
									<form:errors path="pc_file_1_ko" cssStyle="color: #ff0000;"/>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;국문 Mobile 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 750 X 1339</p>
								</th>
								<td>
								<c:if test="${'NONE' ne moFile1}">
									<div class="w100"><c:out value="${moFile1}" /><a class="btn-line-delete" data-btn="<c:out value="${moFileKey1}"/>"><span>삭제</span></a></div>
									<form:hidden path="moFileName1" value="${moFile1}" />
								</c:if>
								<c:if test="${'NONE' eq moFile1}">
									<div class="w100">
										<form:input type="file" path="mo_file_1_ko" title="국문 모바일 이미지" />
									</div>
									<form:errors path="mo_file_1_ko" cssStyle="color: #ff0000;"/>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;영문 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1920 X 980</p>
								</th>
								<td>
								<c:if test="${'NONE' ne pcFile2}">
									<div class="w100"><c:out value="${pcFile2}" /><a class="btn-line-delete" data-btn="<c:out value="${pcFileKey2}"/>"><span>삭제</span></a></div>
									<form:hidden path="pcFileName2" value="${pcFile2}" />
								</c:if>
								<c:if test="${'NONE' eq pcFile2}">
									<div class="w100">
										<form:input type="file" path="pc_file_2_en" title="영문 이미지" />
									</div>
									<form:errors path="pc_file_2_en" cssStyle="color: #ff0000;"/>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;영문 Mobile 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 750 X 1339</p>
								</th>
								<td>
								<c:if test="${'NONE' ne moFile2}">
									<div class="w100"><c:out value="${moFile2}" /><a class="btn-line-delete" data-btn="<c:out value="${moFileKey2}"/>"><span>삭제</span></a></div>
									<form:hidden path="moFileName2" value="${moFile2}" />
								</c:if>
								<c:if test="${'NONE' eq moFile2}">
									<div class="w100">
										<form:input type="file" path="mo_file_2_en" title="영문 모바일 이미지" />
									</div>
									<form:errors path="mo_file_2_en" cssStyle="color: #ff0000;"/>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;스페인 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1920 X 980</p>
								</th>
								<td>
								<c:if test="${'NONE' ne pcFile3}">
									<div class="w100"><c:out value="${pcFile3}" /><a class="btn-line-delete" data-btn="<c:out value="${pcFileKey3}"/>"><span>삭제</span></a></div>
									<form:hidden path="pcFileName3" value="${pcFile3}" />
								</c:if>
								<c:if test="${'NONE' eq pcFile3}">
									<div class="w100">
										<form:input type="file" path="pc_file_3_es" title="영문 이미지" />
									</div>
									<form:errors path="pc_file_3_es" cssStyle="color: #ff0000;"/>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;스페인 Mobile 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 750 X 1339</p>
								</th>
								<td>
								<c:if test="${'NONE' ne moFile3}">
									<div class="w100"><c:out value="${moFile3}" /><a class="btn-line-delete" data-btn="<c:out value="${moFileKey3}"/>"><span>삭제</span></a></div>
									<form:hidden path="moFileName3" value="${moFile3}" />
								</c:if>
								<c:if test="${'NONE' eq moFile3}">
									<div class="w100">
										<form:input type="file" path="mo_file_3_es" title="영문 모바일 이미지" />
									</div>
									<form:errors path="mo_file_3_es" cssStyle="color: #ff0000;"/>
								</c:if>
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
								<th>&nbsp;국문 Web 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koWebTitle" class="ip-text" title="국문 Web 타이틀" placeholder="국문 Web Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koWebTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;영문 Web 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enWebTitle" class="ip-text" title="영문 Web 타이틀" placeholder="영문 Web Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="enWebTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;스페인 Web 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esWebTitle" class="ip-text" title="스페인 Web 타이틀" placeholder="스페인 Web Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="esWebTitle" cssStyle="color: #ff0000;"/>
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
								<th>&nbsp;국문 Web Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koWebSubTitle" class="ip-text" title="국문 Web 타이틀" placeholder="국문 Web Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koWebSubTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;영문 Web Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enWebSubTitle" class="ip-text" title="영문 Web 타이틀" placeholder="영문 Web Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="enWebSubTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;스페인 Web Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esWebSubTitle" class="ip-text" title="스페인 Web 타이틀" placeholder="스페인 Web Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="esWebSubTitle" cssStyle="color: #ff0000;"/>
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
								<th>&nbsp;국문 Mobile 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koMoTitle" class="ip-text" title="국문 Mobile 타이틀" placeholder="국문 Mobile Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koMoTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;영문 Mobile 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enMoTitle" class="ip-text" title="영문 Mobile 타이틀" placeholder="영문 Mobile Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="enMoTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;스페인 Mobile 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esMoTitle" class="ip-text" title="스페인 Mobile 타이틀" placeholder="스페인 Mobile Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="esMoTitle" cssStyle="color: #ff0000;"/>
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
								<th>&nbsp;국문 Mobile Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koMoSubTitle" class="ip-text" title="국문 Web 타이틀" placeholder="국문 Mobile Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="koMoSubTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;영문 Mobile Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enMoSubTitle" class="ip-text" title="영문 Web 타이틀" placeholder="영문 Mobile Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="enMoSubTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;스페인 Mobile Sub 타이틀</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esMoSubTitle" class="ip-text" title="스페인 Web 타이틀" placeholder="스페인 Mobile Sub Title 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="esMoSubTitle" cssStyle="color: #ff0000;"/>
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
								<th>국문 링크 버튼명</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koLinkBtnName" class="ip-text" title="국문 링크 버튼명" placeholder="국문 링크 버튼명 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="koLinkBtnName" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>영문 링크 버튼명</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enLinkBtnName" class="ip-text" title="영문 링크 버튼명" placeholder="영문 링크 버튼명 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="enLinkBtnName" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>스페인어 링크 버튼명</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esLinkBtnName" class="ip-text" title="스페인어 링크 버튼명" placeholder="스페인어 링크 버튼명 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="esLinkBtnName" cssStyle="color: #ff0000;"/>
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
								<th>국문 Web URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koWebUrl" class="ip-text" title="국문 Web Url" placeholder="국문 Web Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="koWebUrl" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>영문 Web URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enWebUrl" class="ip-text" title="영문 Web Url" placeholder="영문 Web Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="enWebUrl" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>스페인 Web URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esWebUrl" class="ip-text" title="스페인  Web Url" placeholder="스페인  Web Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="esWebUrl" cssStyle="color: #ff0000;"/>
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
								<th>국문 Mobile URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koMoUrl" class="ip-text" title="국문 Mobile Url" placeholder="국문 Mobile Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="koMoUrl" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>영문 Mobile URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enMoUrl" class="ip-text" title="영문 Mobile Url" placeholder="영문 Mobile Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="enMoUrl" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>스페인 Mobile URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esMoUrl" class="ip-text" title="스페인  Mobile Url" placeholder="스페인  Mobile Url 입력해주세요." maxlength="200" />
									</div>
									<form:errors path="esMoUrl" cssStyle="color: #ff0000;"/>
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
		// 저장 버튼
		$('#btn-save').off('click').on('click', function() {
			$('#form').submit();
		});
		
		// 이미지 삭제
		$('[data-btn]').on('click', function() {
			if(confirm('선택한 이미지를 삭제 하시겠습니까?')) {
				$.getJSON('/admin/file/delete/' + $(this).data('btn'), function() {
					window.location.reload();
				}).error(function() {console.log(arguments)});
			}
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${0 < page.totalCount}">
<div class="paging">
	<div class="ctrl">
		<a class="first" data-target="<c:out value="${page.firstPageNo}"/>">
			<img src="<c:url value="/images/paging_first.png"/>" alt="첫페이지">
		</a>
	</div>
	<div class="ctrl">
		<a class="prev" data-target="<c:out value="${page.prevPageNo}"/>">
			<img src="<c:url value="/images/paging_prev.png"/>" alt="이전페이지">
		</a>
	</div>
	<ol>
	<c:forEach var="item" step="1" begin="${page.startPageNo}" end="${page.endPageNo}" >
		<li <c:if test="${item == page.pageNo}">class="on"</c:if>>
			<strong>
				<a data-target="${item}"><c:out value="${item}"/></a>
			</strong>
		</li>
	</c:forEach>
	</ol>
	<div class="ctrl">
		<a class="next" data-target="<c:out value="${page.nextPageNo}"/>">
			<img src="<c:url value="/images/paging_next.png"/>" alt="다음페이지">
		</a>
	</div>
	<div class="ctrl">
		<a class="last" data-target="<c:out value="${page.finalPageNo}"/>">
			<img src="<c:url value="/images/paging_last.png"/>" alt="마지막페이지">
		</a>
	</div>
</div>
<script>
	window.onload = function() {
		$('div.paging').find('a').on('click', function() {
			var $page = $(this).data('target');
			var $form = $('#form');

			// include 페이지에 form 테그가 없으면 동적 생성 한다.
			if(0 === $form.length) {
				$form = $('<form></form>');
				$form.appendTo('body');
			}

			if (0 === $form.find('input[name="page"]').length) {
				
				$form.append($('<input/>', {type:'hidden', name:'page', value : $page}));
			} else {
				
				$form.find('input[name="page"]').val($page);
			}
			$form.attr('method', 'post');
			$form.submit();
		});
	};
</script>
</c:if>
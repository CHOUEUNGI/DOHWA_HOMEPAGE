<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/admin/js/jquery-1.12.4.min.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="/admin/js/jquery-ui.min.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="/admin/js/datepicker-ko.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="/admin/js/ckeditor.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="/admin/js/common.js"/>" type="text/javascript" charset="utf-8"></script>
<script>
	
	// 비밀번호 변경 버튼
	$("#btn-password-change-popup").on('click', function() {
		layer_popup('#layer2');
	});

	function layer_popup(el) {
	
	    var $el = $(el);        //레이어의 id를 $el 변수에 저장
	    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
	
	    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	
	    var $elWidth = ~~($el.outerWidth()),
	        $elHeight = ~~($el.outerHeight()),
	        docWidth = $(document).width(),
	        docHeight = $(document).height();
	
	    // 화면의 중앙에 레이어를 띄운다.
	    if ($elHeight < docHeight || $elWidth < docWidth) {
	        $el.css({
	            marginTop: -$elHeight /2,
	            marginLeft: -$elWidth/2
	        })
	    } else {
	        $el.css({top: 0, left: 0});
	    }
	
	    // 기존 비밀번호 포커스
	    $('#pswd').focus();
	    
	    // 저장
	    $el.find('a.btn-layerSave').click(function(){
	    	changePassword();
	    });
	
	    // 닫기
	    $el.find('a.btn-layerClose').click(function(){
	        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	        return false;
	    });
	    
	    $('.layer .dimBg').click(function(){
	        $('.dim-layer').fadeOut();
	        return false;
	    });
	}
	
	function changePassword() {
		if('' === $('#pswd').val()) {
			$('#pswd').focus();
		} else if('' === $('#updPswd').val()) {
			$('#updPswd').focus();
		} else if('' === $('#updPswdRe').val()) {
			$('#updPswdRe').focus();
		} else {
			$.ajax({
				url : '/admin/user/pswd',
				type : 'post',
				data : {
					pswd : $('#pswd').val(),
					updPswd : $('#updPswd').val(),
					updPswdRe : $('#updPswdRe').val()
				},
				dataType: 'json',
				success : function(data) {
					alert(data.message);
					if(data.success) {
						$('.dim-layer').fadeOut();
					}
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
	}
	
</script>
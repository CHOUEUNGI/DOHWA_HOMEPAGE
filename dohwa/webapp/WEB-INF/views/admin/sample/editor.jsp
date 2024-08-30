<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CKEditor5 Sample</title>
	<style type="text/css">	
		.ck-editor__editable { min-height: 300px; max-height: 500px; }
	</style>
</head>
<body>
	<h1>CKEditor5 Classic Sample</h1>
	
	<form action="/" method="post">
	
        <textarea name="content" id="cksample1">
        	<c:out value="첫번째 Editor" />
        </textarea>
        <input type="button" value="setValue" onclick="fncSetValue(0); return false;">
        <input type="button" value="getValue" onclick="fncGetValue(0); return false;">
        
        <hr>
        
        <textarea name="content" id="cksample2">
        	<c:out value="두번째 Editor" />
        </textarea>
        <input type="button" value="setValue" onclick="fncSetValue(1); return false;">
        <input type="button" value="getValue" onclick="fncGetValue(1); return false;">
    </form>
</body>
<%@ include file="/WEB-INF/views/admin/layout/after_script.jsp" %>
<script>
    
    // git push 확인용.
    // CKEditor 생성
    // Parameter는 생성할 editor의 선택자 배열 (ex : ['sample1']) 
    var editor = new CKEditor( ['#cksample1', '#cksample2'] );
    
    function fncSetValue(i) {
    	var setValue = prompt('설정할 내용을 입력하세요.');
    	editor[i].setData( setValue );
    }
    
    function fncGetValue(i) {
    	alert(editor[i].getData());
    }
</script>
</html>
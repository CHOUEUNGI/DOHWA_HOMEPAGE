
# GUIDE

## ADMIN
### - Editor
CKEditor 공통 설정
```html
<textarea name="content1" id="cksample1">
	<c:out value="첫번째 Editor" />
</textarea>

<textarea name="content2" id="cksample2">
	<c:out value="첫번째 Editor" />
</textarea>
```
```javascript
var editor = new CKEditor( ['#cksample1', '#cksample2'] );
```

## FRONT
### - messageUtils.js
Client단에서 다국어 Message Properties를 사용한다.
```html
<script src="<c:url value="/inc/js/messageUtils.js" />" type="text/javascript"></script>
```
```javascript
messageUtils.get(code, argumests...);

alert(messageUtils.get('TEST.001'));
```
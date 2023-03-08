<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL remove</title>
</head>

<body>

	<h1>JSTL Remove Example - c:remove</h1>
	<hr>
	<c:set var="msg" value="Hello world!"/>
	<!-- msg라는 이름의 변수 => Hello world! 값 저장 -->
	<p>
		msg: ${msg} <br> 
		msg: <%= pageContext.getAttribute("msg") %>
	</p>
	<hr>
	
	<!-- context.setAttribute("member", new Member()); 가져옴 -->
	<!-- Listener에서 저장했던 거 -->
	<c:set var="msg" value="hello World"/>
	<p>
		Before Remove<br>
		msg: ${msg }
	</p>
	
	<c:remove var="msg"/>
	<p>
		After Remove<br>
		msg: ${msg }
	</p>
	
</body>
</html>
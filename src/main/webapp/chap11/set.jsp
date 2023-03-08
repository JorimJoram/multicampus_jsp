<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL set</title>
</head>

<body>

	<h1>JSTL Set Example - c:set</h1>
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
	<c:set target="${member}" property="email" value="changed@naver.com"/>
	<p>
		Changed<br>
		Member name: ${member.name}<br>
		Member email: ${member.email}
	</p>
	
	
</body>
</html>
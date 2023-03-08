<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL if</title>
</head>

<body>

	<h1>JSTL If Example - c:if</h1>
	<hr>
	
	<c:set var="msg" value="user1"/>
	<p>msg: ${msg}</p>
	<hr>
	
	<c:if test="${msg == 'user1'}" var="result1"/>
	<p>Result1 : ${result1 }</p>
	<c:if test="${msg == 'user2' }" var="result2"/>
	<p>Result2: ${result2 }</p>
	
	<c:if test="${msg == 'user1' }" var="result3">
		<h4>test Result: ${result3 }</h4>
	</c:if>
	<c:if test="${msg == 'user2' }" var="result4">
		<h4>test Result: ${result4 }</h4>
	</c:if>
</body>
</html>
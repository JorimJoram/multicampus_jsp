<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<h1>JSTL c:url</h1>
	<hr>
	<c:url value="/chap11/choose.jsp" var="target">
		<c:param name="sel">a</c:param>
	</c:url>
	<p>
		단순 출력: ${target }<br>
		링크 연동: <a href="${target }">이동</a>
	</p>
	
	<c:url value="/choose.jsp" context="/Janghyorim_web/" var="target">
		<c:param name="sel">a</c:param>
	</c:url>
	<p>
		단순 출력: ${target }<br>
		링크 연동: <a href="${target }">이동</a>
	</p>
	<hr>
	
	
</body>
</html>
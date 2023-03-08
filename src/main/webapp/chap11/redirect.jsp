<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<h1>JSTL c:redirect</h1>
	<hr>
	
	<c:redirect url="/chap11/choose.jsp">
		<c:param name="sel">c</c:param>
	</c:redirect>
</body>
</html>
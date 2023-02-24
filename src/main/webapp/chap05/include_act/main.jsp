<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name = "jorim";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<div id = "contents">
		
		<jsp:include page="left.jsp"/>
		<jsp:include page="right.jsp"/>
		
	</div>
	<jsp:include page="footer.jsp">
		<jsp:param name="email" value="jorimjoram@naver.com"/>
		<jsp:param name="tel" value="+82-1234-5678"/>
	</jsp:include>
	
</body>
</html>
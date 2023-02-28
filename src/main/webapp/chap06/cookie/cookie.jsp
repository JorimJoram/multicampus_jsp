<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookie = new Cookie("test", "value1");
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Make Cookie great again</title>
</head>

<body>

	<h1>Test my Cookies</h1>
	<hr>
	
	<h4>View your inspection</h4>

</body>
</html>
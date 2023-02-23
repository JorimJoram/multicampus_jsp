<%@ page contentType="text/html; charset=UTF-8" 
		errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ErrorThrows JSP</title>
</head>

<body>

	<h2>Currently, Error occurred in this JSP document</h2>
	<hr>
	
	<%
		int num1 = 10, num2 = 0;
		int result = num1/num2;
	%>
	<h4><%= result %></h4>

</body>
</html>
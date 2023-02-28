<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	String cookieName = "";
	String cookieValue = "";
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cookieName")){
				cookieName = cookies[i].getName();
				cookieValue = cookies[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Result Cookies</title>
</head>

<body>

	<h1>Result</h1>
	<hr>
	<%= cookieName %>
	<%= cookieValue %>

</body>
</html>
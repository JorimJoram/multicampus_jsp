<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String myName="JorimJoram";
	request.setAttribute("myName", myName);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>El Result jsp</title>
</head>

<body>

	<h2>EL Result</h2>
	<hr>
	
	<p>${pageScope.pageElTest }</p>
	<p>${requestScope.reqElTest }</p>
	<p>${sessionScope.sesElTest }</p>
	<p>${applicationScope.appElTest }</p>
	
	${param.userName }<br>
	${paramValues.favorite[0]} / ${paramValues.favorite[1] }<br>
	${cookie.elCookie.name } = ${cookie.elCookie.value }<br>
	
	adminID : ${initParam.adminID }<br>
	adminPW : ${initParam.adminPasswd }<br>
	<%= myName %><br>
	${request.myName }<br>
</body>
</html>
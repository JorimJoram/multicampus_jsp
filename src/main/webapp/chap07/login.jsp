<%@ page contentType="text/html; charset=UTF-8"
	import="chap07.loginBean"
%>

<jsp:useBean id="loginbean" class="chap07.loginBean"/>

<%--
<jsp:setProperty name="loginbean" property="id" />
<jsp:setProperty name="loginbean" property="passwd"/> 
--%>
<jsp:setProperty name="loginbean" property="*" />
<%
	String msg = "";
	
	if(loginbean.checkLogin()){
		msg += "<h4>Welcome " + loginbean.getId() + "</h4>";
	}else{
		msg += "Failure to Login";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<h1>Result of Login</h1>
	<hr>
	<%= msg %>
	<h5>
		id: <jsp:getProperty name="loginbean" property="id" /> 
		passwd: <jsp:getProperty name="loginbean" property="passwd" />
	 </h5>
</body>
</html>
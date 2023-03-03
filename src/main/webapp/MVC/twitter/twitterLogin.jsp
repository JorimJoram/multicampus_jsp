<%@ page contentType="text/html; charset=UTF-8"
		import="twitter.*"%>
		
<jsp:useBean id="loginDAO" class="twitter.TwitterDAO" scope="session"/>
<jsp:useBean id="loginDO" class="twitter.TwitterLoginDO" scope="page"/>
<jsp:setProperty name="loginDO" property="*"/>

<%
	if(request.getMethod().equals("POST")){
		TwitterLoginDO result = loginDAO.checkLogin(loginDO);
		if(result != null){
			session.setAttribute("id", result.getId());
			session.setAttribute("name", result.getName());
			response.sendRedirect("twitterList.jsp");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Twitter(?) Login jsp</title>
</head>

<body>

	<h1>Twitter(?) Login</h1>
	<hr>
	
	<form method="POST">
	<fieldset>
		<label for="id">ID</label>
		<input type="text" name="id" id="id"/>
		<label for="passwd">PW</label>
		<input type="password" name="passwd" id="passwd"/>
		<input type="submit" value="login"/>
	</fieldset>
	</form>
</body>
</html>
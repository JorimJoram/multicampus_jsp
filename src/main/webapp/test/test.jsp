<%@ page contentType="text/html; charset=UTF-8"
	import="test.*, java.util.*"%>
<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>
<jsp:useBean id="dao" class="test.JdbcTestDAO" scope="session"/>
<jsp:useBean id="testDO" class="test.JdbcTestDO" scope="page"/>

<jsp:setProperty name="testDO" property="*"/>

<%
	if(request.getMethod().equals("POST")){
		dao.insertJdbcTest(testDO);
	}
	ArrayList<JdbcTestDO> items = dao.selectAll();
	String list = "";
	for(JdbcTestDO item : items){
		list += "<li>username: " + item.getUsername() + " | " + item.getEmail();
	}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<h1>jdbc test</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>사용자 등록</legend>
			<label for="username">name</label>
			<input type="text" name="username", id="username"/>
			<label for="email">email</label>
			<input type="email" name="email", id="email"/>
			<input type="submit" value="Regist"/>
		</fieldset>
	</form>
	<hr>
	
	<h3>Register List</h3>
	<ol>
		<%= list %>
	</ol>
</body>
</html>
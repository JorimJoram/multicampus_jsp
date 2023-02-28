<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="jdbcBeans" class="chap08.JdbcBeans"/>
<jsp:setProperty name="jdbcBeans" property="*"/>

<%
	//java Beansd 와 action을 이용하여 동일한 기능 구현하시면 됩니다.
	if(jdbcBeans.)
%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

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
		<%= jdbcBeans.getList() %>
	</ol>

</body>
</html>
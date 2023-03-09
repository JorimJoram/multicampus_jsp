<%@ page contentType="text/html; charset=UTF-8"
		import="chap12.*, java.util.*"%>

<%
	if(request.getMethod().equals("POST"))
		request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="DAO" class="chap12.InstructorDAO" scope="session"/>
<jsp:useBean id="DO" class="chap12.InstructorDO" scope="page"/>
<jsp:setProperty name="DO" property="*"/>

<%
	if(request.getMethod().equals("POST")){
		DAO.insertJdbcTest(DO);
	}
	ArrayList<InstructorDO> list = DAO.selectAll();
	String result = "";
	
	for(InstructorDO item : list){
		result += "<li>"+item.getUsername() + " | ";
		result += item.getEmail() + "</li>";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc_test2 jsp</title>
</head>

<body>
	<form method="POST">
		<fieldset>
			<legend>사용자 등록</legend>
			<label for="name">name</label>
			<input type="text" name="name" id="name"/>
			<label for="email">email</label>
			<input type="email" name="email" id="email"/>
			<input type="submit" value="Regist"/>
		</fieldset>
	</form>
	
	<h3>Register List</h3>
	<ol>
		<%= result %>
	</ol>

</body>
</html>
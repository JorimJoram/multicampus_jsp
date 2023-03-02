<%@ page contentType="text/html; charset=UTF-8"
	import="chap08.*, java.util.*"%>

<jsp:useBean id="dao" class="chap08.InstructorDAO" scope="session"/>
<jsp:useBean id="testDO" class="chap08.InstructorDO" scope="page"/>

<jsp:setProperty name="testDO" property="*"/>


<%
	if(request.getMethod().equals("POST")){
		dao.insertJdbcTest(testDO);
	}
	ArrayList<InstructorDO> list = dao.selectAll();
	String result = "";
	
	for(InstructorDO item : list){
		result += "<li>"+item.getName() + " | ";
		result += item.getEmail() + "</li>";
	}
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
			<label for="name">name</label>
			<input type="text" name="name" id="name"/>
			<label for="email">email</label>
			<input type="email" name="email" id="email"/>
			<input type="submit" value="Regist"/>
		</fieldset>
	</form>
	<hr>
	
	<h3>Register List</h3>
	<ol>
		<%= result %>
	</ol>

</body>
</html>
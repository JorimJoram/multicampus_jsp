<%@ page contentType="text/html; charset=UTF-8"
		import="twitter.*, java.util.*"%>

<%
	@SuppressWarnings("unchecked")
	ArrayList<TwitterDO> list = (ArrayList<TwitterDO>)session.getAttribute("list"); //Controller에서 세션에 저장했던 리스트 가져오기
	String result = "";
	for(TwitterDO tDO : list){
		result += "<li>" + tDO.getId() + " ::: " + tDO.getMessage() + " ::: " + tDO.getCreateDate() + "</li>";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>twitterList jsp</title>
</head>

<body>

	<h2>My Simple Twitter</h2>
	<hr>

	<form method="POST">	
		<fieldset>
			<label><%= session.getAttribute("id") %> @ <%=session.getAttribute("name") %></label>
			<input type="text" name="message" size="50"/>
			<input type="hidden" name="command" value="twitterInsert"/>
			<input type="submit" value="등록"/>
		</fieldset>
	</form>
	<hr>
	
	<h3>Twitter List</h3>
	<ul>
		<%= result %>
	</ul>
	<hr>
	<form method="POST">	
		<input type="hidden" name="command" value="logout"/>
		<input type="submit" value="logout"/>
	</form>
</body>
</html>

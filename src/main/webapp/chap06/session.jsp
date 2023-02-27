<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String script = "";	
	//String username = (String)session.getAttribute("username"); //Object형으로 반환되므로 명시적 형변환 필요

	if(session.isNew()){
		//session이 최초로 만들어진다면...
		script += "alert('Session Obejct Create now')";
		
		session.setAttribute("username", "jorimjoram");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>session jsp</title>
	<script>
		<%= script %>
	</script>
</head>

<body>

	<h1>Session Example</h1>
	<hr>
	

	<h4><%= session.getAttribute("username") %></h4>
	<h4>Session valid Time: <%= session.getMaxInactiveInterval() %></h4>
	<h4>Session ID: <%= session.getId() %></h4>
	<!-- 이전에 사용했다면 stop -> start 권장. restart도 정상적으로 진행됨 -->
	

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	application.setAttribute("userName", "HyeHwa");
	application.setAttribute("job", "Dreamer");
	application.log("create application.jsp log");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>application jsp</title>
</head>

<body>

	<h1>Application Example</h1>
	<hr>
	
	<p>Server info: <%=application.getServerInfo() %></p>
	<h4>Servlet API Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></h4>
	<h4>application.jsp real path: <%=application.getRealPath("application.jsp") %></h4>
	<hr>
	
	<h2>application Store checking</h2>
	<h4><a href="applicationResult.jsp">check</a></h4>
	

</body>
</html>
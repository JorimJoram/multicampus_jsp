<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Out jsp</title>
</head>

<body>

	<h1>out inner Object</h1>
	<hr>
	
	<h4>1. BufferSize: <%= out.getBufferSize()%></h4>
	<h4>2. RemainBufferSize: <%= out.getRemaining()%></h4>
	<%
		out.flush();
	%>
	<h4>3. After Flush RemainBufferSize: <%= out.getRemaining()%></h4>
	<%
		out.clear();
	%>
	<h4>4. After Clear RemainBufferSize: <%= out.getRemaining() %></h4>
	<%
		out.close();
	%>
	<h4>5. After Close RemainBufferSize: <%= out.getRemaining() %></h4>
	
</body>
</html>
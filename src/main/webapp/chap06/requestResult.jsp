<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*"
%>

<%
	request.setCharacterEncoding("UTF-8");
	Enumeration<String> name_enum = request.getParameterNames();
	String parameterNames = "";	

	while(name_enum.hasMoreElements()){
		parameterNames += name_enum.nextElement() + " ";
	}
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String[] favorite = request.getParameterValues("favorite");
	String myFavorite = "";
	for(String str : favorite){
		myFavorite += str + ", ";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		document.cookie = 'test=OK!';
	</script>
</head>

<body>

	<h1>Request Inner Object</h1>
	<hr>
	<h4><%= parameterNames %></h4>
	<h4>name: <%= name %></h4>
	<h4>gender: <%= gender %></h4>
	<h4>job: <%= job %></h4>
	<h4>favorite: <%= myFavorite %></h4>
	
	<hr>
	
	<h1>Client Request Information</h1>
	<h4>cookie: <%= request.getCookies()[0].getName() %> = <%= request.getCookies()[0].getValue() %></h4>
	<h4>method: <%= request.getMethod() %></h4>
	<h4>protocol: <%= request.getProtocol() %></h4>
	<h4>remoteAddr: <%= request.getRemoteAddr() %></h4>
	<hr>
</body>
</html>
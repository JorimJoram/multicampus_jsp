<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>

	<div id="header">
		<h1>[mail] [cafe] [blog] [news] [sports] [shopping]</h1>
	</div>
	<div id = "contents">
		<div id="left">
			<h3>News</h3>

				<h5>Gov</h5>
				<h5>backend</h5>
				<h5>breaking</h5>
				<h5>Emergence</h5>

		</div>
		
		<div id="right">
			<h1>Shopping</h1>
			
				<h5>Computer</h5>
				<h5>MagicKeyBoard</h5>
				<h5>Ipad</h5>
				<h5>I9-notebooks</h5>
		</div>
	</div>
	<div id="footer">
		<h3>[about us] [location] [pageMap]</h3>
		<h4><%= name %> email <%= email %> tel <%= tel %></h4>
	</div>
	
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" 
		isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Error JSP</title>
	<style>
		#target{
			border: 2px solid gold;
			background-color: yellow;
			color: red;
			text-align: center;
			padding: 20px;
		}
	</style>
</head>

<body>

	<h1>ErrorPage</h1>
	
	<div id="target">
		<%= exception%>
	</div>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Result jsp</title>
</head>

<body>

	<h1>application Result</h1>
	<hr>
	
	<h4>name: <%= application.getAttribute("userName") %></h4>
	<h4>job: <%= application.getAttribute("job") %></h4>
	
</body>
</html>
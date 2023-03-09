<%@ page contentType="text/html; charset=UTF-8"
		errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
	<style>
		form{
			display:inline;
		}
		input{
			width:200px;
			height:80px;
			font-size:30px;
		}
	</style>
</head>

<body>

	<h1>성적관리 페이지</h1>
	<hr>
	
	<h3>Main Page</h3>
		<form method="POST">
				<input type="hidden" name="command" value="create"/>
				<input type="submit" value="성적작성"/>
		</form>
		<form method="POST">
				<input type="hidden" name="command" value="read"/>
				<input type="submit" value="성적조회"/>
		</form>
</body>
</html>
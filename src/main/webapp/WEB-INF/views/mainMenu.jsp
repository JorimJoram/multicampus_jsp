<%@ page contentType="text/html; charset=UTF-8"
		errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
</head>

<body>

	<h1>Main</h1>
	<hr>
	
	<h3>Main Page</h3>
	<!-- 일단 굴러만 가도록 만들어놓음;; -->
	<form method="POST">
		<fieldset>
			<input type="hidden" name="command" value="create"/>
			<input type="submit" value="성적작성"/>
		</fieldset>
	</form>
	<form method="POST">
		<fieldset>
			<input type="hidden" name="command" value="read"/>
			<input type="submit" value="성적조회"/>
		</fieldset>
	</form>
</body>
</html>
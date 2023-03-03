<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login jsp</title>
</head>

<body>

	<h1>Login</h1>
	<hr>
	
	<form method="POST">
	<fieldset>
		<label for="id">ID</label>
		<input type="text" name="id" id="id"/>
		<label for="passwd">PW</label>
		<input type="password" name="passwd" id="passwd"/>
		<input type="submit" value="login"/>
	</fieldset>
	</form>
	
</body>
</html>

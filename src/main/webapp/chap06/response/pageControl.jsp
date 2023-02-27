<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pageControl.jsp</title>
</head>

<body>

	<h1>forward vs redirect</h1>
	<hr>
	
	<form action="forward.jsp" method="POST">
		<fieldset>
			<legend>forward test</legend>
			<label for="username">name</label>
			<input type="text" name="username" id="username"/>
			<input type="submit" value="send"/>
		</fieldset>
		
	</form>
	<hr>
	
	<form action="redirect.jsp" method="POST">
		<fieldset>
			<legend>redirect test</legend>
			<label for="username">name</label>
			<input type="text" name="username" id="username"/>
			<input type="submit" value="send"/>
		</fieldset>
	</form>
</body>
</html>
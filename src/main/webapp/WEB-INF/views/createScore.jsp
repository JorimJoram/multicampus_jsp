<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>score Create</title>
</head>

<body>

	<h1>Create Scores</h1>
	<hr>

	<form method="POST">
		<fieldset>
			<legend>성적 입력</legend>
			<label for="korean">국어</label>
			<input type="number" step=0.01 name="korean"/><br>
			<label for="math">수학</label>
			<input type="number" step=0.01 name="math"/><br>
			<label for="english">영어</label>
			<input type="number" step=0.01 name="english"/><br>
			<label for="science">과학</label>
			<input type="number" step=0.01 name="science"/><br>
		</fieldset>
		<input type="hidden" name="write" value="create_score"/>
		<input type="submit" value="성적입력"/>
	</form>
</body>
</html>
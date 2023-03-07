<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Student</title>
</head>

<body>

	<h1>Create Student</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>학생정보 입력</legend>
			<label for="id">학번</label>
			<input type="text" name="id"/><br>
			<label for="name">이름</label>
			<input type="text" name="name"/><br>
			<label for="gender">성별</label>
			<select name="gender">
				<option>남</option>
				<option>여</option>
			</select>
		</fieldset>
		<input type="hidden" name="write" value="create_info"/>
		<input type="submit" value="작성"/>
	</form>
	<button onclick="location.href='controller.jsp'">메뉴로 이동</button>
</body>
</html>
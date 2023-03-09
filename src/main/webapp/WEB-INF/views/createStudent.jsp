<%@ page contentType="text/html; charset=UTF-8"
	errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Student</title>
	<style>
		td{
			padding:20px;
		}
		input[type="number"]::-webkit-inner-spin-button,
		input[type="number"]::-webkit-outer-spin-button{
			-webkit-appearance: none;
			margin:0;
		}
	</style>
</head>

<body>

	<h1>Create Student</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>학생정보 입력</legend>
			<label for="id">학번</label>
			<input type="text" name="id" pattern="^[0-9]+$" placeholder="예)20162173"/><br>
			<label for="name">이름</label>
			<input type="text" name="name" placeholder="예)장효림"><br>
			<label for="gender">성별</label>
			<select name="gender">
				<option selected>남</option>
				<option>여</option>
			</select>
		</fieldset>
		
		<fieldset>
			<legend>성적 입력</legend>
			<label for="korean">국어</label>
			<input type="number" step=0.01 name="korean" min="0" max="100" placeholder="0~100, 소수점 2자리" size=10/><br>
			<label for="math">수학</label>
			<input type="number" step=0.01 name="math" min="0" max="100" placeholder="0~100, 소수점 2자리"/><br>
			<label for="english">영어</label>
			<input type="number" step=0.01 name="english" min="0" max="100" placeholder="0~100, 소수점 2자리"/><br>
			<label for="science">과학</label>
			<input type="number" step=0.01 name="science" min="0" max="100" placeholder="0~100, 소수점 2자리"/><br>
		</fieldset>
		
		<input type="hidden" name="write" value="create_info"/>
		<input type="submit" value="작성"/>
	</form>
	<button onclick="location.href='controller.jsp'">메뉴로 이동</button>
</body>
</html>
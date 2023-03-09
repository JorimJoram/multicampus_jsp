<%@ page contentType="text/html; charset=UTF-8"
		import="java.util.*, model.*"
		errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Student</title>
	<style>
		table{
				text-align:center;
			}
		td{
			padding:20px;
		}
		input[type="number"]::-webkit-inner-spin-button,
		input[type="number"]::-webkit-outer-spin-button{
			-webkit-appearance: none;
			margin:0;
		}
		input{
			size:500px;
		}
		#buttonContainer{
			margin-top: 10px;
		}
	</style>
</head>

<body>

	<h1>학생 정보 수정</h1>
	<hr>
	<fieldset>
		<legend>조회된 학생의 정보</legend>
		<table>
			<tr>
				<th>학번</th><th>이름</th><th>성별</th><th>생성날짜</th><th>국어</th><th>수학</th><th>영어</th><th>과학</th><th>수정일자</th>
			</tr>
			<tr>
				<td>${sessionScope.student.id }</td>
				<td>${sessionScope.student.name }</td>
				<td>${sessionScope.student.gender }</td>
				<td>${sessionScope.student.createDate }</td>
				<td>${sessionScope.score.korean }</td>
				<td>${sessionScope.score.math }</td>
				<td>${sessionScope.score.english }</td>
				<td>${sessionScope.score.science }</td>
				<td>${sessionScope.student.modifiedDate }</td>
			</tr>
		</table>
	</fieldset>
	<form method="POST">
		<fieldset>
			<legend>정보수정</legend>
			<fieldset>
				<legend>학생 정보</legend>
				<label for="id">학번</label>
				<input type="text" name="id" value="${sessionScope.student.id }" disabled/><br>
				<label for="name">이름</label>
				<input type="text" name="name" value="${sessionScope.student.name }"/><br>
				<label for="gender">성별</label>
				<select name="gender">
					<option ${sessionScope.student.gender == '남' ? 'selected' : '' }>남</option>
					<option ${sessionScope.student.gender == '여' ? 'selected' : '' }>여</option>
				</select>
			</fieldset>
			
			<fieldset>
				<legend>학생 성적</legend>
				<label for="korean">국어</label>
				<input type="number" step=0.01 name="korean" value="${sessionScope.score.korean }" min="0" max="100"/><br>
				<label for="math">수학</label>
				<input type="number" step=0.01 name="math" value="${sessionScope.score.math }" min="0" max="100"/><br>
				<label for="english">영어</label>
				<input type="number" step=0.01 name="english" value="${sessionScope.score.english }" min="0" max="100"/><br>
				<label for="science">과학</label>
				<input type="number" step=0.01 name="science"value="${sessionScope.score.science }" min="0" max="100"/><br>
			</fieldset>
			<div id="buttonContainer">
				<input type="hidden" name="write" value="update"/>
				<input type="submit" value="수정" />
				<button onclick="location.href='controller.jsp'">취소</button>
			</div>
		</fieldset>
	</form>
	
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"
		import="java.util.*, model.*"%>
<%
	StudentDO student = (StudentDO)session.getAttribute("student");
	ScoreDO score = (ScoreDO)session.getAttribute("score");
	String search = "";
	
	if(student != null && score != null){
		if(student.getId().equals("-1") || score.getKorean() == -1){
			search = "<p>등록되지 않은 학번의 학생입니다.<br>학번을 다시 확인하시고 조회해주시기 바랍니다.</p>";
		}else{
			search += "<table><tr><th>학번</th><th>이름</th><th>성별</th><th>생성날짜</th><th>국어</th><th>수학</th><th>영어</th><th>과학</th></tr>";
			search += "<tr>" 
						+"<td>"+ student.getId() + "</td>" 
						+"<td>"+ student.getName() + "</td>" 
						+"<td>"+ student.getGender() + "</td>"
						+"<td>"+student.getCreateDate() +"</td>"
						+"<td>"+ score.getKorean() + "</td>"
						+"<td>"+ score.getMath() + "</td>"
						+"<td>"+ score.getEnglish() + "</td>"
						+"<td>"+ score.getScience() + "</td>"
						+"</tr></table>";
		}
	}else{
		search = "검색을 통해 학생을 조회해보세요!";
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Student</title>
</head>

<body>

	<h1>학생 정보 수정</h1>
	<hr>
	<fieldset>
		<legend>조회된 학생의 정보</legend>
		<%= search %>
	</fieldset>
	<form method="POST">
		<fieldset>
			<legend>정보 수정</legend>
			<select name="subjectUpdate">
				<option>국어</option>
				<option>수학</option>
				<option>영어</option>
				<option>과학</option>
			</select>
		</fieldset>
	</form>
	<button onclick="location.href='controller.jsp'">메뉴로 이동</button>
</body>
</html>
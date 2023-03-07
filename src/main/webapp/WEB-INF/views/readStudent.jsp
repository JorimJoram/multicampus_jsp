<%@ page contentType="text/html; charset=UTF-8"
	import="model.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<StudentDO> students = (ArrayList<StudentDO>)session.getAttribute("students");
	@SuppressWarnings("unchecked")
	ArrayList<ScoreDO> scores = (ArrayList<ScoreDO>)session.getAttribute("scores");
	String result = "<table><tr><th>학번</th><th>이름</th><th>성별</th><th>생성날짜</th><th>국어</th><th>수학</th><th>영어</th><th>과학</th></tr>";
	
	for(int i=0; i < students.size(); i++){
		result += "<tr>" 
					+"<td>"+ students.get(i).getId() + "</td>" 
					+"<td>"+ students.get(i).getName() + "</td>" 
					+"<td>"+ students.get(i).getGender() + "</td>"
					+"<td>"+students.get(i).getCreateDate() +"</td>"
					+"<td>"+ scores.get(i).getKorean() + "</td>"
					+"<td>"+ scores.get(i).getMath() + "</td>"
					+"<td>"+ scores.get(i).getEnglish() + "</td>"
					+"<td>"+ scores.get(i).getScience() + "</td>"
					+"</tr>";
	}
	result += "</table>";
%>
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
	<title>Read Student</title>
</head>

<body>

	<h1>학생 정보 조회</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>학생 검색</legend>
			<label>학번</label>
			<input type="number" name="id"/>
			<input type="hidden" name="write" value="search"/>
			<input type="submit" value="검색"/>
		</fieldset>
	</form>
	
	<fieldset>
		<legend>검색결과</legend>
			<%= search %>
			<%if(student != null && score != null){if(!(student.getId().equals("-1") || score.getKorean() == -1)){%>
				<form method="POST" style="display:inline">
					<input type="hidden" name="command" value="정보수정"/>
					<input type="submit" value="정보수정"/>
				</form>
				<form method="POST" style="display:inline">
					<input type="hidden" name="write" value="delete"/>
					<input type="submit" value="정보삭제"/>
				</form>
			<%}}%>
	</fieldset>
	
	<fieldset>
		<legend>전체 조회</legend>
			<%= result %>
	</fieldset>
	
	
	
	<button onclick="location.href='controller.jsp'">메뉴로 이동</button>
</body>
</html>
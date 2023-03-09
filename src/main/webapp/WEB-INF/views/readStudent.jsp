<%@ page contentType="text/html; charset=UTF-8"
	import="model.*, java.util.*"
	errorPage="errorCreate.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	@SuppressWarnings("unchecked")
	ArrayList<StudentDO> students = (ArrayList<StudentDO>)application.getAttribute("students");
	@SuppressWarnings("unchecked")
	ArrayList<ScoreDO> scores = (ArrayList<ScoreDO>)application.getAttribute("scores");
	for(StudentDO student:students)
		System.out.println(student.getId());
	System.out.println("SCORE: " + scores.toString());
	for(ScoreDO score: scores){
		System.out.println(score.getKorean());
	}
	String result = "";
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
					+"<td>"+ students.get(i).getModifiedDate()+"</td>"
					+"</tr>";
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Read Student</title>
		<style>
			table{
				text-align:center;
			}
			td{
				padding:20px;
			}
			#search_button_container{
				padding:auto 10px;
			}
			input[type="number"]::-webkit-inner-spin-button,
			input[type="number"]::-webkit-outer-spin-button{
				-webkit-appearance: none;
				margin:0;
			}
		</style>
	</head>


<body>

	<h1>학생 정보 조회</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>학생 검색</legend>
			<label>학번</label>
			<input type="number" name="id" placeholder="예)20162173"/>
			<input type="hidden" name="write" value="search"/>
			<input type="submit" value="검색"/>
		</fieldset>
	</form>
	
	<fieldset>
		<legend>검색결과</legend>		
				<c:choose>
					<c:when test="${sessionScope.student==null }">
						<p>검색을 통해 학생을 조회해보세요!</p>
					</c:when>
					<c:when test="${sessionScope.student.id == '-1' }">
						<p>등록되지 않은 학번의 학생입니다.<br>학번을 다시 확인하시고 조회해주시기 바랍니다.</p>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<th>학번</th><th>이름</th><th>성별</th><th>등록일자</th><th>국어</th><th>수학</th><th>영어</th><th>과학</th><th>수정일자</th>
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
								<td>
									<c:if test="${sessionScope.student.createDate == sessionScope.student.modifiedDate }">
										-
									</c:if>
								</td>
							</tr>
						</table>
						<div id="search_button_container">
							<form method="POST" style="display:inline">
								<input type="hidden" name="command" value="update"/>
								<input type="submit" value="정보수정"/>
							</form>
							<form method="POST" style="display:inline">
								<input type="hidden" name="write" value="delete"/>
								<input type="submit" value="정보삭제"/>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
	</fieldset>
	
	<fieldset>
		<legend>전체 조회</legend>
			<c:choose>
				<c:when test="${fn:length(students) == 0 }">
					<p>학생 정보가 등록되어있지 않습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<th>학번</th><th>이름</th><th>성별</th><th>등록일자</th><th>국어</th><th>수학</th><th>영어</th><th>과학</th><th>수정일자</th>
						</tr>
						<%= result %>
					</table>
				</c:otherwise>
			</c:choose>
	</fieldset>
	<button onclick="location.href='controller.jsp'" style="margin-top : 10px;">메뉴로 이동</button>
</body>
</html>
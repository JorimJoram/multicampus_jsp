<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL choose</title>
</head>

<body>

	<h1>JSTL Choose Example - c:choose</h1>
	<hr>
	
	<form>
		<select name="sel">
			<option>-</option>
			<option ${param.sel=='a' ? 'selected' : ''}>a</option>
			<option ${param.sel=='b' ? 'selected' : ''}>b</option>
			<option ${param.sel=='c' ? 'selected' : ''}>c</option>
			<option ${param.sel=='d' ? 'selected' : ''}>d</option>
		</select>
		<input type="submit" value="send"/>
	</form>
	
	<hr>
	
	<c:choose>
		<c:when test="${param.sel == 'a'}">a를 선택했습니다.</c:when>
		<c:when test="${param.sel == 'b'}">b를 선택했습니다.</c:when>
		<c:when test="${param.sel == 'c'}">c를 선택했습니다.</c:when>
		<c:otherwise>그 외의 값을 선택하셨습니다.</c:otherwise>
	</c:choose>
</body>
</html>
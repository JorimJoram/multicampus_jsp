<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL out</title>
	<style>
		table, td{
			border: 2px solid gray;
			border-collapse: collapse;
		}
		td{
			padding: 20px;
		}
	</style>
</head>

<body>

	<h1>JSTL Out Example - c:out</h1>
	<hr>
	<table>
		<c:forEach items="${members }" var="member">
			<tr>
				<td>${member.name }</td>
				<td>
					<c:out value="${member.email }" escapeXml="false">
						<font color="red">Non email</font>
					</c:out>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
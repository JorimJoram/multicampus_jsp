<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL for</title>
</head>

<body>

	<h1>JSTL For Example - c:for</h1>
	<hr>
	<c:forEach items="${members}" var="member" begin="4" end="9" step="1" varStatus="status">
		<p>
			index: ${status.index } <br>
			count: ${status.count } <br>
			name:  ${member.name }  <br>
			email: ${member.email } <br>
		</p>
	</c:forEach>
	
	<c:forTokens items="KK, 010-1234-5678, Boston, Baseball" delims="," var="token">
		${token }<br>
	</c:forTokens>
</body>
</html>
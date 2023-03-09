<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<h1>오류</h1>
	<hr>
	
	요청 처리 과정에서 에러가 발생하였습니다.<br>
	빠른 시간 내에 문제를 해결하도록 하겠습니다.
	<p>
	에러 타입: <%= exception.getClass().getName() %> <br>
	에러 메시지: <b><%= exception.getMessage() %></b>
	</p>
	<button onclick="location.href='controller.jsp'">메뉴로 이동</button>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>

	<%
		for(int i=0; i<10; i++){
			out.println(i + "<br>"); //println이라고 개행되는 게 아님 sourceCode에서 개행된다는 거지
		}
	%>

</body>
</html>
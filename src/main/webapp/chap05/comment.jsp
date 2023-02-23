<%@ page contentType="text/html; charset=UTF-8"%>

<%-- JSP comment. Never saw in browser --%>
<!--  HTML comment. Could see in browser -->

<%
	// Java comment in 1line
	/*
		Java Comment at many lines
	*/
	int num1 = 10, num2 = 20;
	int result = num1 * num2;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		// JS comment one line
		/*
			JS Comment many lines
		*/
		alert('Alert window that you opened');
	</script>
	<style>
		/*
			style comment
		*/
		#target {
			border : 2px solid gray;
			padding : 20px;
		}
	</style>
</head>

<body>

	<div id = "target">
		<h2>JSP Comment Example</h2>
		<hr>
		<h3>Result: <%=result %></h3>
	</div>

</body>
</html>
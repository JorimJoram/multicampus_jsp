<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table, td{
			border: 2px solid gray;
			border-collaspe: collaspe;
		}
		td{
			padding:5px;
			text-align: center;
		}
	</style>
</head>

<body>

	<table>
		<tr>
			<%for(int i=2; i<10; i++) {%>
				<td><%= i %></td>
			<%} %>
		</tr>
		<tr>
			<%for(int i=2; i<10; i++) {%>
				<tr>
				<%for(int j=2; j<10; j++){ %>
					<td><%= j %> * <%= i %> = <%= i*j %></td>
				<%} %>
				</tr>
			<%} %>
		</tr>
	</table>

</body>
</html>
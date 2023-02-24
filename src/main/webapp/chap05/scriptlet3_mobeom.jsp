<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String gugu = "";

	for(int num=0; num<10; num++){
		gugu += "<tr>\n";
		for(int dan = 2; dan < 10 ; dan ++){
			if(num == 0){
				gugu += "\t<th> " + dan + "dan</th>";
			}else{
				gugu += "\t<td> " + dan + " * " + num+ "=" + (dan*num) + " </td>";
			}
		}
		gugu += "\n</tr>\n";
	}
%>

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

	<h1>Horizontal gugudan Example</h1>
	<hr>
	<table>
		<%= gugu %>
	</table>

</body>
</html>
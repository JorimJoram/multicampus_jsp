<%@ page contentType="text/html; charset=UTF-8"
		import="java.util.*"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
	String result = "<ol>";
	if(list.isEmpty()){
		result = "<h5>Cart Empty</h5>";
	}else{
		for(String product : list){
			result += "<li>" + product + "</li>";
		}
		result += "</ol>";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>checkOut</title>
</head>

<body>
	<h1>Check Basket</h1>
	<hr>
	<%= result %>
	<form method="POST">
		<input type="hidden" name="command" value="clearCart"/>
		<input type="submit" value="clear"/>
	</form>
	
	<hr>
	
	<h5><a href="controller.jsp">상품구매</a></h5>
</body>
</html>
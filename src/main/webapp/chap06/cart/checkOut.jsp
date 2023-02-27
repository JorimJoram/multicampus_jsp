<%@ 
	page contentType="text/html; charset=UTF-8"
			import="java.util.*"
%>
<%
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
	String items = "";
	if(list == null){
		items = "<h4>basket is Empty</h4>";
	}else{
		for(String item : list){
		 	items += "<h5>" + item + "</h5>";
		}
		session.removeAttribute("productList");
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
	
	<%= items %>
</body>
</html>
<%@ 
page contentType="text/html; charset=UTF-8"
import="java.util.*"
%>

<%
	String script = "";

	if(request.getMethod().equals("POST")){
		if(request.getMethod().equals("POST")){
			request.setCharacterEncoding("UTF-8");	
		}
		String product = request.getParameter("product");
		
		if(session.getAttribute("productList") == null){
			session.setAttribute("productList", new ArrayList<String>());
		}
		
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productList");
		list.add(product);
%>

	<script>
		alert('Add ITEM : <%=product%>');
	</script>
	
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>selProduct jsp</title>
</head>

<body>

	<h1>Sell Product</h1>
	<hr>
	
	<h4><%=session.getAttribute("userId") %>님 환영합니다 ^^7</h4>
	
	<form method="POST">
		<fieldset>
			<legend>Sell Product</legend>
			<select name="product">
				<option selected>apple</option>
				<option>strawberry</option>
				<option>pear</option>
				<option>grape</option>
				<option>orange</option>
				<option>melon</option>
			</select>
			<input type="submit" value="add"/>
		</fieldset>
	</form>
	<a href="checkOut.jsp" type="button">SELL</a>
</body>
</html>
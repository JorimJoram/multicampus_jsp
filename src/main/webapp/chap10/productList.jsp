<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="product" class="chap10.Product" scope="session"/>

<%
	String result = "";

	for(String item : product.getProductList()){
		result += "<option>" + item + "</option>";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productList jsp</title>
</head>

<body>

	<h2>EL Test</h2>
	<hr>
	
	<form action="productSel.jsp" method="POST">
		<fieldset>
			<legend>Select Product</legend>
				<select name="sel">
					<%= result %>
				</select>
		</fieldset>
		<input type="submit" value="transfer"/>
	</form>
	
</body>
</html>
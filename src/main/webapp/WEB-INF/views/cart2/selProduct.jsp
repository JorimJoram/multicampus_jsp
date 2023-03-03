<%@ 
page contentType="text/html; charset=UTF-8"
import="java.util.*"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>selProduct jsp</title>
	<script><%= request.getAttribute("script")%></script>
</head>

<body>

	<h1>Sell Product</h1>
	<hr>
	
	<h4><%=session.getAttribute("id") %>님 환영합니다 ^^7</h4>
	<form method="POST">
		<input type="hidden" name="command" value="logout"/>
		<input type="submit" value="logout"/>
	</form>
	
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
			<input type="hidden" name="command" value="addCart"/>
			<input type="submit" value="add"/>
		</fieldset>
	</form>
	<form method="POST">
		<input type="hidden" name="command" value="checkOut"/>
		<input type="submit" value="Cart Check"/>
	</form>
</body>
</html>
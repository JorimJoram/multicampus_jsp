<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>productList jsp</title>
</head>

<body>

	<h2>EL Test</h2>
	<hr>
	<p>${itemList }
	<form action="productSel.jsp" method="POST">
		<fieldset>
			<legend>Select Product</legend>
				<select name="sel">
					<c:forEach items="${itemList }" var="item" begin="0" end="4">
						<option>${item}</option>
					</c:forEach>
				</select>
		</fieldset>
		<input type="submit" value="transfer"/>
	</form>
	
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product Sel jsp</title>
</head>

<body>

	<h2>EL Result</h2>
	<hr>
	
	<p>1. select Product is ${param.sel}</p>
	<p>2. num1 + num2 =  ${sessionScope.product.num1 + sessionScope.product.num2}</p>

</body>
</html>
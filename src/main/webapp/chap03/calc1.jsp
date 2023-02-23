<%@ page contentType="text/html; charset=UTF-8"%>

<%
	double result = 0.0;
	int num1 = 0, num2 = 0;
	String operator = "?";

	if(request.getMethod().equals("POST")){
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		
		operator = request.getParameter("operator");
		
		if(operator.equals("+")){
			result = num1 + num2;
		}else if(operator.equals("-")){
			result = num1 - num2;
		}else if(operator.equals("*")){
			result = num1 * num2;
		}else if(operator.equals("/")){
			result = num1 / num2;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc1</title>
</head>
<body>
	<h2>JSP Programming</h2>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>간단 계산기</legend>
			
			<input type="number" name="num1" value="0" />
			<select name="operator">
				<option selected> + </option>
				<option> - </option>
				<option> * </option>
				<option> / </option>
			</select>
			<input type="number" name="num2" value="0" />
			
			<input type="submit" value="계산" />
			<input type="reset" value="초기화"/>
		</fieldset>
	</form>
	<h4><%= num1 %> <%= operator %> <%= num2 %> [계산결과]: <%= result %> </h4>
</body>
</html>
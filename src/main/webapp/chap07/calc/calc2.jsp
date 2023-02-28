<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="calc" class="chap07.Calc"/>
<jsp:setProperty name="calc" property="*"/>

<%
	String msg = "";
	if(calc.getOperator() != null)
		msg = "<h3>" + calc.operateResult() +"</h3>";
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
			<legend>간단 계산기2</legend>
			
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
	<h4>
		<h2> result</h2>
		
		<%= msg %>
	</h4>
</body>
</html>
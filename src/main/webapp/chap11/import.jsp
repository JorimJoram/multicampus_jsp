<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL import</title>
</head>

<body>

	<h1>JSTL Import Example - c:import</h1>
	<hr>
	
	<c:import url="set.jsp" var="resultSet"/>
	<c:import url="/chap10/productList.jsp" var="productList"/>
	
	<h2>Import set jsp</h2>
	<c:out value="${resultSet }" escapeXml="false"/>
	
	<hr>
	<hr>
	
	<h2>Import productList in chap10 el </h2>
	<c:out value="${productList }" escapeXml="false"/>
</body>
</html>
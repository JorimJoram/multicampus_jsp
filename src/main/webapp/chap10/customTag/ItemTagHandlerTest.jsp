<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/ItemTag.tld" prefix="myTag" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>itemTagHandler jsp</title>
	<style>
		table, th, td{
			border: 2px solid gray;
			border-collapse: collapse;
		}
		th, td{
			padding: 10px;
		}
	</style>
</head>

<body>
	
	<myTag:item title="Product lefts" colName="item names"/>

</body>
</html>
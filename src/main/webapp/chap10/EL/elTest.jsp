<%@ page contentType="text/html; charset=UTF-8"%>
<%
	pageContext.setAttribute("pageElTest", "pageContext storage value");
	request.setAttribute("reqElTest", "request storage value");
	session.setAttribute("sesElTest", "session storage value");
	application.setAttribute("appElTest", "application storage value");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>elTest jsp</title>
	<script>
		document.cookie = 'elCookie = EL_cookieTest';
	</script>
</head>

<body>

	<h2>EL Test</h2>
	<hr>
	
	<form action="elResult.jsp" method="POST">
		<label for="userName">Name</label>
		<input type="text" name="userName"/>
		
		<p>Favorites</p>
		<label for="favorite1">Gov</label>
		<input type="checkbox" name="favorite" id="favorite1" value="Gov"/>
		<label for="favorite2">Eco</label>
		<input type="checkbox" name="favorite" id="favorite2" value="Eco"/>
		<label for="favorite3">Soc</label>
		<input type="checkbox" name="favorite" id="favorite3" value="Soc"/>
		<label for="favorite4">Cul</label>
		<input type="checkbox" name="favorite" id="favorite4" value="Cul"/>
		
		<input type="submit" value="Send"/>
	</form>
</body>
</html>
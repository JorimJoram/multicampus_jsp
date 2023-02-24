<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name="hyorim";
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
%>

<div id="footer">
		<h3>[about us] [location] [pageMap]</h3>
		<h2><%= email %></h2>
		<h2><%= tel %></h2>
</div>
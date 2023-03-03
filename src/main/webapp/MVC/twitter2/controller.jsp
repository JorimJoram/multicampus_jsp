<%@ page contentType="text/html; charset=UTF-8"
	import="twitter.*, java.util.*"%>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>


<jsp:useBean id="twitterDAO" class="twitter.TwitterDAO" scope="session"/>
<jsp:useBean id="loginDO" class="twitter.TwitterLoginDO" scope="page"/>
<jsp:useBean id="twitterDO" class="twitter.TwitterDO" scope="page"/>
<jsp:setProperty name="loginDO" property="*"/>
<jsp:setProperty name="twitterDO" property="message"/>
<%
	String viewPath = "/WEB-INF/views/twitter2/";
	String command = request.getParameter("command");

	if(session.getAttribute("id") == null){
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "twitterLogin.jsp");

		}else if(request.getMethod().equals("POST")){
			TwitterLoginDO result = twitterDAO.checkLogin(loginDO);
			if(result != null){
				session.setAttribute("id", result.getId());
				session.setAttribute("name", result.getName());

				response.sendRedirect("controller.jsp");
			}else{
				pageContext.forward(viewPath + "twitterLogin.jsp");
			}
		}
	}else{
		if(command != null && command.equals("logout")){
			session.invalidate();
			response.sendRedirect("controller.jsp");
		}else{
			if(command != null && command.equals("twitterInsert")){
				twitterDO.setId((String)session.getAttribute("id"));
				twitterDAO.insertTwitter(twitterDO);
			}
			session.setAttribute("list", twitterDAO.getAllTwitter());
			pageContext.forward(viewPath+"twitterList.jsp");
		}
		
		
	}
%>

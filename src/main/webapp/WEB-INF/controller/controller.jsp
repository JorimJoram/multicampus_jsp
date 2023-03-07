<%@ page contentType="text/html; charset=UTF-8"%>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>

<%
	String viewPath = "/WEB-INF/view/";
	String command = request.getParameter("command");
	
	if(request.getMethod().equals("POST")){
		if(command != null){
			if(command.equals("성적작성")){
				pageContext.forward(viewPath + "createStudent.jsp");
			}
			else if(command.equals("성적조회")){
				pageContext.forward(viewPath+"readStudent.jsp");
			}
			else if(command.equals("성적수정")){
				pageContext.forward(viewPath + "updateStudent.jsp");
			}
			else if(command.equals("성적삭제")){
				pageContext.forward(viewPath + "deleteStudent.jsp");
			}
		}
	}
	else{
		pageContext.forward(viewPath + "mainMenu.jsp");
	}
%>
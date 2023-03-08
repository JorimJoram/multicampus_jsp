<%@ page contentType="text/html; charset=UTF-8"
		import="model.*, java.util.*"%>

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id="studentDAO" class="model.StudentDAO" scope="session"/>
<jsp:useBean id="studentDO" class="model.StudentDO" scope="page"/>
<jsp:setProperty name="studentDO" property="*"/>
<jsp:useBean id="scoreDO" class="model.ScoreDO" scope="page"/>
<jsp:setProperty name="scoreDO" property="*"/>

<%
	String viewPath = "/WEB-INF/views/";
	String command = request.getParameter("command");
	String write = request.getParameter("write");
	
	if(request.getMethod().equals("POST")){
		if(command != null){
			if(command.equals("성적작성")){
				pageContext.forward(viewPath + "createStudent.jsp");
			}
			else if(command.equals("성적조회")){
				application.setAttribute("students", studentDAO.getStudentAll());
				application.setAttribute("scores", studentDAO.getScoreAll());
				pageContext.forward(viewPath+"readStudent.jsp");
			}
			else if(command.equals("정보수정")){
				pageContext.forward(viewPath + "updateStudent.jsp");
			}
			else if(command.equals("정보삭제")){
				pageContext.forward(viewPath + "deleteStudent.jsp");
			}
		}
		else if(write != null){
			if(write.equals("create_info")){
				studentDAO.createStudent(studentDO);
				session.setAttribute("student", studentDO);
				pageContext.forward(viewPath + "createScore.jsp");
			}
			else if(write.equals("create_score")){
				studentDAO.createScore((StudentDO)session.getAttribute("student"), scoreDO);
				response.sendRedirect("controller.jsp");
			}
			else if(write.equals("search")){
				StudentDO student = studentDAO.getStudent(studentDO.getId());
				ScoreDO score = studentDAO.getScore(studentDO.getId());
				if(student != null && score != null){
					session.setAttribute("student", student);
					session.setAttribute("score", score);
				}
				pageContext.forward(viewPath + "readStudent.jsp");
			}
			else if(write.equals("delete")){
				StudentDO student = (StudentDO)session.getAttribute("student");
				int scoreCode = studentDAO.deleteScore(student.getId());
				System.out.println("Delete score code: " + scoreCode);
				int studentCode = studentDAO.deleteStudent(student.getId());
				System.out.println("Delete student code: " + studentCode);
				
				session.removeAttribute("student");
				session.removeAttribute("score");
				application.setAttribute("students", studentDAO.getStudentAll());
				application.setAttribute("scores", studentDAO.getScoreAll());
				
				pageContext.forward(viewPath + "readStudent.jsp");
			}
		}
		else
			pageContext.forward(viewPath + "readStudent.jsp");
	}
	else{
		pageContext.forward(viewPath + "mainMenu.jsp");
		session.removeAttribute("student");
		session.removeAttribute("score");
	}
%>
<%@ page contentType="text/html; charset=UTF-8"
		import="model.*, java.util.*"%>
<%
	if(request.getMethod().equals("POST"))
		request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="studentDAO" class="model.StudentDAO" scope="session"/>
<jsp:useBean id="studentDO" class="model.StudentDO" scope="application"/>
<jsp:setProperty name="studentDO" property="*"/>
<jsp:useBean id="scoreDO" class="model.ScoreDO" scope="application"/>
<jsp:setProperty name="scoreDO" property="*"/>

<%
	String viewPath = "/WEB-INF/views/";
	String command = request.getParameter("command");
	String write = request.getParameter("write");
	
	if(request.getMethod().equals("POST")){
		System.out.println(command);
		if(command != null){
			application.setAttribute("students", studentDAO.getStudentAll());
			application.setAttribute("scores", studentDAO.getScoreAll());
			
			if(command.equals("create")){
				pageContext.forward(viewPath + "createStudent.jsp");
			}
			else if(command.equals("read")){
				pageContext.forward(viewPath+"readStudent.jsp");
			}
			else if(command.equals("update")){
				pageContext.forward(viewPath + "updateStudent.jsp");
			}
		}
		else if(write != null){
			if(write.equals("create_info")){
				int createStudentCode = studentDAO.createStudent(studentDO);
				if(createStudentCode == 0){
					pageContext.forward(viewPath+"writeError.jsp");
				}
				studentDAO.createScore(studentDO, scoreDO);
				
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
				studentDAO.deleteScore(student.getId());
				studentDAO.deleteStudent(student.getId());
				
				session.removeAttribute("student");
				session.removeAttribute("score");
				application.setAttribute("students", studentDAO.getStudentAll());
				application.setAttribute("scores", studentDAO.getScoreAll());
				
				pageContext.forward(viewPath + "readStudent.jsp");
			}
			else if(write.equals("update")){
				System.out.println("in Controller: " + studentDO.getId());
				studentDAO.updateStudent(studentDO);
				studentDAO.updateScore(studentDO, scoreDO);
				
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
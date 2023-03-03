<%@ page contentType="text/html; charset=UTF-8"
	import="twitter.*, java.util.*"%>
<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id="twitterDAO" class="twitter.TwitterDAO" scope="session"/>
<jsp:useBean id="twitterDO" class="twitter.TwitterDO" scope="page"/>
<jsp:useBean id="loginDO" class="twitter.TwitterLoginDO" scope="page"/>
<jsp:setProperty name="twitterDO" property="message"/>
<jsp:setProperty name="loginDO" property="*"/>

<%
	String viewPath = "/WEB-INF/views/twitter2/";
	String command = request.getParameter("command"); //hidden input id="command "-> value값이 command변수에 저장됨

	if(session.getAttribute("id") == null){
		//아이디가 세션에 존재하지 않는다면 -> 로그인하지 않았다면
		if(request.getMethod().equals("GET")){
			//GET으로 접근한다면 -> jspLogin으로 보내자 forward -> /WEB-INF/views/twitter2/twitterLogin.jsp
			pageContext.forward(viewPath + "twitterLogin.jsp");	
		}
		else if(request.getMethod().equals("POST")){
			//POST로 접근한다면 -> 로그인 버튼을 눌렀다면 -> 로그인을 위해 아이디와 비밀번호 다 적고 눌렀다면
				TwitterLoginDO tDO = twitterDAO.checkLogin(loginDO);	//checkLogin에서 입력한 계정이랑 저장했던 계정 비교함 -> 성공하면 계정 정보 전체를 던져줌
				if(tDO != null){ //객체가 있다 -> 로그인 성공했다
					session.setAttribute("id", tDO.getId());
					session.setAttribute("name", tDO.getName());
					
					response.sendRedirect("controller.jsp"); //GET방식으로 넘어가는데, 로그인이 된 상태니, 여기로 들어오지 않고 첫번째 else에게 넘어감
				}else{ //객체가 없다 -> 로그인 실패했다.
					//pageContext.forward(viewPath + "twitterLogin.jsp"); //다시 로그인화면에 남기도록 함
					response.sendRedirect("controller.jsp"); //는 안되나?
				}
			}
		}
	else{
		//로그인 했다면
		if(command != null && command.equals("logout")){ //로그아웃 버튼을 눌렀다면
			session.invalidate(); //세션 소멸 -> 로그인 정보 모두 날아감
			response.sendRedirect("controller.jsp"); //그래서 다시 controller로 보내면 첫 번째 if로 들어가게됨 
		}else{ //로그아웃 버튼을 누르지 않았다면
			if(command != null && command.equals("twitterInsert")){
				//글등록 버튼을 눌렀다면
				twitterDO.setId((String)session.getAttribute("id"));
				twitterDAO.insertTwitter(twitterDO);
			}
			session.setAttribute("list", twitterDAO.getAllTwitter()); //리스트에 나타내기 위한 리스트 다 불러옴 -> 세션에 저장함
			pageContext.forward(viewPath + "twitterList.jsp"); 		  //리스트로 이동함
			
		}
		
	}
%>
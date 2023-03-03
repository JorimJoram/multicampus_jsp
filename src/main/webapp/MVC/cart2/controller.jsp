<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="bean" class="MVC.cart.CartBean" scope="session"/>

<%
	if(request.getMethod().equals("POST")) request.setCharacterEncoding("UTF-8");

	String command = request.getParameter("command");
	String viewPath = "/WEB-INF/views/cart2/";
	
	if(session.getAttribute("id") == null){ //로그인 ㄴㄴ
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "login.jsp");
		}
		else if(request.getMethod().equals("POST")){ //로그인 버튼 눌렀다면
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			if(bean.checkLogin(id, passwd)){ //로그인 성공
				session.setAttribute("id", id);
				pageContext.forward(viewPath + "selProduct.jsp");
			}else{
				response.sendRedirect("controller.jsp");
			}
		}
	}
	else if(command != null && command.equals("logout")){
		session.invalidate();
		response.sendRedirect("controller.jsp");
	}
	else if(command != null && command.equals("addCart")){
		String product = request.getParameter("product");
		bean.addProduct(product);
		
		request.setAttribute("script", "alert('ADD ITEM: " + product + " ');");
		pageContext.forward(viewPath+"selProduct.jsp");
	}
	else if(command !=null && command.equals("checkOut")){
		if(session.getAttribute("list") == null){ //null일때만 저장하도록
			session.setAttribute("list", bean.getProductList());
		}
		pageContext.forward(viewPath + "checkOut.jsp");
	}
	else if(command != null && command.equals("clearCart")){
		bean.clearProductList();
		pageContext.forward(viewPath+"selProduct.jsp");
	}
	else{ //로그인 ㅇㅇ
		pageContext.forward(viewPath + "selProduct.jsp");
	}
%>
package chap04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(description = "나의 첫 서블릿", urlPatterns = { "/HelloServlet" })
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response
		.setContentType("text/html; charset=UTF-8"); //기본적으로는 ISO 방식 사용하기 때문에 한글 깨짐
		
//		response
//		.getWriter() //출력 버퍼에 계속 데이터를 저장하다가 한 번에 보내거나 서블릿 처리가 끝나면 한 번에 보내는 방식
//		.append("서버 응답: ")
//		.append(request.getRequestURL()); 
//		//getContextPath -> 현재 요청에 대한 주소 반환
//		//getRequestURL -> 요청을 보내는 주소 URL 
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset=\"UTF-8\" /> <title>Hello Servlet</title></head>");
		out.println("<body><h2>Servlet Response</h2><hr /><h4>Hello world</h4></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); //GET이건 POST이건 동일한 방식으로 처리
	}

}

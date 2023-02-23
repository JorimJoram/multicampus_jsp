package chap04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet(description = "계산 결과 서블릿", urlPatterns = { "/CalcServlet" })
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String operator = request.getParameter("operator");
		
		double result = cal(num1, num2, operator);
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset=\"UTF-8\" /> <title>CalcServlet</title></head>");
		out.println("<body><h2>Servlet 계산결과</h2><hr /><h4>계산결과: " + result + "</h4></body></html>");
	}
	public double cal(int num1, int num2, String operator) {
		double result = 0;
		
		if(operator.equals("+")){
			result = num1 + num2;
		}else if(operator.equals("-")){
			result = num1 - num2;
		}else if(operator.equals("*")){
			result = num1 * num2;
		}else if(operator.equals("/")){
			result = num1 / num2;
		}
		
		return result;
	}

}

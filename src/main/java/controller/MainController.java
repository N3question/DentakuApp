package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "/WEB-INF/views/main.jsp";
	    getServletContext().getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num1 = request.getParameter("number1");
		String operator = request.getParameter("operator");
		String num2 = request.getParameter("number2");
		System.out.println(num1);
		System.out.println(operator);
		System.out.println(num2);
		
		int intNum1 = Integer.parseInt(num1);
		int intNum2 = Integer.parseInt(num2);
		
		if (operator.equals("-")) {
			int result = intNum1 - intNum2;
			request.setAttribute("result", result);
			System.out.println("引き算です");
		} else if(operator.equals("+")) {
			int result = intNum1 + intNum2;
			request.setAttribute("result", result);
			System.out.println("足し算です");
		} else if(operator.equals("/")) {
			int result = intNum1 / intNum2;
			request.setAttribute("result", result);
			System.out.println("割り算です");
		} else if(operator.equals("*")) {
			int result = intNum1 * intNum2;
			request.setAttribute("result", result);
			System.out.println("掛け算です");
		} else {
			System.out.println("エラーです");
		}

		String view = "/WEB-INF/views/main.jsp";
	    getServletContext().getRequestDispatcher(view).forward(request, response);
	}

}

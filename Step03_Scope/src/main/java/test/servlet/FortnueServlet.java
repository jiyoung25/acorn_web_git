package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortnueServlet extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행
		String fortnue="동쪽으로 가면 귀인을 만나요~";
		
		//응답에 필요한 데이터를 request scope(HttpServletRequest객체)에 담는다.
		req.setAttribute("fortuneToday"/*key값*/, fortnue/*value값*/);
		
		//응답을 여기서 하지 않고 jsp페이지로 응답을 위임할 수 있다.
		RequestDispatcher rd= req.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp);
		
		
	}
}

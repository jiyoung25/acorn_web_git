package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<String> list = new ArrayList<>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		//로직 수행 결과로 얻어낸 데이터를 request scope에 담기
		req.setAttribute("list", list);
		
		//jsp페이지로 (view page) forward이동해서 응답하기 (forward 이동은 WEB-INF폴더의 안쪽도 가능하다.)
		//원래 web-inf는 보안되는 프로그램이기 때문에 클라이언트가 접근이 불가능하지만, forward는 서버에서 이동하는 것이므로 가능한 것이다.
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/friend/list.jsp");
		rd.forward(req, resp);
		
	}
}

package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/*
 *	@WebServlet("/test/save")어노테이션 설정 대신에
 * 
 *	/WEB-INF/web.xml문서에 아래의 설정으로 대신할 수 있다.
 *
 *	  <!-- 서블릿이 어디에 있는지 알리(톰캣에)면서 이름 부여하기 -->
  <servlet>
  	<servlet-name>saveServlet</servlet-name> <!-- 이름은 마음대로 지을 수 있다. -->
  	<servlet-class>test.servlet.SaveServlet</servlet-class>
  </servlet>
  
  <!-- 어떤 이름의 서블릿이 어떤 패턴의 요청을 처리할지 지정하기 -->
  <servlet-mapping>
  	<servlet-name>saveServlet</servlet-name>
  	<url-pattern>/test/save</url-pattern>
  </servlet-mapping>
  
 */

public class SaveServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼이 전송하는 닉네임을 읽어와서
		req.setCharacterEncoding("utf-8");
		String nick=req.getParameter("nick");
		
		//session scope에 기억시키기
		HttpSession session= req.getSession(); //HttpServletRequest객체를 이용해서 HttpSession얻어냄
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		
		//응답~
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/test/save.jsp");
		rd.forward(req, resp);
	}
}

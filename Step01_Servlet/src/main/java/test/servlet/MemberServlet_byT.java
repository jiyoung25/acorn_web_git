package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

//in 수업시간

@WebServlet("/member/list2")
public class MemberServlet_byT extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트의 웹브라우저에 문자열을 출력할수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<meta name = \"viewport\">");
		pw.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi\" crossorigin=\"anonymous\">");
		pw.println("<title> 회원 목록입니다. </title>");
		pw.println("</head>");
		pw.println("<body>");
		//DB에서 불러온 회원 목록이라고 가정해보자.
		//회원 목록을 담을 ArrayList객체
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라", "노량진"));
		list.add(new MemberDto(2, "해골", "행신동"));
		list.add(new MemberDto(3, "원숭이", "상도동"));
		
		pw.println("<table class=\"table table-striped\">");
			pw.println("<thead>");	
				pw.println("<tr>");		
					pw.println("<th> 번호 </th>");			
					pw.println("<th> 이름 </th>");			
					pw.println("<th> 주소 </th>");			
				pw.println("</tr>");		
			pw.println("</thead>");	
			pw.println("<tbody>");	
				for(MemberDto tmp:list) {
					pw.println("<tr>");
						pw.println("<td>"+ tmp.getNum() +"</td>");		
						pw.println("<td>"+ tmp.getName() +"</td>");		
						pw.println("<td>"+ tmp.getAddr() +"</td>");
					pw.println("</tr>");
				}
			pw.println("</tbody>");	
		pw.println("</table>");
		pw.println("<button type=\"button\" class=\"btn btn-info\" onclick=\"location.href='../index.html'\">"
				+ "index로 돌아가기"
				+ "</button>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();//닫아주기
	}
}

package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// "/*"는 이 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미이다.
// Step04_Final/하위의 모든 요청

@WebFilter("/*") //어떤 요청이든 가리지 않고 필터처리 하겠도다.

public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 만일 인코딩이 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//post방식을 전송했을 때 한글이 깨짐을 방지
			request.setCharacterEncoding("utf-8");
		}
		//2.요청의 흐름을 이어가기
		chain.doFilter(request, response);
		
		
	}

}

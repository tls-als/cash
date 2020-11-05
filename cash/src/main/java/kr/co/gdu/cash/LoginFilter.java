package kr.co.gdu.cash;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그인 여부를 검사하는 필터(/admin 으로 시작되는 모든 요청을 검사한다.)
@WebFilter(urlPatterns = "/admin/*")
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)	// 부모타입
			throws IOException, ServletException {
		System.out.println("로그인 필터 실행----");
		HttpSession session = ((HttpServletRequest)request).getSession();	// 자식타입으로 형변환
		if(session.getAttribute("loginId") == null) {
			((HttpServletResponse)response).sendRedirect("/login");
			return;
		}
		chain.doFilter(request, response);
	}
}

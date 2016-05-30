package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/LoginOrNot")
public class LoginOrNot implements Filter {
	public LoginOrNot() {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		String path = hrequest.getContextPath();
		if (hrequest.getSession().getAttribute("user") != null) {
			chain.doFilter(request, response);
		} else {
			hresponse.sendRedirect(path + "/login.jsp");
		}
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

}

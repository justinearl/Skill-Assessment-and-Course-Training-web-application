package home;



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
import javax.servlet.http.HttpSession;

@WebFilter("/Student/*")
public class FilterReqsForStudent implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
   
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        System.out.println("Test");
        if (((String) session.getAttribute("sessionID")).matches(null)) {
        	response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
        else if (((String) session.getAttribute("userRole")).matches("student")) {
        	chain.doFilter(req, res);
            
        } else {
        	response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    @Override
    public void destroy() {
    }

}

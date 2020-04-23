package instructor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClassRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ClassRoom() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classId = request.getParameter("classId");
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Instructor/iClasses2.jsp");
		dispatcher.forward(request, response);
	}

	
}

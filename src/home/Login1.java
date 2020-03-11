package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login1() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("loginEmail");
		String pass = request.getParameter("loginPassword");
		
		HttpSession session = request.getSession();
		PreparedStatement ps;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
			ps = con.prepareStatement("Select * from User  where email = ? and password = ?");
			ps.setString(1,email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			
			if(!rs.next()) {
				session.setAttribute("sessionID", null);
				request.setAttribute("errorlogin", "Invalid Login" );
				response.sendRedirect("landingpage.jsp");
			}else {
				System.out.print( rs.getString(4));
				session.setAttribute("sessionID", rs.getString(1));
				
				request.setAttribute("Name", rs.getString(4)+" "+rs.getString(6)); // set your String value in the attribute
				request.setAttribute("email", rs.getString(2) );
				request.setAttribute("fname", rs.getString(4) );
				request.setAttribute("mname", rs.getString(5) );
				request.setAttribute("lname", rs.getString(6) );
				request.setAttribute("course", rs.getString(7) );
				request.setAttribute("degree", rs.getString(8) );
				request.setAttribute("school", rs.getString(9) );
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward( request, response );

			}
			
		}catch(Exception e){
			System.out.print(e);
		}
	}

}

package Profile;

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
 * Servlet implementation class ProfileController
 */
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("loginEmail");
//		System.out.print("DSAdasd");
//		HttpSession session = request.getSession();
//		PreparedStatement ps;
//		try {
//			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
//			Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
//			ps = con.prepareStatement("Select * from User  where  ID = ?");
//			ps.setString(1,id);
//			ResultSet rs = ps.executeQuery();
//			
//			if(!rs.next()) {
//				session.setAttribute("sessionID", null);
//				response.sendRedirect("landingpage.jsp");
//			}else {
//				System.out.print( rs.getString(4));
//				session.setAttribute("sessionID", rs.getString(1));
				
//				request.setAttribute("Name", rs.getString(4)+" "+rs.getString(6)); // set your String value in the attribute
				request.setAttribute("email", request.getSession().getAttribute("email"));
				request.setAttribute("fname",request.getSession().getAttribute("fname") );
				request.setAttribute("mname", request.getSession().getAttribute("mname") );
				request.setAttribute("lname", request.getSession().getAttribute("lname") );
				request.setAttribute("course", request.getSession().getAttribute("course") );
				request.setAttribute("degree", request.getSession().getAttribute("degree") );
				request.setAttribute("school", request.getSession().getAttribute("school") );
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward( request, response );

//			}
//			
//		}catch(Exception e){
//			System.out.print(e);
//		}
	}


}

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
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("loginEmail");
		String pass = request.getParameter("loginPassword");

		HttpSession session = request.getSession();
		PreparedStatement ps;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
			ps = con.prepareStatement("Select * from User  where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			if (!rs.next()) {
				session.setAttribute("sessionID", "empty");
				request.setAttribute("errorlogin", "Invalid Login");
				response.sendRedirect("index.jsp");
			} else {
				
				System.out.print(rs.getString(4));
				session.setAttribute("sessionID", rs.getString("id"));
				session.setAttribute("userRole", rs.getString("userRole"));
				session.setAttribute("existingUser", rs.getString("firstname")+" "+rs.getString("lastname"));
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				
				System.out.print(rs.getString("userRole"));
				if(rs.getString("userRole").matches("inc")) {
					if(rs.getString("confirmation").matches("Confirmed")) {
						response.sendRedirect("/Final/Instructor/ClassView");
					}else {
						dispatcher = request.getRequestDispatcher("/Final/isuccess.jsp");
					}
					

				}else if(rs.getString("userRole").matches("student")) {
					dispatcher = request.getRequestDispatcher("/User/profile1.jsp");
					
				}else if(rs.getString("userRole").matches("admin")) {
					session.setAttribute("sessionID", "admin");
					response.sendRedirect("/Final/Admin/Dashboard");
				}
				
				dispatcher.forward(request, response);

			}

		} catch (Exception e) {
			System.out.print(e);
		}
	}
}

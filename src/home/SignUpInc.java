package home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import resources.dbConnection;

/**
 * Servlet implementation class SignUpInc
 */
public class SignUpInc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpInc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("buttonSubmit");
		String first = request.getParameter("ifname");
		String last = request.getParameter("ilname");
		String mid = request.getParameter("imname");
		String email = request.getParameter("iemail");
		String password = request.getParameter("ipass");
		String contact = request.getParameter("ino");
		String backg = request.getParameter("iback");
		
		
		if(check.matches("Register")){
			
			
		
			
			PreparedStatement a,b;
			ResultSet x,y;
			try{
				Connection con = dbConnection.getConnection();
				a = con.prepareStatement("Select * from User  where email = ? ");
				a.setString(1, email);
				x = a.executeQuery();
				
				if(x.next()){
					response.sendRedirect("/Final/index.jsp?error=useralreadyexist");
				}else{
					b = con.prepareStatement("Insert into user (firstname, middlename, lastname, email, password, dateReg, bio,userRole, confirmation, avatar) values(?,?,?,?,?,?,?,?,?,?)");
					b.setString(1,first);
					b.setString(2,mid);
					b.setString(3,last);
					b.setString(4,email);
					b.setString(5,password);
					b.setString(6,"0");
					b.setString(7,backg);
					b.setString(8, "inc");
					b.setString(9, "false");
					b.setString(10, "/Final/avatar/7.png");
					b.executeUpdate();
					response.sendRedirect("isuccess.jsp");
				}
			} catch (SQLException ex) {
				while (ex != null) {
					System.out.println("SQL Exception: " + ex.getMessage());
					ex = ex.getNextException();
				}
			}
		}else{
			response.sendRedirect("/Final/index.jsp");
		}
	}

}

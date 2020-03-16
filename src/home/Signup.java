package home;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import resources.dbConnection;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Signup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pagee = "";
		String first = request.getParameter("firstName");
		String last = request.getParameter("lastName");
		String email = request.getParameter("signEmail");
		String password = request.getParameter("signPassword");
		String a = "7";

		PreparedStatement ps1;

		Connection con = dbConnection.getConnection();

		try {

			ps1 = con.prepareStatement("Select * from User  where email = ? ");
			ps1.setString(1, email);
			ResultSet rs1 = ps1.executeQuery();
			if (!rs1.next()) {
				ps1 = con.prepareStatement(
						"INSERT INTO user (email, password, firstname, lastname, vkey, dateReg, avatar,userRole)  VALUES(?,?,?,?,?,?,?,?)");
				ps1.setString(1, email);
				ps1.setString(2, password);
				ps1.setString(3, first);
				ps1.setString(4, last);
				ps1.setString(5, "0");
				ps1.setString(6, "0");
				ps1.setString(7, "/final/avatar/7.png");
				ps1.setString(8, "student");
				ps1.executeUpdate();
				con.close();
			}
		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception: " + ex.getMessage());
				ex = ex.getNextException();
			}
		}
		pagee = request.getContextPath() + "/index.jsp?message=success";

		response.sendRedirect(pagee);

	}

}

package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import resources.dbConnection;


public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteUser() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("deleteId");
		
		try {
			PreparedStatement ps;
			Connection con = dbConnection.getConnection();
			ps = con.prepareStatement("delete from user where ID = ?");
			ps.setString(1, user);
			ps.executeUpdate();

				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
				String dd = formatter.format(new Date());
				String act = "Admin deleted user " + user ;
				
				PreparedStatement logQue;
				logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
				logQue.setString(1,dd);
				logQue.setString(2,act);
				logQue.executeUpdate();

			ps.close();
			con.close();
		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception: " + ex.getMessage());
				ex = ex.getNextException();
			}
		}
	}

}

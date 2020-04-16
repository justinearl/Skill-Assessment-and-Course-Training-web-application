package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import resources.dbConnection;

public class ContentManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentManagement() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = dbConnection.getConnection();
		String logo = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from webcontent where webpart=?");
			ps.setString(1, "logo1");
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				logo = rs.getString("link");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("logo", logo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/cmsAdmin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}

package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import resources.dbConnection;

public class ViewInstructor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ViewInstructor() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = dbConnection.getConnection();
		String incCount = "0", incPending = "0";
		PreparedStatement ps;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("Select COUNT(ID) from User where userRole = ? and confirmation=?");
			ps.setString(1, "inc");
			ps.setString(2,"Confirmed");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				incCount = rs.getString(1);
			}
			
			ps = con.prepareStatement("Select COUNT(ID) from User where userRole = ? and confirmation=?");
			ps.setString(1, "inc");
			ps.setString(2, "Pending");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				incPending = rs.getString(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<UserCollection> userList = User();
		
		request.setAttribute("userList", userList);
		request.setAttribute("incCount", incCount);
		request.setAttribute("incPending", incPending);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/viewInc.jsp");
		dispatcher.forward(request, response);
	}
	
	private ArrayList<UserCollection> User()  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<UserCollection> userData=null;
		try {
			ps=con.prepareStatement("Select * from user where userRole=?");
			ps.setString(1, "inc");
			rs = ps.executeQuery();
			
			userData = new ArrayList<>();
			while(rs.next()) {
				UserCollection data = new UserCollection();
				data.setId(rs.getString("id"));
				data.setFname(rs.getString("firstname"));
				data.setLname(rs.getString("lastname"));
				data.setEmail(rs.getString("email"));
				data.setSchool(rs.getString("school"));
				data.setDate(rs.getString("dateReg"));
				data.setaDone(rs.getString("assessdone"));
				data.settDone(rs.getString("traindone"));
				data.setPoints(rs.getString("points"));
				data.setBio(rs.getString("bio"));
				data.setStatus(rs.getString("confirmation"));
				userData.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userData;
	}

}

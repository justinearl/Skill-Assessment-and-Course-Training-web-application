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

public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Dashboard() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = dbConnection.getConnection();
		String userCount = "0", assessCount = "0", trainCount = "0", fbCount = "0", logo= "0";
		PreparedStatement ps;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("Select COUNT(ID) from User where userRole = 'student' ");
			rs = ps.executeQuery();
			if(rs.next()) {
				userCount = rs.getString(1);
			}
			ps = con.prepareStatement("Select COUNT(ID) from assessmentList");
			rs = ps.executeQuery();
			if(rs.next()) {
				assessCount = rs.getString(1);
			}
			ps = con.prepareStatement("Select COUNT(ID) from trainingList");
			rs = ps.executeQuery();
			if(rs.next()) {
				trainCount = rs.getString(1);
			}
			ps = con.prepareStatement("Select COUNT(ID) from feedback");
			rs = ps.executeQuery();
			if(rs.next()) {
				fbCount = rs.getString(1);
			}
			ps = con.prepareStatement("Select * from webcontent where webpart = ?");
			ps.setString(1,	"logo1");
			rs = ps.executeQuery();
			if(rs.next()) {
				logo = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<UserCollection> userList = User();
		
		request.setAttribute("logo", logo);
		request.setAttribute("userList", userList);
		request.setAttribute("userCount", userCount);
		request.setAttribute("assessCount", assessCount);
		request.setAttribute("trainCount", trainCount);
		request.setAttribute("fbCount", fbCount);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/dashboard.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private ArrayList<UserCollection> User()  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<UserCollection> userData=null;
		try {
			ps=con.prepareStatement("Select * from user where userRole=?");
			ps.setString(1, "student");
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
				
				userData.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userData;
	}

}

package user;

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
import javax.servlet.http.HttpSession;

import instructor.classCollection;
import resources.dbConnection;


public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Profile() {
        super();
   
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("sessionID");
		Connection con = dbConnection.getConnection();
		String userEmail = null, userName = null, userPhoto = null, userBachDeg = null, userPoints = null, userSchool = null;
		
		PreparedStatement ps;
		ResultSet rs = null;
		
		ArrayList<classCollection> getClass = classList(user);

		try {
			ps = con.prepareStatement("Select * from user where id=?");
			ps.setString(1, user);
			rs = ps.executeQuery();
			if(rs.next()) {
				userEmail = rs.getString("email");
				userName = rs.getString("firstname") + " " + rs.getString("lastname");
				userPhoto = rs.getString("avatar");
				userBachDeg = rs.getString("bio");
				userPoints = rs.getString("points");
				userSchool = rs.getString("school");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		request.setAttribute("getClass", getClass);
		request.setAttribute("email",userEmail);
		request.setAttribute("name",userName);
		request.setAttribute("photo",userPhoto);
		request.setAttribute("userCourse", userBachDeg);
		request.setAttribute("userPoints", userPoints);
		request.setAttribute("userSchool", userSchool);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/User/profile1.jsp");
		dispatcher.forward(request, response);

	}

	private ArrayList<classCollection> classList(String id)  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<classCollection> classes=null;
		try {
			ps=con.prepareStatement("Select * from classlist where uid=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			classes = new ArrayList<>();
			while(rs.next()) {
				classCollection classCon = new classCollection();
				classCon.setId(rs.getString("id"));
				classCon.setName(rs.getString("classname"));
				classCon.setSection(rs.getString("classsection"));
				classCon.setSubject(rs.getString("classsubject"));
				classCon.setYear(rs.getString("classyear"));
				classCon.setImg(rs.getString("cardimg"));
				classCon.setDesc(rs.getString("classdesc"));
				
				classes.add(classCon);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return classes;
	}

}

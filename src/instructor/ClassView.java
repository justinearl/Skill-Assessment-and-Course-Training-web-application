package instructor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import resources.dbConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class InstructorProfileController
 */
public class ClassView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("sessionID");
		Connection con = dbConnection.getConnection();
		String userEmail = null, userName = null, userClasses, userStudents, userPhoto = null;
		
		PreparedStatement ps,ps1;
		ResultSet rs,rs1 = null;
		
		ArrayList<classCollection> getClass = classList(user);

		try {
			ps = con.prepareStatement("Select * from user where id=?");
			ps.setString(1, user);
			rs = ps.executeQuery();
			if(rs.next()) {
				userEmail = rs.getString("email");
				userName = rs.getString("firstname") + " " + rs.getString("lastname");
				userPhoto = rs.getString("avatar");
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		request.setAttribute("getClass", getClass);
		request.setAttribute("email",userEmail);
		request.setAttribute("name",userName);
		request.setAttribute("photo",userPhoto);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Instructor/iClasses.jsp");
		dispatcher.forward(request, response);

	}

	private ArrayList<classCollection> classList(String id)  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<classCollection> classes=null;
		try {
			ps=con.prepareStatement("Select * from classlist where classcon=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			classes = new ArrayList<>();
			while(rs.next()) {
				classCollection classCon = new classCollection();
				classCon.setId("/Final/Instructor/ClassView/ClassRoom?classId="+rs.getString("id"));
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

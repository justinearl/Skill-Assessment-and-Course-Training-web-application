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

import instructor.AssessmentCollection;
import instructor.classCollection;
import resources.dbConnection;

public class TrainAssess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TrainAssess() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<classCollection> getClass = classList();
		request.setAttribute("classList", getClass);
		
		ArrayList<AssessmentCollection> getAssess = assessList();
		request.setAttribute("assessList", getAssess);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/training_assessment.jsp");
		dispatcher.forward(request, response);

	}
	
	private ArrayList<classCollection> classList()  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<classCollection> classes=null;
		try {
			ps=con.prepareStatement("Select * from classlist");
			rs = ps.executeQuery();
			
			classes = new ArrayList<>();
			while(rs.next()) {
				classCollection classCon = new classCollection();

				classCon.setName(rs.getString("classname"));
				classCon.setSubject(rs.getString("classsubject"));
				classCon.setAuthor(rs.getString("author"));
				
				classes.add(classCon);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return classes;
	}
	
	private ArrayList<AssessmentCollection> assessList()  {
		Connection con = dbConnection.getConnection();
		
		PreparedStatement ps;
		ResultSet rs;
		
		ArrayList<AssessmentCollection> classes=null;
		try {
			ps=con.prepareStatement("Select * from assessmentlist");
			rs = ps.executeQuery();
			
			classes = new ArrayList<>();
			while(rs.next()) {
				AssessmentCollection classCon = new AssessmentCollection();

				classCon.setAuthor(rs.getString("author"));
				classCon.setExamType(rs.getString("examtype"));
				classCon.setSet(rs.getString("setno"));
				classCon.setCategory(rs.getString("category"));
				
				classes.add(classCon);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return classes;
	}
}

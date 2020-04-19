package instructor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import resources.dbConnection;

public class LoadAssessmentData extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LoadAssessmentData() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jSon ="[{\"question\": \"What is the unit of resistance?\", \"a\": \"Ohm\", \"b\": \"Ampere\", \"c\": \"Volt\", \"d\": \"Watt\", \"ans\": \"A\" }]";
		String classID = request.getParameter("pendingId");
		
		PreparedStatement ps;
		ResultSet rs = null;
		Connection con = dbConnection.getConnection();
		
		try {
			ps = con.prepareStatement("Select * from questionlist where type = ?");
			ps.setString(1, "Test");
			rs = ps.executeQuery();
			int c = 0;
			String question, answer, choiceA, choiceB, choiceC, choiceD;
			while(rs.next()) {
				question  =  rs.getString("question");
				answer  =  rs.getString("answer");
				choiceA  =  rs.getString("choiceA");
				choiceB  =  rs.getString("choiceB");
				choiceC  =  rs.getString("choiceC");
				choiceD  =  rs.getString("choiceD");
				
				if(c == 0) {jSon = "[";}
				if(c > 0) {jSon = jSon + ",";}
				jSon = jSon + "{\"question\": \""+question+"\", \"a\": \""+choiceA+"\", \"b\": \""+choiceB+"\", \"c\": \""+choiceC+"\", \"d\": \""+choiceD+"\", \"ans\": \""+answer+"\" }";
				c++;
			}
			if(c > 0) {jSon = jSon + "]";}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		response.getWriter().write(jSon);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

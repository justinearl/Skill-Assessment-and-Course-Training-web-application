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
import javax.servlet.http.HttpSession;

import resources.dbConnection;

public class LoadIdentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoadIdentification() {
        super();
  
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("sessionID");
		String jSon ="[{\"question\": \"What is the unit of resistance?\",  \"ans\": \"Ohm\" }]";
		String clss = request.getParameter("pendingId");
		PreparedStatement ps;
		ResultSet rs = null;
		Connection con = dbConnection.getConnection();
		
		try {
			ps = con.prepareStatement("Select * from questionlist where type = ? and asID = ? and authorId = ?");
			ps.setString(1, "identification");
			ps.setString(2, clss);
			ps.setString(3, user);
			rs = ps.executeQuery();
			int c = 0;
			String question, answer;
			while(rs.next()) {
				question  =  rs.getString("question");
				answer  =  rs.getString("answer");
				
				if(c == 0) {jSon = "[";}
				if(c > 0) {jSon = jSon + ",";}
				jSon = jSon + "{\"question\": \""+question+"\", \"ans\": \""+answer+"\" }";
				c++;
			}
			if(c > 0) {jSon = jSon + "]";}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		response.getWriter().write(jSon);
		
	}

}

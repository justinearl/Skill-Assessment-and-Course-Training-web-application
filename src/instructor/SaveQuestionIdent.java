package instructor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import resources.dbConnection;


public class SaveQuestionIdent extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveQuestionIdent() {
        super();
     
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionJson = request.getParameter("questionJson");
		String classId	= request.getParameter("pendingId");
		HttpSession session = request.getSession(false);
		String user = (String) session.getAttribute("sessionID");
		JSONObject obj = new JSONObject(questionJson);
		
		JSONArray arr = obj.getJSONArray("saveThis");
		
		PreparedStatement ps;
		Connection con = dbConnection.getConnection();
		try {
			ps = con.prepareStatement("delete from questionlist where asId=? and authorId=? and type=?");
			ps.setString(1, classId);
			ps.setString(2, user);
			ps.setString(3, "identification");
			ps.execute();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		for (int i = 0; i < arr.length(); i++)
		{
		    String question = arr.getJSONObject(i).getString("question");
		    String answer = arr.getJSONObject(i).getString("ans");
		   
		    saveQuest(classId,user,question,answer);
		}
		
	}
	
	public void saveQuest(String classId,String userId,String q, String ans) {
		PreparedStatement ps;
		
		Connection con = dbConnection.getConnection();
		
		try {
			
			ps = con.prepareStatement("Insert into questionlist (asID, type, question, answer, authorId) values(?,?,?,?,?)");
			ps.setString(1, classId);
			ps.setString(2, "identification");
			ps.setString(3, q);
			ps.setString(4, ans);
			ps.setString(5, userId);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

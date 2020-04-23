package instructor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.*;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import resources.dbConnection;


public class SaveQuestion extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

    public SaveQuestion() {
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
			ps.setString(3, "choices");
			ps.execute();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		for (int i = 0; i < arr.length(); i++)
		{
		    String question = arr.getJSONObject(i).getString("question");
		    String answer = arr.getJSONObject(i).getString("ans");
		    String a = arr.getJSONObject(i).getString("a");
		    String b = arr.getJSONObject(i).getString("b");
		    String c = arr.getJSONObject(i).getString("c");
		    String d = arr.getJSONObject(i).getString("d");
		   
		    saveQuest(classId,user,question,answer,a,b,c,d );
		}
		
		//System.out.println(questionJson);
	}
	
	public void saveQuest(String classId,String userId,String q, String ans, String a, String b, String c, String d) {
		PreparedStatement ps;

		
		Connection con = dbConnection.getConnection();
		
		try {
			
			ps = con.prepareStatement("Insert into questionlist (asID, type, question, answer, choiceA, choiceB, choiceC, choiceD, authorId) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, classId);
			ps.setString(2, "choices");
			ps.setString(3, q);
			ps.setString(4, ans);
			ps.setString(5, a);
			ps.setString(6, b);
			ps.setString(7, c);
			ps.setString(8, d);
			ps.setString(9, userId);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

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


public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Feedback() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ArrayList<FeedbackCollection> getFeed = feedback();
	request.setAttribute("feedback", getFeed);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/feedbackAdmin.jsp");
	dispatcher.forward(request, response);
	}

	
	private ArrayList<FeedbackCollection> feedback(){
		Connection con = dbConnection.getConnection();
		ArrayList<FeedbackCollection> feed = null;
		
		PreparedStatement ps;
		ResultSet rs=null;
		
		try {
			ps = con.prepareStatement("Select * from feedback");
			rs = ps.executeQuery();
			
			feed = new ArrayList<>();
			while(rs.next()) {
				FeedbackCollection message = new FeedbackCollection();
				message.setId(rs.getString("id"));
				message.setMessage(rs.getString("message"));
				message.setSubject(rs.getString("subject"));
				message.setName(rs.getString("author"));
				feed.add(message);			
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return feed;
		
	}
}

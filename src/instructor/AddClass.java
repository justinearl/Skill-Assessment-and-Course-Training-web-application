package instructor;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import resources.dbConnection;

/**
 * Servlet implementation class AddClass
 */
public class AddClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("className");
		 String desc = request.getParameter("classDescription");
		 String key = request.getParameter("enrollmentKey");
		 String subj = request.getParameter("classSubject");
		 String section = request.getParameter("classSection");
		 String year = request.getParameter("classYear");
		 String img = null;
		 System.out.println(subj);
		 if(subj.equals("Electronics")){
			 img = request.getContextPath()+"/images/subjects/hard.jpg";
		 }else if(subj.equals("Circuits")){
			 img = request.getContextPath()+"/images/subjects/circuit.jpg";
		 }else if(subj.equals("Programming")){
			 img = request.getContextPath()+"/images/subjects/prog.jpg";
		 }else if(subj.equals("Logic Circuits")){
			 img = request.getContextPath()+"/images/subjects/binary.png";
		 }else{
			 img = request.getContextPath()+"/images/subjects/gear.jpg";
		 }
		 HttpSession session = request.getSession(false);
		 String user = session.getAttribute("sessionID").toString();
		 String author = null;
		 
		 	Connection con = dbConnection.getConnection();
			PreparedStatement as,getUser;
			ResultSet userName;
			
			try {
				getUser = con.prepareStatement("SELECT * from user where id = ?");
				getUser.setString(1, user);
				userName = getUser.executeQuery();
				
				if(userName.next()){
					author = userName.getString("firstname") + " " + userName.getString("lastname");
				}
				
				as = con.prepareStatement("Insert into classList (classname, classdesc, date, author, classyear, classsection, enkey, cardimg, classcon, classsubject) values(?,?,?,?,?,?,?,?,?,?)");
				as.setString(1,name);
				as.setString(2,desc);
				as.setString(3,"0");
				as.setString(4,author);
				as.setString(5,year);
				as.setString(6,section);
				as.setString(7,key);
				as.setString(8,img);
				as.setString(9, user);
				as.setString(10, subj);
				as.executeUpdate();

				as.close();
				userName.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			response.sendRedirect("/Final/Instructor/ClassView");
	}

}

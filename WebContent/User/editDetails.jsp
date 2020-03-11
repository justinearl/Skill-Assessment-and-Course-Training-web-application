<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page session="true"%>
<%@ page import="java.util.Random" %>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}else {
%>
<%
    String nf = request.getParameter("newFname");
    String nm = request.getParameter("newMname");
    String nl = request.getParameter("newLname");
    String nE = request.getParameter("newEmail");
    String nC = request.getParameter("newDegree");
    String nS = request.getParameter("newSchool");
	String user = session.getAttribute("sessionID").toString();
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
		Statement sta = con.createStatement();
		sta.executeUpdate("UPDATE user SET firstname = "+ "'"+ nf +"'" +", middlename = "+ "'"+ nm +"'" + ",lastname="+"'"+nl+"'"+",email ="+"'"+nE+"'"+",course = "+"'"+nC+"'"+",school ="+"'"+nS+"'"+" WHERE ID = "+user);
		
		
		//logActivity
		
		
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
				String dd = formatter.format(new Date());
				String act = "User "+nf+" Edit Details";
				
				PreparedStatement logQue;
				logQue = con.prepareStatement("Insert into logs (logDate, logActivity, logBy) values(?,?,?)");
				logQue.setString(1,dd);
				logQue.setString(2,act);
				logQue.setString(3,user);
				logQue.executeUpdate();
				
		sta.close();
		con.close();
	} catch (SQLException ex) {
		while (ex != null) {
			System.out.println("SQL Exception: " + ex.getMessage());
			ex = ex.getNextException();
		}
	}
	
	response.sendRedirect(request.getContextPath()+"/User/settings1.jsp?profile=saved");
%>
<%}%>
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
	response.sendRedirect("index.jsp");
}else {
%>
<%
	String ava = request.getParameter("avatar");
System.out.println(ava);
	String user = session.getAttribute("sessionID").toString();
	System.out.println(user);
	
	try {
		Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
		Statement sta = con.createStatement();
		sta.executeUpdate("UPDATE user SET avatar = "+ ava +" WHERE ID = "+user);
		
		//logActivity
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		String dd = formatter.format(new Date());
		String act = "User "+user+" changed avatar";
		
		PreparedStatement logQue;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
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
	
	response.sendRedirect("settings1.jsp?message=avatarchangesuccess");
%>
<%}%>
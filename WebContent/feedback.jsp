<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.SQLException"%>
    <%@ page session="true" %>
    <%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect("index.jsp");
}else {
%>
<% 
String subj = request.getParameter("subject");
String mess = request.getParameter("message");

	String user = session.getAttribute("sessionID").toString();
	System.out.println(user);
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
		Statement sta = con.createStatement();
		sta.executeUpdate("INSERT INTO feedback (subject, message, uid)  VALUES ('" + subj
				+ "','" + mess + "','" + user  + "')");

		
		//logActivity
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		String ff = formatter.format(new Date());
		String act = "User "+user+" sent feedback ";
		
		PreparedStatement logQue;
		logQue = con.prepareStatement("Insert into logs (logDate, logActivity, logBy) values(?,?,?)");
		logQue.setString(1,ff);
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
	
	response.sendRedirect("settings1.jsp?message=sent");
%>
<%}%>
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
<%@ page import="java.io.File"%>
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
}else if(session.getAttribute("sessionID") == "admin"){
%>
<% 
String subj = request.getParameter("courseTitle");
String mess = request.getParameter("courseCode");
String cat = request.getParameter("courseCat");
String sCat = "blank";
String logo = "gear";

	if(cat != null){
	if(cat.matches("math")){
		sCat = "Mathematics";
		logo = "math";
	}else if(cat.matches("hardware")){
		sCat = "Hardware";
		logo = "gear";
	}else if(cat.matches("software")){
		sCat = "Software";
		logo = "prog";
	}else if(cat.matches("engsci")){
		sCat = "Engineering";
		logo = "ensi";
	}else{
		
	}}

	String user = session.getAttribute("sessionID").toString();
	System.out.println(user);
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
		PreparedStatement as;
		as = con.prepareStatement("Insert into assessmentList (assessmentName, assessCode, category,  image, link) values(?,?,?,?,?)");
		as.setString(1,subj);
		as.setString(2,mess);
		as.setString(3,sCat);

		as.setString(4,logo);
		as.setString(5,"Test1.jsp");
		
		as.executeUpdate();


		
		//logActivity
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		String ff = formatter.format(new Date());
		String act = "Admin added assessment " + subj;
		
		PreparedStatement logQue;
		logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
		logQue.setString(1,ff);
		logQue.setString(2,act);

		logQue.executeUpdate();

	} catch (SQLException ex) {
		while (ex != null) {
			System.out.println("SQL Exception: " + ex.getMessage());
			ex = ex.getNextException();
		}
	}
	
	response.sendRedirect("cmsAdmin.jsp?message=sent");
%>
<%}else{
	response.sendRedirect("Login.jsp");
}%>
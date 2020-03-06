<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="imports.jsp" %>

 <%
 String subj = request.getParameter("cName");
 String mess = request.getParameter("cDesc");
 String cat = request.getParameter("key");
 
 String user = session.getAttribute("sessionID").toString();
 
 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
	PreparedStatement as;
	as = con.prepareStatement("Insert into classList (className, classDesc, date) values(?,?,?)");
	as.setString(1,subj);
	as.setString(2,mess);
	as.setString(3,cat);
	
	as.executeUpdate();
	System.out.println("dsad");
 %>
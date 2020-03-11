<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
//logActivity


SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
String dd = formatter.format(new Date());
String act = "User  logged out";

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");

PreparedStatement logQue;
logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
logQue.setString(1,dd);
logQue.setString(2,act);
logQue.executeUpdate();

	session.removeAttribute("sessionID");
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
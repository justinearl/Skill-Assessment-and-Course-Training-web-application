<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page session="true"%>
<%@ page import="java.util.Random" %>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}else {
%>

<%
	String user = request.getParameter("id");

    System.out.println(user);
	
	try {
		PreparedStatement ps;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
		ps = con.prepareStatement("delete from user where ID = ?");
		ps.setString(1, user);
		ps.executeUpdate();

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
			String dd = formatter.format(new Date());
			String act = "Admin deleted user " + user ;
			
			PreparedStatement logQue;
			logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
			logQue.setString(1,dd);
			logQue.setString(2,act);
			logQue.executeUpdate();


		ps.close();
		con.close();
	} catch (SQLException ex) {
		while (ex != null) {
			System.out.println("SQL Exception: " + ex.getMessage());
			ex = ex.getNextException();
		}
	}
	
	response.sendRedirect(request.getContextPath()+"/Admin/dashboard.jsp?message=status");
%>
<%}%>
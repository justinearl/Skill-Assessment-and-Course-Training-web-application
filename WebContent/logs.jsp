<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.BufferedWriter"%>
<%@ page import="java.io.FileWriter"%>
<%@ page import="java.util.List"%>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
PreparedStatement logs;
logs = con.prepareStatement("Select logDate, logActivity from logs");
ResultSet rs = logs.executeQuery();

FileWriter fstream = new FileWriter("C:\\final\\logs.txt");
BufferedWriter outed = new BufferedWriter(fstream);
while (rs.next()) {            
        outed.write(rs.getString(1)+" - "+rs.getString(2)); 
        outed.newLine();
}
System.out.println("Completed writing into text file");
outed.close();
response.sendRedirect("dashboard.jsp");
%>

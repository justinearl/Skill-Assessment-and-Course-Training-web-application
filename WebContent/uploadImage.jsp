<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page import="javax.servlet.http.Part"%>
<%@ page import="java.io.InputStream"%>
<%@ include file="imports.jsp" %>
<%
InputStream inputStream = null;
Part filePart = request.getPart("uploadFile");
inputStream = filePart.getInputStream();

Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = DriverManager
		.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");

PreparedStatement ps;
ps =con.prepareStatement("Insert into image (imageUpload) values (?)");
ps.setBlob(1, inputStream);
ps.executeUpdate();
System.out.println("Success");
%>
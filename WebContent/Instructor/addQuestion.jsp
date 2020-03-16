 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="imports.jsp" %>
 <% 
 String question = request.getParameter("question");
 String aChoice = request.getParameter("a");
 String bChoice = request.getParameter("b");
 String cChoice = request.getParameter("c");
 String dChoice = request.getParameter("d");
 String answer = request.getParameter("ans");
 	
 	System.out.println(question);
 	System.out.println(aChoice);
 	System.out.println(bChoice);
 	System.out.println(cChoice);
 	System.out.println(dChoice);
 	System.out.println(answer);
 %>
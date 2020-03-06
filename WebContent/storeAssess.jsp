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
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page session="true"%>
<%@ page import="java.util.Random"%>
<%
	if (session.getAttribute("sessionID") == null) {
		response.sendRedirect("index.jsp");
	} else {
%>
<%
		String trial = "1";
		int x = 0, percent = 0;
		String asc = request.getParameter("asc");
		String uid = session.getAttribute("sessionID").toString();
		PreparedStatement tr;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
		tr = con.prepareStatement("Select * from assessmentCompleted where uid = ? and assessCode = ?");
		tr.setString(1, uid);
		tr.setString(2, asc);
		ResultSet rs = tr.executeQuery();
		if (!rs.next()) {
			percent = 2;
			trial = "1";
		} else {
            while(rs.next()){
            	x++;
            }
            if(x == 1){
            	percent = 1;
            	trial = "2";
            }
		}
		String sr = request.getParameter("sc");
		int preScore = Integer.parseInt(sr)*percent;
		System.out.println("here"+preScore);
		String score = new Integer(preScore).toString();
		System.out.println("here"+score);
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String dd = simpleDateFormat.format(new Date());
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		try {
			PreparedStatement ps;
			ps = con.prepareStatement(
					"INSERT INTO assessmentCompleted (assessCode, uid, score, trial, dateDone)  VALUES (?,?,?,?,?)");
			ps.setString(1, asc);
			ps.setString(2, uid);
			ps.setString(3, score);
			ps.setString(4, trial);
			ps.setString(5, dd);
			ps.executeUpdate();
			ps.close();
			
			//logActivity
			
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
			String ff = formatter.format(new Date());
			String act = "User "+uid+" finished "+asc;
			
			PreparedStatement logQue;
			logQue = con.prepareStatement("Insert into logs (logDate, logActivity, logBy) values(?,?,?)");
			logQue.setString(1,ff);
			logQue.setString(2,act);
			logQue.setString(3,uid);
			logQue.executeUpdate();
			
			con.close();
		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception: " + ex.getMessage());
				ex = ex.getNextException();
			}
		}

		response.sendRedirect("assessment1.jsp");
%>
<%
	}
%>


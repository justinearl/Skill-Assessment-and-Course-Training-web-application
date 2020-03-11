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
<%@ page session="true"%>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<%
	if (session.getAttribute("sessionID") == null) {

		String email = request.getParameter("loginEmail");
		String pass = request.getParameter("loginPassword");
		String adm = "admin@gmail.com";
		String adp = "admin";
		if ((adm.equals(email)) && adp.equals(pass)) {
			System.out.println("123");
			session.setAttribute("sessionID", "admin");
			
			//logActivity
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
			String dd = formatter.format(new Date());
			String act = "Admin logged in";
			
			PreparedStatement logQue;
			logQue = con.prepareStatement("Insert into logs (logDate, logActivity) values(?,?)");
			logQue.setString(1,dd);
			logQue.setString(2,act);
			logQue.executeUpdate();
			request.setAttribute("urlM", "dashboard.jsp");
			response.sendRedirect(request.getContextPath()+"/Admin/dashboard.jsp");
		} else {



			/*HttpSession session = //request.getSession(); */
			PreparedStatement ps;
			//try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
				ps = con.prepareStatement("Select * from User  where email = ? and password = ?");
				ps.setString(1, email);
				ps.setString(2, pass);
				ResultSet rs = ps.executeQuery();

				if (!rs.next()) {
					session.setAttribute("sessionID", null);
					request.setAttribute("errorlogin", "Invalid Login");
					response.sendRedirect(request.getContextPath()+"/index.jsp?message=logininvalid");
				} else {

					String userCon = rs.getString(18);
					String userRole = rs.getString(17);
					if("inc".equals(userRole)){
						if(userCon.matches("true")){
							session.setAttribute("sessionID", rs.getString(1));
							request.setAttribute("urlM", request.getContextPath()+"/Instructor/instructor.jsp");
							response.sendRedirect(request.getContextPath()+"/Instructor/instructor.jsp");
						}else{
							response.sendRedirect(request.getContextPath()+"/Instructor/isuccess.jsp");
						}
						
					}else{
						
						session.setAttribute("sessionID", rs.getString(1));

						request.setAttribute("uid", rs.getString(1));
						request.setAttribute("Name", rs.getString(4) + " " + rs.getString(6)); // set your String value in the attribute
						request.setAttribute("email", rs.getString(2));
						request.setAttribute("fname", rs.getString(4));
						request.setAttribute("mname", rs.getString(5));
						request.setAttribute("lname", rs.getString(6));
						request.setAttribute("course", rs.getString(7));
						request.setAttribute("degree", rs.getString(8));
						request.setAttribute("school", rs.getString(9));
						request.setAttribute("ava", rs.getString(15));
						
						//logActivity
						
						
						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
						String dd = formatter.format(new Date());
						String act = "User "+rs.getString(4) + " " + rs.getString(6) +" logged in";
						
						PreparedStatement logQue;
						logQue = con.prepareStatement("Insert into logs (logDate, logActivity, logBy) values(?,?,?)");
						logQue.setString(1,dd);
						logQue.setString(2,act);
						logQue.setString(3,rs.getString(1));
						logQue.executeUpdate();
						response.sendRedirect(request.getContextPath()+"/User/profile1.jsp?message=loginsuccess");
					}
					
				}

			//} catch (Exception e) {
				//System.out.print(e);
			//}
		}

	} else {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>


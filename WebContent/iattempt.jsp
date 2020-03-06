<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="imports.jsp"%>
<%
	String check = request.getParameter("buttonSubmit");
	String first = request.getParameter("ifname");
	String last = request.getParameter("ilname");
	String mid = request.getParameter("imname");
	String email = request.getParameter("iemail");
	String password = request.getParameter("ipass");
	String contact = request.getParameter("ino");
	String backg = request.getParameter("iback");
	
	
	if(check.matches("Register")){
		
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String dateT = simpleDateFormat.format(new Date());
		
		PreparedStatement a,b;
		ResultSet x,y;
		try{
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
			a = con.prepareStatement("Select * from User  where email = ? ");
			a.setString(1, email);
			x = a.executeQuery();
			
			if(x.next()){
				response.sendRedirect("isignup.jsp?error=useralreadyexist");
			}else{
				b = con.prepareStatement("Insert into user (firstname, middlename, lastname, email, password, dateReg, bio,userRole, confirmation) values(?,?,?,?,?,?,?,?,?)");
				b.setString(1,first);
				b.setString(2,mid);
				b.setString(3,last);
				b.setString(4,email);
				b.setString(5,password);
				b.setString(6,dateT);
				b.setString(7,backg);
				b.setString(8, "inc");
				b.setString(9, "false");
				b.executeUpdate();
				response.sendRedirect("isuccess.jsp");
			}
		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception: " + ex.getMessage());
				ex = ex.getNextException();
			}
		}
	}else{
		response.sendRedirect("isignup.jsp");
	}
	
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="imports.jsp" %>
<%
	String pagee = "";
	String first = request.getParameter("firstName");
	String last = request.getParameter("lastName");
	String email = request.getParameter("signEmail");
	String password = request.getParameter("signPassword");
	Random random = new Random();
	random.nextInt(99999);
	String vkey = DigestUtils.md5Hex(""+random);
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	String a = "7";

	String dateT = simpleDateFormat.format(new Date());
	PreparedStatement ps1;
	Connection con1 = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
				ps1 = con1.prepareStatement("Select * from User  where email = ? ");
				ps1.setString(1, email);
				ResultSet rs1 = ps1.executeQuery();
	if(!rs1.next()){
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException e) {
	
			e.printStackTrace();
		}
	
		try {
			Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
			Statement sta = con.createStatement();
			sta.executeUpdate("INSERT INTO user (email, password, firstname, lastname, vkey, dateReg, avatar)  VALUES ('" + email
					+ "','" + password + "','" + first + "','" + last + "','" + vkey + "','" + dateT + "','" + a +"')");
	
			sta.close();
			con.close();
		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception: " + ex.getMessage());
				ex = ex.getNextException();
			}
		}
		pagee = "index.jsp?message=success";
	}else{
		pagee = "index.jsp?message=useralreadyexist";
	}
	
	
	response.sendRedirect(pagee);
%>
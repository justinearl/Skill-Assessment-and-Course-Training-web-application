<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="imports.jsp" %>

 <%

 String name = request.getParameter("className");
 String desc = request.getParameter("classDescription");
 String key = request.getParameter("enrollmentKey");
 String subj = request.getParameter("classSubject");
 String section = request.getParameter("classSection");
 String year = request.getParameter("classYear");
 String img = null;
 if(subj.matches("Electronics")){
	 img = request.getContextPath()+"/images/subjects/hard.jpg";
 }else if(subj.matches("Circuits")){
	 img = request.getContextPath()+"/images/subjects/circuit.jpg";
 }else if(subj.matches("Programming")){
	 img = request.getContextPath()+"/images/subjects/prog.jpg";
 }else if(subj.matches("Logic Circuits")){
	 img = request.getContextPath()+"/images/subjects/binary.png";
 }else{
	 img = request.getContextPath()+"/images/subjects/gear.jpg";
 }
 
 String user = session.getAttribute("sessionID").toString();
 String author = null;
 Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
	PreparedStatement as,getUser;
	ResultSet userName;
	
	getUser = con.prepareStatement("SELECT * from user where id = ?");
	getUser.setString(1, user);
	userName = getUser.executeQuery();
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	String dd = formatter.format(new Date());
	
	if(userName.next()){
		author = userName.getString("firstname") + " " + userName.getString("lastname");
	}
	
	
	as = con.prepareStatement("Insert into classList (classname, classdesc, date, author, classyear, classsection, enkey, cardimg, classcon, classsubject) values(?,?,?,?,?,?,?,?,?,?)");
	as.setString(1,name);
	as.setString(2,desc);
	as.setString(3,dd);
	as.setString(4,author);
	as.setString(5,year);
	as.setString(6,section);
	as.setString(7,key);
	as.setString(8,img);
	as.setString(9, user);
	as.setString(10, subj);
	as.executeUpdate();
	
	as = con.prepareStatement("insert into logs(logdate, logactivity, logby) values(?,?,?)");
	as.setString(1,dd);
	as.setString(2,"Created New Class");
	as.setString(3,author);
	as.executeUpdate();
	as.close();
	userName.close();
	con.close();
	request.setAttribute("ddata", "data");

 %>
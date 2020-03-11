
<%@ page import="java.sql.*"%>
<%
PreparedStatement psx;
ResultSet rsx;
String logoimg = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");

psx = conx.prepareStatement("Select * from webcontent where webpart = ?");
psx.setString(1, "logo1");
rsx = psx.executeQuery();
if(rsx.next()){
	logoimg = rsx.getString(5);
}
%>
<header class="main_menu">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand main_logo" href=<%=request.getContextPath()+"/User/home.jsp"%>> <img src="<%=request.getContextPath()+"/"+rsx.getString(5) %>" style="height:50px" alt="logo"> </a>
                    <a class="navbar-brand single_page_logo" href="home.jsp"> <img src=<%=request.getContextPath()+ "/img/footer_logo.png"%> alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="menu_icon"></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href=<%=request.getContextPath()+"/User/home.jsp"%>>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href=<%=request.getContextPath()+"/User/profile1.jsp"%>>My Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%=request.getContextPath()+"/User/assessment1.jsp"%>">Assessments</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%=request.getContextPath()+"/User/training1.jsp"%>">Classes</a>
                            </li>
                            
            
                            <li class="nav-item">
                                <a class="nav-link" href="<%=request.getContextPath()+"/User/settings1.jsp"%>">Settings</a>
                            </li>
                        </ul>
                    </div>
                    <a href="<%=request.getContextPath()+"/logout2.jsp"%>" class="d-none d-sm-block btn_1 home_page_btn">Log Out</a>
                </nav>
            </div>
        </div>
    </div>
</header>
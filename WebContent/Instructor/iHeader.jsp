
<%@ page import="java.sql.*"%>
<%@ page import="resources.dbConnection"%>
<%
PreparedStatement psx;
ResultSet rsx;
String logoimgss = null;

Connection conx = dbConnection.getConnection();

psx = conx.prepareStatement("Select * from webcontent where webpart = ?");
psx.setString(1, "logo1");
rsx = psx.executeQuery();
if(rsx.next()){
	logoimgss = rsx.getString("link");
}
%>
 <header class="main_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand main_logo" href=#> <img src=<%=rsx.getString("link")%> style="height:50px" alt="logo"> </a>
                        <a class="navbar-brand single_page_logo" href=#> <img src=<%=rsx.getString("link")%> alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"></span>
                        </button>
    
                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="/Final/Instructor/ClassView">My Classes</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="iAssessment.jsp">Assessments</a>
                                </li>
                
                                <li class="nav-item">
                                    <a class="nav-link" href="">Settings</a>
                                </li>
                            </ul>
                        </div>
                        <a href=<%=request.getContextPath()+ "/logout2.jsp"%> class="d-none d-sm-block btn_1 home_page_btn">Log Out</a>
                    </nav>
                </div>
            </div>
        </div>
    </header>
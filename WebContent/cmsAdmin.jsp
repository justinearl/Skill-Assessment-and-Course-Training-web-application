<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
    <%@ include file="imports.jsp" %>
<%        
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
%>
<%
	if (session.getAttribute("sessionID") == null) {
		response.sendRedirect("index.jsp");
	} else if(session.getAttribute("sessionID") == "admin"){
		
		PreparedStatement ps;
		ResultSet rs;
		String logoimg = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
		
		ps = con.prepareStatement("Select * from webcontent where webpart = ?");
		ps.setString(1, "logo1");
		rs = ps.executeQuery();
		if(rs.next()){
			logoimg = rs.getString(5);
		}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="au theme template" />
    <meta name="author" content="Hau Nguyen" />
    <meta name="keywords" content="au theme template" />

    <!-- Title Page-->
    <title>SACT Admin</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all" />
    <link
      href="vendor/font-awesome-4.7/css/font-awesome.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/font-awesome-5/css/fontawesome-all.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/mdi-font/css/material-design-iconic-font.min.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Bootstrap CSS-->
    <link
      href="vendor/bootstrap-4.1/bootstrap.min.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Vendor CSS-->
    <link
      href="vendor/animsition/animsition.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
      rel="stylesheet"
      media="all"
    />
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all" />
    <link
      href="vendor/css-hamburgers/hamburgers.min.css"
      rel="stylesheet"
      media="all"
    />
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all" />
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all" />
    <link
      href="vendor/perfect-scrollbar/perfect-scrollbar.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Data Table CSS -->
    <link
      href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
      rel="stylesheet"
    />
    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all" />
  </head>

  <body>
    <div class="page-wrapper">
      <%@ include file="adminHeader.jsp" %>

      <!-- PAGE CONTENT-->
      <div class="page-content--bgf7">
        <!-- WELCOME-->
        <section class="welcome p-t-10">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <br />
                <h1 class="title-4">
                  Web Contents
                </h1>
                <div>
                <p>Current Logo</p>
                <img
                  src="<%=logoimg %>"
                  class="logo"
                  style="height: 50px"
                  alt="SACT"
                /><br>
         		 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#logoModal">Change Web Logo</button>
         		 </div>
         		 <br>
         		  <div>
                <p>Assessment</p>
               
               	<br>
         		 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#logoTrainings">Add Assessment Modules</button>
         		 </div>
                <hr class="line-seprate" />
                
              </div>
            </div>
          </div>
        </section>

<!-- MODALS -->
       <div class="modal fade" tabindex="-1" role="dialog" id="logoModal">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Change web logo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="insertImage.jsp" enctype="multipart/form-data">
      <div class="modal-body">
      
        <input type="file" id="myFile" accept="image/*" name="uploadFile">
  
 
      </div>
      <div class="modal-footer">
      <button type="submit" value="FileUpload" class="btn btn-primary" id="saveLogo">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </form>
        
      </div>
    </div>
  </div>
</div>

 <div class="modal fade" tabindex="-1" role="dialog" id="logoTrainings">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Assessment Module</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method="post" action="addAssess.jsp">
      <input type="text" id="courseTitle" name= "courseTitle"placeholder="Enter Assessment title here..."><br>
      <input type="text" id="courseCode" name="courseCode" placeholder="Enter Assessment code here...">
      <br>
      	<label for="courseCat">Category</label>
      	<select id="courseCat" name="courseCat">
      	 
  			<option value="math">Mathematics</option>
  			<option value="hardware">Hardware</option>
  			<option value="software">Software</option>
  			<option value="engsci">Engineering Sciences</option>
  			
		</select>
        <input type="file" id="myFile" name = "myFile" multiple>
        <input type="submit" id="submitTraining" style="display:none">
        
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="saveTraining">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>
        <!-- COPYRIGHT-->
        <section class="p-t-60 p-b-20">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="copyright">
                  <p>Copyright ÃÂ© 2019 SACT. All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- END COPYRIGHT-->
      </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js"></script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js"></script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script
      type="text/javascript"
      charset="utf8"
      src="libraries\DataTables\datatables.min.js"
    ></script>

    <!-- Main JS-->
    <script src="js/main.js"></script>

    <script>
      $(document).ready(function() {
        $("#trainings").DataTable({
          paging: true
        });
        $("#assessments").DataTable({
          paging: true
        });
      });
      
      $("#saveLogo").click({
    	  $("#submitLogo").click();
      });
      $("#saveTraining").click({
    	  $("#submitTraining").click();
      });
    </script>
  </body>
</html>

<%
	}else{
		response.sendRedirect("home.jsp");
	}
%>
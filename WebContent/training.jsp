<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page session="true" %>
<%if(session.getAttribute("sessionID") != null) {%>
<html>

<head>
<link rel="stylesheet"
	href="libraries\bootstrap-4.0.0-dist\css\bootstrap.min.css">
<script src="libraries/jquery-3.4.1.min.js"></script>
<script src="libraries/Chart.min.js"></script>
<link href="libraries\alertifyjs/css/alertify.min.css" rel="stylesheet"
	type="text/css" />
<link href="libraries\alertifyjs/css/themes/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="libraries\DataTables\DataTables-1.10.18\css\jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="SACTStyle.css">

</head>


<body>
	<div id="headBar"><img src="test.png" class="logo">

	<nav>
		<div class="nav nav-pills" id="nav-tab" role="tablist">

			<a class="nav-item nav-link" id="nav-home-tab" data-toggle=""
				role="tab" aria-controls="nav-home" aria-selected="false"
				href="<%=request.getContextPath() + "/Logout"%>">Logout</a>
				
			<a class="nav-item nav-link active" id="nav-prof-tab" data-toggle=""
				href="profile.jsp" role="tab" aria-controls="nav-prof"
				aria-selected="true" style="color: rgb(26, 26, 26);" onMouseOver="this.style.color='pink'" onMouseOut="this.style.color='rgb(26, 26, 26)'" >Profile</a>
			<a class="nav-item nav-link" id="nav-assess-tab" data-toggle="" href="assessment.jsp" role="tab"
				aria-controls="nav-assess" aria-selected="false">Assessment</a>
			<a class="nav-item nav-link" id="nav-train-tab" data-toggle=""
				href="training.jsp" role="tab" aria-controls="nav-train"
				aria-selected="false" style="color: rgb(89, 197, 177);">Training</a> 
			<a class="nav-item nav-link" id="nav-help-tab" data-toggle="" href="settings.jsp" role="tab"
				aria-controls="nav-help" aria-selected="false">Settings and About</a>

		</div>
	</nav>
	</div>
	<div style="display: flex;">



		<div style="width: 70%; margin-left: 60px;">
			<p
				style="font-size: 40px; color: rgb(70, 70, 70); margin-top: 200px; margin-right: 100px; margin-bottom: 10px; text-align: left;"
				id="fullName">
				Boost your mind<br>and train your skills!
			</p>
			<p style="text-align: left;">Choose from a variety of skill
				training below.</p>
		</div>

		<img src="images/trainy.jpg" style="margin-right: 20px;">
	</div>
	<div
		style="background-color: rgb(241, 250, 248); width: 100%; border-radius: 10px; padding: 30px; padding-left: 0px;">
		<div class="container" style="padding: 0px; margin: 0px;">
			<div class="container"
				style="display: flex; margin-left: 65%; margin-right: 0px; padding: 0px;">
				<input type="text" id="myFilter" class="form-control"
					onkeyup="searchAssessment()" placeholder="Search.."
					style="width: 30%"> <select
					class="form-control form-control-sm" id="searchCategory"
					style="width: 18%; height: 40px;">
					<option>By Course Title</option>
					<option>By Course Category</option>
				</select>
			</div>

			<div class="container"
				style="display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px;">

				<%
					PreparedStatement ps;
					Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
					Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
					ps = con.prepareStatement("Select * from courseList");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<!-- // 						out.print("<div class='container' style='display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px;'><div class='card assess' style='width: 18rem;'><img src='images/home.jpg' class='card-img-top' alt='...'><div class='card-body'><h5 class='card-title'>" + rs.getString(2)+"</h5>"); -->
				<!-- // 						out.print("<p class='card-text'>" + rs.getString(3)+"</p>"); -->
				<!-- // 						out.print("<h5 class='card-cat'>" + rs.getString(4)+"</h5>"); -->
				<!-- // 						out.print("<a href='#' class='btn btn-light proceed'>Proceed</a></div></div>"); -->
				<div class="card assess" style="width: 18rem;">
					<img src="images/home.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<%
								out.print(rs.getString(2));
							%>
						</h5>
						<p class="card-text">
							<%
								out.print(rs.getString(3));
							%>
						</p>
						<h5 class="card-cat">
							<%
								out.print(rs.getString(4));
							%>
						</h5>
						<a href="#" class="btn btn-light proceed">Proceed</a>
					</div>
				</div>

				<%
					}
				%>


			</div>
</div>
</div>
			<script type="text/javascript"
				src="libraries\alertifyjs/alertify.min.js"></script>

			<script>
				alertify.defaults.transition = "slide";
				alertify.defaults.theme.ok = "btn btn-success";

				$(document).ready(function() {

				});

				function searchAssessment() {
					var input, filter, cards, cardContainer, h5, title, i, cat;
					input = $("#myFilter");
					filter = input.val().toUpperCase();
					cards = $(".card");
					cat = $("#searchCategory").val();
					if (cat == "By Course Title") {
						for (i = 0; i < cards.length; i++) {
							title = cards[i]
									.querySelector(".card-body h5.card-title");
							if (title.innerText.toUpperCase().indexOf(filter) > -1) {
								cards[i].style.display = "";
							} else {
								cards[i].style.display = "none";
							}
						}
					} else if (cat == "By Course Category") {
						for (i = 0; i < cards.length; i++) {
							title = cards[i]
									.querySelector(".card-body h5.card-cat");
							if (title.innerText.toUpperCase().indexOf(filter) > -1) {
								cards[i].style.display = "";
							} else {
								cards[i].style.display = "none";
							}
						}
					}
				}
			</script>



			<!-- SCRIPTS SRC -->
			<script src="libraries\jquery-3.4.1.slim.min.js"></script>
			<script src="libraries\popper.js-1.14.7\package\dist\popper.min.js"></script>
			<script src="libraries\bootstrap-4.0.0-dist\js\bootstrap.min.js"></script>
			<script type="text/javascript" charset="utf8"
				src="libraries\DataTables\DataTables-1.10.18\js\jquery.dataTables.js"></script>
</body>

</html>
<%}else {response.sendRedirect("landingpage.jsp");}%>
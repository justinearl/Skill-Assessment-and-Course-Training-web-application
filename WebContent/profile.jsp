<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page session="true"%>

<%
	if (session.getAttribute("sessionID") != null) {
%>
<html>

<head>
<link rel="stylesheet"
	href="libraries\bootstrap-4.0.0-dist\css\bootstrap.min.css">
<script src="libraries/jquery-3.4.1.min.js"></script>
<script src="libraries/Chart.min.js"></script>
<link href="libraries\alertifyjs/css/alertify.min.css" rel="stylesheet"
	type="text/css">
<link href="libraries\alertifyjs/css/themes/bootstrap.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="libraries\DataTables\DataTables-1.10.18\css\jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="SACTStyle.css">

</head>


<body>
	<div id="headBar"><img src="images/test.png" class="logo">

	<nav>
		<div class="nav nav-pills" id="nav-tab" role="tablist">

			<a class="nav-item nav-link" id="nav-home-tab" data-toggle=""
				role="tab" aria-controls="nav-home" aria-selected="false"
				href="<%=request.getContextPath() + "/Logout"%>">Logout</a> <a
				class="nav-item nav-link active" id="nav-prof-tab" data-toggle=""
				href="profile.jsp" role="tab" aria-controls="nav-prof"
				aria-selected="true">Profile</a> <a class="nav-item nav-link"
				id="nav-assess-tab" data-toggle="" href="assessment.jsp" role="tab"
				aria-controls="nav-assess" aria-selected="false">Assessment</a> <a
				class="nav-item nav-link" id="nav-train-tab" data-toggle=""
				href="training.jsp" role="tab" aria-controls="nav-train"
				aria-selected="false">Training</a> <a class="nav-item nav-link"
				id="nav-help-tab" data-toggle="" href="settings.jsp" role="tab"
				aria-controls="nav-help" aria-selected="false">Settings and
				About</a>

		</div>
	</nav>
	</div>


	<div class="tab-pane fade show" id="nav-prof" role="tabpanel"
		aria-labelledby="nav-prof-tab" style="padding-top: 64px;">
		<div style="display: flex">
			<div class="container" id="userAbout"
				style="margin-left: 30px; padding: 25px 25px 25px 25px; background-color: rgb(241, 250, 248); border-radius: 10px; width: 250px">
				<%
					PreparedStatement ps;
						String id = (String) request.getSession().getAttribute("sessionID");

						Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
						Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
						ps = con.prepareStatement("Select * from User where ID = ?");
						ps.setString(1, id);
						ResultSet rs = ps.executeQuery();
						String name = null;
						String email = null;
						String course = null;
						String school = null;
						if (!rs.next()) {
							out.print(id);
						} else {
							name = rs.getString(4);
							email = rs.getString(2);
							course = rs.getString(7);
							school = rs.getString(9);
						}
				%>
				<img src="avatar/default.png" class="userAvatar"
					style="width: 200px; height: 200px;">
				<h4
					style="color: rgb(70, 70, 70); margin-top: 10px; margin-bottom: 0px;"
					class="text-center" id="fullName">
					<%
						out.print(name);
					%>
				</h4>
				<p class="text-center" id="emailAdd">
					<%
						out.print(email);
					%>
				</p>
				<table class="table">
					<tbody style="color: rgb(121, 121, 121); font-size: 12px;">
						<tr class="rowAbout">
							<td class="detailAbout">Bachelor's Degree</td>
							<td id="bsCourse">
								<%
									out.print(course);
								%>
							</td>
						</tr>
						<tr class="rowAbout">
							<td class="detailAbout">School</td>
							<td id="school">
								<%
									out.print(school);
								%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="width: 100%; margin-left: 25px; margin-right: 25px;">
				<div class="container" id="userSkills"
					style="display: flex; width: 100%; height: 250px; padding: 25px 0px 25px 25px; background-color: white; border: 1px solid rgb(89, 197, 177); border-radius: 10px;">
					<div class="container"
						style="width: 45%; height: 100%; border-right: 1px solid rgb(241, 250, 248); padding-left: 0; margin-left: 0;">
						<div style="width: 100%; height: 60%;">
							<h6 style="color: rgb(70, 70, 70);">Badges</h6>
							<div class="container" style="display: flex; flex-flow: row wrap">
								<img src="badges and ranks\circuit.png" class="badges">
								<img src="badges and ranks\cplusplus.png" class="badges">
							</div>
						</div>
						<div style="width: 100%; height: 40%">
							<h6 style="color: rgb(70, 70, 70);">Rank</h6>
							<div style="display: flex">
								<img src="badges and ranks\rank1.png"
									style="margin-left: 10px; width: 100px; height: 50px; object-fit: cover">
								<h6
									style="color: rgb(70, 70, 70); margin-top: auto; margin-bottom: auto; margin-left: 5px;">Novice</h6>
							</div>
						</div>
					</div>
					<div
						style="width: 5%; height: 100%; margin-top: 25px; padding-left: 5px;">
						<button type="button" id="bar" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: rgb(252, 232, 235);">
							<img src="icons\bar.jpg" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="line" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: rgb(252, 232, 235);">
							<img src="icons\line.png" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="pie" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: rgb(252, 232, 235);">
							<img src="icons\pie.png" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="radar" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: rgb(252, 232, 235);">
							<img src="icons\radar.png" style="width: 15px; height: 15px;">
						</button>
						<br>
					</div>
					<div class="container"
						style="position: relative; height: 32vh; width: 32vw; background-color: white;">

						<canvas id="myChart"></canvas>
					</div>
				</div>
				<div class="container"
					style="width: 100%; height: 100%; display: flex; padding: 0px">
					<div
						style="width: 100%; height: 100%; margin-top: 20px; margin-right: 10px; padding: 25px 25px 25px 25px; background-color: rgb(252, 232, 235); border-radius: 10px;">
						<h6 style="color: rgb(70, 70, 70);">Assessments</h6>
						<div class="container"
							style="display: flex; flex-direction: row; flex-wrap: wrap;">


<!-- 							<div class="card"> -->
<!-- 								<img src="images/home.jpg" class="card-img-top" alt="..."> -->
<!-- 								<div class="card-body"> -->
<!-- 									<h5 class="card-title">Java Programming</h5> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</div>

					</div>

					<div
						style="width: 100%; height: 100%; margin-top: 20px; margin-left: 10px; padding: 25px 25px 25px 25px; background-color: rgb(89, 197, 177); border-radius: 10px;">
						<h6 style="color: white;">Trainings</h6>
						<div class="container"
							style="display: flex; flex-direction: row; flex-wrap: wrap;">
							<%
								Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
									ps = con.prepareStatement("Select * from UserCourse where user_id = ?");
									ps.setString(1, id);
									rs = ps.executeQuery();
									while (rs.next()) {
							%>
							<div class="card">
								<img src="images/home.jpg" class="card-img-top" alt="...">

								<div class="progress" style="height: 10px; margin-top: 4px;">
									<div class="progress-bar" role="progressbar"
										style=<%out.print("'width:"+rs.getString(4)+"%'"); %> aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">
										<%
											out.print(rs.getString(4));
										%>
									</div>
								</div>
								<div class="card-body training">
									<h5 class="card-title">
										<%
											out.print(rs.getString(2));
										%>
									</h5>
								</div>
							</div>


							<%
								}
							%>
							


						</div>
					</div>
				</div>
			</div>

		</div>
	</div>




	<script type="text/javascript"
		src="libraries\alertifyjs/alertify.min.js"></script>

	<script>
		alertify.defaults.transition = "slide";
		alertify.defaults.theme.ok = "btn btn-success";

		$(document).ready(function() {
			loadChart();
			fillForm();
			$("#line").click(function() {
				changeChart("line");
			});
			$("#bar").click(function() {
				changeChart("bar");
			});
			$("#pie").click(function() {
				changeChart("pie");
			});
			$("#radar").click(function() {
				changeChart("radar");
			});
		});

		function fillForm() {
			var fname = $("#fullName").text();
			var email = $("#emailAdd").text();
			var bsDegree = $("#bsCourse").text();
			var school = $("#school").text();

			if (fname == "null") {
				$("#fullName").text("John Dela Cruz");
			}
			if (email == "null") {
				$("#emailAdd").text("johndelacruz@email.com");
			}
			if (bsDegree == "null") {
				$("#bsCourse").text("NA");
			}
			if (school == "null") {
				$("#school").text("NA");
			}
		}

		var config = {
			type : chartType,
			data : {
				labels : [ 'Hardware', 'Software', 'Mathematics', 'Engineering Sciences','General Sciences' ],
				datasets : [ {
					label : 'Skill Points',
					data : [ 50, 19, 34, 56, 10 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)', 'rgba(0, 129, 22, 0.2)','rgba(124, 129, 22, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(0, 129, 22, 1)','rgba(124, 129, 22, 1)' ],
					borderWidth : 1
				} ]
			}
		};

		var chartType = 'bar';
		var myChart;

		function changeChart(type) {
			console.log("changeChart()");
			var chart = type;
			console.log(chart);
			chartType = chart;
			var ctx = document.getElementById('myChart').getContext('2d');
			if (myChart) {
				myChart.destroy();
			}

			// Chart.js modifies the object you pass in. Pass a copy of the object so we can use the original object later
			var temp = jQuery.extend(true, {}, config);
			temp.type = chartType;
			myChart = new Chart(ctx, temp);
		}
		function loadChart() {
			var ctx = document.getElementById('myChart').getContext('2d');
			myChart = new Chart(ctx,
					{
						type : chartType,
						data : {
							labels : [ 'Hardware', 'Software', 'Mathematics', 'Engineering Sciences','General Sciences' ],
							datasets : [ {
								label : 'Skill Points',
								data : [ 50, 19, 34, 56, 10 ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)' ,'rgba(124, 129, 22, 0.2)'],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)','rgba(124, 129, 22, 1)' ],
								borderWidth : 1
							} ]
						}
					});
		}

		$(document).ready(function() {
			$('#test').DataTable();
		});
	</script>



	<!-- SCRIPTS SRC -->
	<script src="libraries\jquery-3.4.1.slim.min.js"></script>
	<script src="libraries\popper.js-1.14.7\package\dist\popper.min.js"></script>
	<script src="libraries\bootstrap-4.0.0-dist\js\bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="libraries\DataTables\DataTables-1.10.18\js\jquery.dataTables.js"></script>

</body>

</html>
<%
	} else {
		response.sendRedirect("landingpage.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="imports.jsp"%>


<!doctype html>
<html lang="zxx">

<%@ include file="head.jsp"%>

<body>
	<%@ include file="header.jsp"%>

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>My Profile</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<p id="b1" style="display: none"></p>
	<p id="b2" style="display: none"></p>
	<p id="b3" style="display: none"></p>
	<p id="b4" style="display: none"></p>

	<div class="tab-pane fade show" id="nav-prof" role="tabpanel"
		aria-labelledby="nav-prof-tab" style="padding-top: 20px;">
		<div style="display: flex">
			<div class="container" id="userAbout"
				style="margin-left: 30px; padding: 25px 25px 25px 25px; background-color: #ebebeb; width: 300px">
				<img src="${photo}" class="userAvatar"
					style="width: 250px; height: 250px;">
				<h4
					style="color: black; margin-top: 10px; margin-bottom: 0px; font-size: 30px;"
					class="text-center" id="fullName">
					${name}
				</h4>
				<p style="color: black" class="text-center" id="emailAdd">
					${email }
				</p>
				<table class="table">
					<tbody style="color: black; font-size: 12px;">
						<tr class="rowAbout">
							<td class="detailAbout">Bachelor's Degree</td>
							<td id="bsCourse">
								${userCourse }
							</td>
						</tr>
						<tr class="rowAbout">
							<td class="detailAbout">School</td>
							<td id="school">
								${userSchool }
							</td>
						</tr>
					</tbody>
				</table>
				<div class="container"
					style="width: 100%; padding-left: 0; margin-left: 0;">
					<div style="width: 100%; height: 60%;">
						<h6 style="color: black;">Badges</h6>
						<div class="container" style="display: flex; flex-flow: row wrap">
							<img src=<%=request.getContextPath() + "/icons/bar.jpg"%>
								class="badges">
						</div>
					</div>
					<br>
					<div style="width: 100%; height: 40%">
						<h6 style="color: black;">Points</h6>
						<div style="display: flex">
							<h6 id="stars"
								style="color: black; margin-top: auto; margin-bottom: auto; margin-left: 5px;">
								${userPoints }&nbsp;
							</h6>
							<img src=<%=request.getContextPath() + "/icons/star.png"%>
								style="height: 20px;">
						</div>
					</div>
				</div>
			</div>
			<div style="width: 70%; margin-left: 25px; margin-right: 25px;">
				<div class="container" id="userSkills"
					style="display: flex; width: 100%; height: 300px; padding: 25px 0px 25px 25px; background-color: white; border: 1px solid #f45b69;">

					<div
						style="width: 5%; height: 100%; margin-top: 25px; padding-left: 5px;">
						<button type="button" id="bar" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: #f45b69;"
							title="BAR GRAPH">
							<img src="icons\bar.jpg" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="line" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: #f45b69;"
							title="LINE GRAPH">
							<img src="icons\line.png" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="pie" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: #f45b69;"
							title="PIE CHART">
							<img src="icons\pie.png" style="width: 15px; height: 15px;">
						</button>
						<br>
						<button type="button" id="radar" class="btn btn-light chart"
							style="margin-bottom: 10px; background-color: #f45b69;"
							title="RADAR CHART">
							<img src="icons\radar.png" style="width: 15px; height: 15px;">
						</button>
						<br>
					</div>
					<div class="container"
						style="position: relative; height: 37vh; width: 40vw; background-color: white;">

						<canvas id="myChart"></canvas>
					</div>
				</div>
				<div class="container"
					style="width: 100%; min-height: 250px; display: flex; padding: 0px">
					<div
						style="width: 100%; min-height: 250px; margin-top: 20px; margin-right: 10px; padding: 25px 25px 25px 25px; background-color: #4062bb;">
						<h4 style="color: white;">ASSESSMENTS</h4>
						<br>
						<div class="container"
							style="display: flex; flex-direction: row; flex-wrap: wrap;">
							

							<div class="card">
								<img src="images/subjects/test.jpg"
									class="card-img-top" alt="...">
								<div class="card-body"
									style="padding-bottom: 5px; padding-top: 10px; color: black;">
									<h5 class="card-title">
										
									</h5>
									<p style="font-size: 10px; margin-bottom: 0px;">
										Score:
										
									</p>
								</div>
							</div>
							
						</div>

					</div>

					<div
						style="width: 100%; min-height: 250px; margin-top: 20px; margin-left: 10px; padding: 25px 25px 25px 25px; background-color: #59c3c3;">
						<h4 style="color: white;">TRAININGS</h4>
						<br>
						<div class="container"
							style="display: flex; flex-direction: row; flex-wrap: wrap;">
							
							<div class="card">
								<img src="images/subjects/trest.jpg"
									class="card-img-top" alt="...">

								<div class="progress" style="height: 10px; margin-top: 4px;">
									<div class="progress-bar" role="progressbar"
										style="width: <%out.print("prog");%>%;"
										aria-valuenow="<%out.print("prog");%>" aria-valuemin="0"
										aria-valuemax="100">
										<%
											out.print("prog");
										%>%
									</div>
								</div>
								<div class="card-body"
									style="padding-bottom: 5px; padding-top: 5px;">
									<h5 class="card-title">
									
									</h5>
									<a href=""
										style="float: right;">Continue ></a>
								</div>
							</div>

							
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!--::footer_part start::-->
	<footer class="footer_part">
		<div class="container">

			<hr>
			<div class="row">
				<div class="col-lg-8">
					<div class="copyright_text">
						<P>Copyright &copy;2019 All rights reserved.</P>
						,

					</div>
				</div>

			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

	<%@ include file="jsScriptUser.jsp"%>
	<script>
		$(document).ready(function() {

			loadChart();
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

		var m = $('#b1').html();
		var n = $('#b2').html();
		var o = $('#b3').html();
		var p = $('#b4').html();

		var chartData = [ m, n, o, p ];

		var config = {
			type : chartType,
			data : {
				labels : [ 'Software', 'Hardware', 'Mathematics',
						"Eng'g Sciences" ],
				datasets : [ {
					label : 'Skill Points',
					data : chartData,
					backgroundColor : [ 'rgba(255, 99, 132, 0.7)',
							'rgba(54, 162, 235, 0.7)',
							'rgba(255, 206, 86, 0.7)', 'rgba(0, 129, 22, 0.7)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(0, 129, 22, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						gridLines : {
							drawOnChartArea : false
						}
					} ],
					yAxes : [ {
						gridLines : {
							drawOnChartArea : false
						}
					} ]
				}
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
			myChart = new Chart(ctx, {
				type : chartType,
				data : {
					labels : [ 'Software', 'Hardware', 'Mathematics',
							"Eng'g Sciences" ],
					datasets : [ {
						label : 'Skill Points',
						data : chartData,
						backgroundColor : [ 'rgba(255, 99, 132, 0.7)',
								'rgba(54, 162, 235, 0.7)',
								'rgba(255, 206, 86, 0.7)',
								'rgba(75, 192, 192, 0.7)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						xAxes : [ {
							gridLines : {
								drawOnChartArea : false
							}
						} ],
						yAxes : [ {
							gridLines : {
								drawOnChartArea : false
							}
						} ]
					}
				}
			});
		}

		$(document).ready(function() {
			$('#test').DataTable();
		});
	</script>
</body>

</html>


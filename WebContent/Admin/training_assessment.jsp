<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@
page session="true"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<%
	if (session.getAttribute("sessionID") == "admin") {
		
	%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jsp" %>

<body>
	<div class="page-wrapper">
		<%@ include file="adminHeader.jsp"%>

		<!-- PAGE CONTENT-->
		<div class="page-content--bgf7">
			<!-- WELCOME-->
			<section class="welcome p-t-10">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<br />
							<h1 class="title-4">Trainings</h1>
							<hr class="line-seprate" />
						</div>
					</div>
				</div>
			</section>
			<!-- END WELCOME-->

			<!-- DATA TABLE-->
			<section class="p-t-20">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive table-responsive-data2">
								<table class="table table-data2" id="trainings">
									<thead>
										<tr>
											<th>Course Title</th>
											<th>Course Category</th>
											<th>Takers</th>
										</tr>
									</thead>
									<tbody>
										<%
											PreparedStatement ps1;
												Class.forName("com.mysql.jdbc.Driver").newInstance();
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
												ps1 = con.prepareStatement("Select * from assessmentList");
												ResultSet rs1 = ps1.executeQuery();
												while (rs1.next()) {
										%>
										<tr class="tr-shadow">
											<td>
												<%
													out.print(rs1.getString(2));
												%>
											</td>

											<td>
												<%
													out.print(rs1.getString(4));
												%>
											</td>
											<td>
												<%
													PreparedStatement ps4;

															ps4 = con.prepareStatement("Select COUNT(ID) from assessmentCompleted");
															ResultSet rs4 = ps4.executeQuery();
															while (rs4.next()) {
																out.print(rs4.getString(1));
															}
												%>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END DATA TABLE-->
			<section class="welcome p-t-10">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<br />
							<h1 class="title-4">Assessments</h1>
							<hr class="line-seprate" />
						</div>
					</div>
				</div>
			</section>

			<!-- DATA TABLE-->
			<section class="p-t-20">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive table-responsive-data2">
								<table class="table table-data2" id="assessments">
									<thead>
										<tr>
											<th>Course Title</th>
											<th>Course Category</th>
											<th>Set number</th>
											<th>Takers</th>
										</tr>
									</thead>
									<tbody>
										<%
											PreparedStatement ps;

												ps = con.prepareStatement("Select * from assessmentList");
												ResultSet rs = ps.executeQuery();
												while (rs.next()) {
										%>
										<tr class="tr-shadow">
											<td>
												<%
													out.print(rs.getString(2));
												%>
											</td>

											<td>
												<%
													out.print(rs.getString(4));
												%>
											</td>
											<td>
												<%
													out.print(rs.getString(8));
												%>
											</td>
											<td>
												<%
													PreparedStatement ps3;

															ps3 = con.prepareStatement("Select COUNT(ID) from trainingEnrolled");
															ResultSet rs3 = ps3.executeQuery();
															while (rs3.next()) {
																out.print(rs3.getString(1));
															}
												%>

											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END DATA TABLE-->

			<!-- COPYRIGHT-->
			<section class="p-t-60 p-b-20">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p>Copyright © 2019 SACT. All rights reserved.</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END COPYRIGHT-->
		</div>
	</div>

	<%@ include file="jsScript.jsp" %>

	<script>
		$(document).ready(function() {
			$("#trainings").DataTable({
				paging : true
			});
			$("#assessments").DataTable({
				paging : true
			});
		});
	</script>
</body>
</html>

<%
	}else{
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>

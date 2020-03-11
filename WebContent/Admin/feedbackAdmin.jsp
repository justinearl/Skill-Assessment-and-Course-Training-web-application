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
							<h1 class="title-4">Feedback</h1>
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
								<table class="table table-data2" id="userSummary">
									<thead>
										<tr>
											<th>name</th>
											<th>subject</th>
											<th>feedback</th>
										</tr>
									</thead>
									<tbody>
										<%
											PreparedStatement ps;
												Class.forName("com.mysql.jdbc.Driver").newInstance();
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
												ps = con.prepareStatement("Select * from feedback");
												ResultSet rs = ps.executeQuery();
												while (rs.next()) {
										%>
										<tr class="tr-shadow">
											<td>
												<%
													int foo = Integer.parseInt(rs.getString(4));
															PreparedStatement ps1;

															ps1 = con.prepareStatement("Select * from feedback where uid =" + foo);
															ResultSet rs1 = ps1.executeQuery();
															rs1.next();
															out.print(rs1.getString(4));
												%>
											</td>

											<td>
												<%
													out.print(rs1.getString(2));
												%>
											</td>
											<td>
												<%
													out.print(rs.getString(3));
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
			$("#userSummary").DataTable({
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

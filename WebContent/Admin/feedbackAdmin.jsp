<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
										<c:forEach items="${feedback }"	var="message">
										<tr class="tr-shadow">
											<td>${message.name }</td>
											<td>${message.subject }</td>
											<td>${message.message }</td>
										</tr>
										</c:forEach>
										
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


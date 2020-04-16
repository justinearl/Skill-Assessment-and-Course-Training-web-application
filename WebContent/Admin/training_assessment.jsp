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
							<h1 class="title-4">Classes</h1>
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
											<th>Author</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${classList }" var="list">
										<tr class="tr-shadow">
											<td>${list.name }</td>
											<td>${list.subject }</td>
											<td>${list.author }</td>
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
											<th>Category</th>
											<th>Exam Type</th>
											<th>Set number</th>
											<th>Author</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${assessList }" var="aList">
										<tr class="tr-shadow">
											<td>${aList.category }</td>
											<td>${aList.examtype }</td>
											<td>${aList.set }</td>
											<td>${aList.author }</td>
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


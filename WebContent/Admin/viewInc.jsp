<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">


<%@ include file="head.jsp"%>


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
							<br>
							<h1 class="title-4">
								Welcome back <span>Admin!</span>
							</h1>

							<hr class="line-seprate">
						</div>
						<a href=<%=request.getContextPath() + "/Admin/Dashboard"%>>&nbsp;&nbsp;&nbsp;&nbsp;View Users</a>
					</div>
				</div>
			</section>
			<!-- END WELCOME-->

			<!-- STATISTIC-->
			<section class="statistic statistic2">

				<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<div class="statistic__item statistic__item--green">
								<h2 class="number" id="members">${incCount}</h2>
								<span class="desc">instructors</span>
								<div class="icon">
									<i class="zmdi zmdi-account-o"></i>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-3">
							<div class="statistic__item statistic__item--orange">
								<h2 class="number" id="assessment">${incPending }</h2>
								<span class="desc">Pending</span>
								<div class="icon">
									<i class="zmdi zmdi-badge-check"></i>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
			<!-- END STATISTIC-->



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
											<th>email</th>
											<th>Background</th>
											<th>date registered</th>
											<th>assessments created</th>
											<th>subjects created</th>
											<th>status</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
								<c:forEach items = '${userList}' var='data'>
										<tr class="tr-shadow">
											<td>${data.fname }</td>
											<td><span class="block-email">${data.email }</span></td>
											<td class="desc">${data.bio}</td>
											<td>${data.date }</td>
											<td>${data.aDone}</td>
											<td>${data.tDone}</td>
											<td id="stat"><span class="status--process">${data.status}</span></td>
											<td>
												<div class="table-data-feature">
													<button class="item deleteBtn" data-toggle="modal"
														data-target="#deleteModal"
														id="${data.id}">
														<i class="zmdi zmdi-delete"></i>
													</button>

												</div>
											</td>
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
		<a href="logs.jsp">Generate log Activity</a>
	</div>

	<!-- MODAL -->

	<div class="modal fade" tabindex="-1" role="dialog" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Accept as Instructor</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to accept this application??</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="goDelete">Yes</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id = "noBtn">No</button>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="jsScript.jsp"%>

	<script>
		$(document).ready(function() {
			statusCheck();

			var id = "";
			$('#userSummary').DataTable({
				paging : true
			});
			$(".deleteBtn").click(function() {
				id = this.id;
				console.log(id);
			});
			$("#goDelete").click(function() {
				
				$.post(
		                  '/Final/Admin/AcceptPending',
		                  	{
		                  		pendingId : id
		                  	}
		              ); 
				$("#noBtn").click();
			});
		});

		function statusCheck() {
			console.log("statusCheck()");
			$("span.status--process").each(function() {
				var stat = $(this).text();
				filter = "Pending"
				if (stat.indexOf(filter) > -1) {
					$(this).css('color', 'red');
				}
			});
		}
	</script>
</body>

</html>


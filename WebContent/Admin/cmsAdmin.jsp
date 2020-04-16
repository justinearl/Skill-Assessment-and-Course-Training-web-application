<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="imports.jsp"%>

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
							<br />
							<h1 class="title-4">Web Contents</h1>
							<div>
								<p>Current Logo</p>
								<img src="${logo }" class="logo" style="height: 50px" alt="SACT" /><br>
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#logoModal">Change Web Logo</button>
							</div>
							<br>
							<div>
								<p>Assessment</p>

								<br>
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#logoTrainings">Add Assessment Modules</button>
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
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form method="post"
							action="<%=request.getContextPath() + "/Admin/insertImage.jsp"%>"
							enctype="multipart/form-data">
							<div class="modal-body">

								<input type="file" id="myFile" accept="image/*"
									name="uploadFile">


							</div>
							<div class="modal-footer">
								<button type="submit" value="FileUpload" class="btn btn-primary"
									id="saveLogo">Save changes</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>


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


	<%@ include file="jsScript.jsp"%>
	<script>
      
      $("#saveLogo").click({
    	  $("#submitLogo").click();
      });
      $("#saveTraining").click({
    	  $("#submitTraining").click();
      });
    </script>
</body>
</html>

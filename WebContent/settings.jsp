<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

			<a class="nav-item nav-link active" id="nav-prof-tab"
				data-toggle="" href="profile.jsp" role="tab" aria-controls="nav-prof"
				aria-selected="true" style="color: rgb(26, 26, 26);" onMouseOver="this.style.color='pink'" onMouseOut="this.style.color='rgb(26, 26, 26)'">Profile</a> <a class="nav-item nav-link"
				id="nav-assess-tab" data-toggle="t" href="assessment.jsp" role="tab"
				aria-controls="nav-assess" aria-selected="false">Assessment</a> <a
				class="nav-item nav-link" id="nav-train-tab" data-toggle=""
				href="training.jsp" role="tab" aria-controls="nav-train" aria-selected="false">Training</a>
			<a class="nav-item nav-link" id="nav-help-tab" data-toggle=""
				href="settings.jsp" role="tab" aria-controls="nav-help" aria-selected="false" style="color: rgb(89, 197, 177);">Settings
				and About</a>

		</div>
	</nav>
	</div>

	<div class="container"
		style="display: flex; width: 100%; height: 100%; padding-left: 0px; margin-top: 64px;">
		<div
			style="border: 1px solid rgb(89, 197, 177); border-radius: 10px; width: 50%; padding: 20px;">
			<div style="display: flex; padding-right: 0px; margin-bottom: 5px; ">
				<h4 style="font-size: 20px; color: rgb(70, 70, 70);">Your
					Account</h4>
				<button type="button" class="btn btn-light"
					style="background-color: rgb(89, 197, 177); color: white;margin-left:56%;font-size: 13px;"
					id="editAcc">Edit Account</button>
				<button type="button" class="btn btn-light"
					style="display: none; margin-left: 41%;margin-right: 2px;font-size: 13px;"
					id="cancelChanges">Cancel</button>
				<button type="button" class="btn btn-light"
					style="display: none; background-color: rgb(89, 197, 177); color: white; font-size: 13px;"
					id="saveChanges">Save Changes</button>

			</div>
			<div style="display: flex">
				<div>
					<img src="avatar/default.png" class="userAvatar"
						style="width: 200px; height: 200px; margin-bottom: 10px;"><br>
					<button type="button" class="btn btn-light" id="changeAvatar"
						data-toggle="modal" data-target="#avatarModal"
						style="display: none; background-color: rgb(252, 232, 235); color: rgb(70, 70, 70); font-size: 13px; margin-left: auto; margin-right: auto;">Change
						Avatar</button>
				</div>
				<form style="margin-left: 20px; margin-top: 20px;" method="POST"
					action="editName">
					<div class="form-group">
						<input type="text" class="form-control editDetails" id="fName"
							placeholder="First name" value=<%=request.getAttribute("fname")%> disabled>
					</div>
					<div class="form-group">
						<input type="text" class="form-control editDetails" id="mName"
							placeholder="Middle name" value=<%=request.getAttribute("mname")%> disabled>
					</div>
					<div class="form-group">
						<input type="text" class="form-control editDetails" id="lName"
							placeholder="Last name" value=<%=request.getAttribute("lname")%> disabled>
					</div>
				</form>
			</div>
			<br>
			<form method="POST" action="editDetails">
				<div class="form-group">
					<input type="email" class="form-control editDetails" id="email"
						placeholder="Email Address" value=<%=request.getAttribute("email")%>
						disabled>
				</div>
				<div class="row">
					<div class="col" style="width: 90%;">
						<input type="password" class="form-control" placeholder="Password"
							id="changePassword" value="******" disabled>
					</div>
					<div class="col">
						<button type="button" class="btn btn-light" id="changePass"
							data-toggle="modal" data-target="#passwordModal"
							style="display: none; background-color: rgb(252, 232, 235); color: rgb(70, 70, 70); font-size: 13px; margin: auto;">Change
							Password</button>

					</div>
				</div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control editDetails" id="bsDegree"
						placeholder="Bachelor's Degree" value=<%=request.getAttribute("degree")%>
						disabled>
				</div>
				<div class="form-group">
					<input type="text" class="form-control editDetails" id="school"
						placeholder="School"
						value=<%=request.getAttribute("school")%> disabled>
				</div>
				<br>
				
				 <button
                type="submit"
                id="hiddenSave"
                class="btn btn-light"
                style="display:none; background-color:rgb(89,197,177); color: white;"
              >
                Sign in
              </button>
			</form>

		</div>
		<div style="width: 45%; height: 100%; margin-left:20px;">
                    <div style="background-color:  rgb(252,232,235); border-radius: 10px;padding:5px;">
                    <div style="width:100%; height: 45%;background-image: url(designs/mission.png); background-size:100%; background-repeat: no-repeat;"></div>
                </div>   <br>
                <div class="container" style="border:  solid 1px rgb(252,232,235); padding:5px; height: 70%;display:flex">
                    <div style="margin-left: 15px;width:50%; ">

                    <div style="width: 100%; height: 90%;background-image: url(designs/quote.png); background-size:90%; background-repeat: no-repeat;"></div>
                    </div>
                    <div style="border-radius: 10px; width: 50%; height: 90%; background-color: rgb(241,250,248); background-image: url(designs/createdby.png); background-size:90%; background-repeat: no-repeat; padding: "></div>
                </div>  
                       
                </div>

       
	</div>

	</div>


	<!-- MODALS -->



	<div class="modal fade bd-example-modal-lg" id="avatarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true" ">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content"
				style="background-color: rgb(241, 250, 248)">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CHOOSE YOUR
						AVATAR</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form  method="POST"
						action="changeavatar">
						<div style="display: flex; flex-flow: row wrap;">
						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava1"> <label class="form-check-label" for="ava1">

								<img src="avatar/1.png" style="width: 100px; height: 100px;">
							</label>
						</div>
						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava2"> <label class="form-check-label" for="ava2">

								<img src="avatar/2.png" style="width: 100px; height: 100px;">
							</label>
						</div>
						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava3"> <label class="form-check-label" for="ava3">

								<img src="avatar/3.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava4"> <label class="form-check-label" for="ava4">

								<img src="avatar/4.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava5"> <label class="form-check-label" for="ava5">

								<img src="avatar/5.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava6"> <label class="form-check-label" for="ava6">

								<img src="avatar/6.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava7"> <label class="form-check-label" for="ava7">

								<img src="avatar/7.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava8"> <label class="form-check-label" for="ava8">

								<img src="avatar/8.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava9"> <label class="form-check-label" for="ava9">

								<img src="avatar/9.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava10"> <label class="form-check-label" for="ava10">

								<img src="avatar/10.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava11"> <label class="form-check-label" for="ava11">

								<img src="avatar/11.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava12"> <label class="form-check-label" for="ava12">

								<img src="avatar/12.png" style="width: 100px; height: 100px;">
							</label>
						</div>

						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava13"> <label class="form-check-label" for="ava13">

								<img src="avatar/13.png" style="width: 100px; height: 100px;">
							</label>
						</div>
						<div class="form-check avatar">
							<input class="form-check-input" type="radio" name="avatar"
								id="ava14"> <label class="form-check-label" for="ava14">

								<img src="avatar/14.png" style="width: 100px; height: 100px;">
							</label>
						</div>
						</div>
						<br>
						<button type="submit" id="useAvatar" class="btn btn-light"
							style="background-color: rgb(89, 197, 177); color: white;">Use
							avatar</button>

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content"
				style="background-color: rgb(241, 250, 248)">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Change
						Password</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST" action="changePassword">

						<div class="form-group">
							<input type="password" class="form-control" id="editPass"
								placeholder="Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="editPass2"
								placeholder="Confirm Password">
						</div>
						<button type="submit" id="changePass" class="btn btn-light"
							style="display: none; background-color: rgb(89, 197, 177)">Save
							Password</button>

					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="savePass" class="btn btn-light"
						style="background-color: rgb(89, 197, 177)">Save Password</button>
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
			fillForm();
			$("#editAcc").click(editAcc);
			$("#saveChanges").click(validChanges);
			$("#savePass").click(savePass);
			$("#cancelChanges").click(cancel);
		});
		
		function fillForm(){
			var fname = $("#fName").val();
			var mname = $("#mName").val();
			var lname = $("#lName").val();
			var email = $("#email").val();
			var bsDegree = $("#bsDegree").val();
			var school = $("#school").val();
			
			if(fname == "null"){
				$("#fName").val("");
			}
			if(mname == "null"){
				$("#mName").val("");
			}
			if(lname == "null"){
				$("#lName").val("");
			}
			if(email == "null"){
				$("#email").val("");
			}
			if(bsDegree == "null"){
				$("#bsDegree").val("");
			}
			if(school == "null"){
				$("#school").val("");
			}
		}
		function savePass() {
			var pass = $("#editPass").val();
			var pass2 = $("#editPass2").val();

			if (pass == '' || pass == null) {
				alertify.error('Please enter your desired password.');
			} else if (pass2 == '' || pass2 == null) {
				alertify.error('Please confirm your desired password.');
			} else if (pass != pass2) {
				alertify.error('Passwords do not match.');
			} else {
				$("#changePassword").val(pass);
				$("#changePass").click();
			}
		}

		function updatePassword() {
			console.log("updatePassword()");
			//rest call, POST new password
		}
		function editAcc() {
			console.log("editAcc");
			$("#changeAvatar").css("display", "block");
			$("#changePass").css("display", "block");
			$("#saveChanges").css("display", "block");
			$("#cancelChanges").css("display", "block");
			$("#editAcc").css("display", "none");
			$(".editDetails").removeAttr("disabled");

		}
		
		function validChanges(){
			var fname = $("#fName").val();
			var mname = $("#mName").val();
			var lname = $("#lName").val();
			var email = $("#email").val();
			var bsDegree = $("#bsDegree").val();
			var school = $("#school").val();
			
			if (fname == "" || fname == null) {
		          alertify.error("Please enter your first name.");
		        } else if (mname == "" || mname == null) {
		          alertify.error("Please enter your middle name.");
		        } else if (lname == "" || lname == null) {
		          alertify.error("Please enter your last name.");
		        } else if (email == "" || email == null) {
		          alertify.error("Please enter your email address.");
		        } else if (bsDegree == "" || bsDegree == null) {
		          alertify.error("Please enter your desired password.");
		        } else if (school == "" || school == null) {
		          alertify.error("Please confirm your desired password.");
		        } else $("#hiddenSave").click();
		}
		function saveChanges() {
			$("#changeAvatar").css("display", "none");
			$("#cancelChanges").css("display", "none");
			$("#changePass").css("display", "none");
			$("#editAcc").css("display", "block");
			$("#saveChanges").css("display", "none");
			$(".editDetails").attr("disabled", "disabled");
		}
		function cancel(){
			$("#changeAvatar").css("display", "none");
			$("#cancelChanges").css("display", "none");
			$("#changePass").css("display", "none");
			$("#editAcc").css("display", "block");
			$("#saveChanges").css("display", "none");
			$(".editDetails").attr("disabled", "disabled");
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
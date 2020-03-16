<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="head.jsp"%>


<title>Sign up</title>
</head>
<body>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg" style="height: 100px;">
		<div style="padding: 30px; display: flex;">
			<h2 style="margin-top: 0px; color: white;">INSTRUCTOR SIGNUP</h2>
		</div>
	</section>
	<!-- breadcrumb start-->

	<div
		style="background-color: rgb(241, 250, 248); width: 100%; height: 100%; border-radius: 10px; padding: 30px; padding-left: 0px;">
		<div style="padding: 50px;">
			<form method="POST" action="/Final/SignUpInc" autocomplete="off">
				<div class="form-row">
					<div class="col">
						<input type="text" class="form-control" placeholder="First name"
							id="ifname" name="ifname" >
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="Middle name"
							id="imname" name="imname">
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="Last name"
							id="ilname" name="ilname">
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col">
						<input type="email" class="form-control"
							placeholder="Email Address" id="iemail" name="iemail">
					</div>
					<div class="col">
						<input type="text" class="form-control"
							placeholder="Contact Number" id="ino" name="ino">
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col">
						<input type="password" class="form-control" placeholder="Password"
							id="ipass" name="ipass">
					</div>
					<div class="col">
						<input type="password" class="form-control"
							placeholder="Confirm Password" id="icon" name="icon">
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col">
						<input type="text" class="form-control"
							placeholder="Highest Educational Attainment" id="iback" name="iback">
					</div>
				</div>
				<br>
				<br> <input type="submit" id="buttonSubmit" name="buttonSubmit"
					value="Register" style="display: none;">

			</form>
			<button type="button" class="btn btn-success" id="register">Register</button>
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
	<%@ include file="/Instructor/jsScriptUser.jsp"%>
	



	<script>
		alertify.defaults.transition = "slide";
		alertify.defaults.theme.ok = "btn btn-success";
		$(document).keypress(function(event) {
			if (event.which == '13') {
				event.preventDefault();
			}
		});

		$(document).ready(function() {
			$('#register').click(validate);
		});

		function validate() {
			var fname = $("#ifname").val();
			var lname = $("#ilname").val();
			var email = $("#iemail").val();
			var pass = $("#ipass").val();
			var pass2 = $("#icon").val();
			var ino = $("#ino").val();
			var iback = $("#iback").val();
			var pw = pass.length;

			if (fname == '' || fname == null) {
				alertify.error('Please enter your first name.');
			} else if (lname == '' || lname == null) {
				alertify.error('Please enter your last name.');
			} else if (email == '' || email == null) {
				alertify.error('Please enter your email address.');
			} else if (pass == '' || pass == null) {
				alertify.error('Please enter your desired password.');
			} else if (pw < 8) {
				alertify.error('Password must be at least 8 characters.');
			} else if (pass2 == '' || pass2 == null) {
				alertify.error('Please confirm your desired password.');
			} else if (pass != pass2) {
				alertify.error('Passwords do not match.');
			} else {

				$("#buttonSubmit").click();
			}
		}
	</script>

</body>
</html>
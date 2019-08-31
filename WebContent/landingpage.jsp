<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@ page session="true" %>
<%if(session.getAttribute("sessionID") == null) {%>
<html>
  <head>
    <link
      rel="stylesheet"
      href="libraries\bootstrap-4.0.0-dist\css\bootstrap.min.css"
    />
    <script src="libraries/jquery-3.4.1.min.js"></script>
    <script src="libraries/Chart.min.js"></script>
    <link
      href="libraries\alertifyjs/css/alertify.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="libraries\alertifyjs/css/themes/bootstrap.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="libraries\DataTables\DataTables-1.10.18\css\jquery.dataTables.css"
    />
    <link rel="stylesheet" type="text/css" href="SACTStyle.css" />
  </head>
  <body>
  <div id="headBar"><img src="images/test.png" class="logo"></div>
    <div
      class="tab-pane fade show active"
      id="nav-home"
      role="tabpanel"
      aria-labelledby="nav-home-tab"
    >
      <div style="display:flex">
        <div
          class="jumbotron jumbotron-fluid"
          style="width: 40%; background-color: white; padding-left: 20px; margin-top: 150px;"
        >
          <h1 class="display-4">Assess your skills.<br />Train yourself.</h1>
          <p class="lead">
            Elevate your skills by using this Skill Assessment and Course
            Training Web Application.
          </p>
          <button
            type="button"
            class="btn btn-light"
            data-toggle="modal"
            data-target="#loginModal"
            style="background-color:rgb(89,197,177)"
          >
            Log-in
          </button>
          <button
            type="button"
            class="btn btn-light"
            data-toggle="modal"
            data-target="#signupModal"
          >
            Sign-up
          </button>
          <%if(request.getAttribute("errorlogin")!= null) {%>
          <p><%out.print("Invalid Login");%></p>
          <%} %>
        </div>
        <div>
          <img src="images/home.jpg" style="width: 100%; margin-right:0" />
        </div>
      </div>
    </div>

    <!-- MODALS -->

    <div
      class="modal fade"
      id="loginModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="background-color: rgb(241,250,248)">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">LOG IN</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form method="POST" action="Login">
              <div class="form-group">
                <input
                  type="email"
                  class="form-control"
                  id="loginEmail"
                  placeholder="Email Address"
                  name="loginEmail"
                />
              </div>
              <div class="form-group">
                <input
                  type="password"
                  class="form-control"
                  id="loginPassword"
                  placeholder="Password"
                  name="loginPassword"
                />
              </div>
              <div class="form-check">
                <input
                  type="checkbox"
                  class="form-check-input"
                  id="dropdownCheck2"
                />
                <label class="form-check-label" for="dropdownCheck2">
                  Remember me
                </label>
              </div>
              <button
                type="submit"
                id="hiddenlogin"
                class="btn btn-light"
                style="display:none; background-color:rgb(89,197,177); color: white;"
              >
                Sign in
              </button>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="submit"
              id="login"
              class="btn btn-light"
              style="background-color:rgb(89,197,177); color: white;"
            >
              Sign in
            </button>
          </div>
        </div>
      </div>
    </div>

    <div
      class="modal fade"
      id="signupModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="background-color: rgb(241,250,248)">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">SIGNUP</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form method="POST" action="Signup">
              <div class="row">
                <div class="col">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="First name"
                    id="signupFname"
                    name="firstName"
                  />
                </div>
                <div class="col">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Last name"
                    id="signupLname"
                    name="lastName"
                  />
                </div>
              </div>
              <br />
              <div class="form-group">
                <input
                  type="email"
                  class="form-control"
                  id="signupEmail"
                  placeholder="Email Address"
                  name="signEmail"
                />
              </div>
              <div class="form-group">
                <input
                  type="password"
                  class="form-control"
                  id="signupPass"
                  placeholder="Password"
                  name="signPassword"
                />
              </div>
              <div class="form-group">
                <input
                  type="password"
                  class="form-control"
                  id="signupPass2"
                  placeholder="Confirm Password"
                />
              </div>
              <button
                type="submit"
                id="hiddenregister"
                class="btn btn-light"
                style="display:none;background-color:rgb(89,197,177)"
              >
                Register
              </button>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" id="register"class="btn btn-light"
              style="background-color:rgb(89,197,177); color: white">
		  Register
		</button>
          </div>
        </div>
      </div>
    </div>


<!-- Modal -->
<div class="modal fade" id="dataprivacyact" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Data Privacy Act</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align: justify">
        I, understand and agree that by providing my personal data or by clicking the applicable icon or button, am agreeing to the Privacy Notice and giving my full consent to <b>Skills Assessment and Course Training App (SACT)</b> and its affiliates as well as its partners and service providers, if any, to collect, store, access and/or process any personal data I may provide herein, such as but not limited to my name and email address, whether manually or
		electronically, for the period allowed under the applicable law and regulations, for the purposes of my
		access to the application. I acknowledge that the collection and processing of my personal data is necessary for such purposes. I am aware of my right to be informed, to access, to object, to erasure or blocking, to damages, to file a complaint, to rectify and to data portability, and I understand that there are procedures, conditions and exceptions to be complied with in order to exercise or invoke such rights.

      </div>
      <div class="modal-footer">
      <button
              type="submit"
              id="signup"
              class="btn btn-light"
              style="background-color:rgb(89,197,177); color: white;"
            >
              Yes, I agree.
            </button>
      </div>
    </div>
  </div>
</div>

    <script
      type="text/javascript"
      src="libraries\alertifyjs/alertify.min.js"
    ></script>

    <script>
      alertify.defaults.transition = "slide";
      alertify.defaults.theme.ok = "btn btn-success";

      $(document).ready(function() {
        $("#login").click(login);
        $("#register").click(signup);
        $("#signup").click(goRegister);
      });
		
      function goRegister(){
    	  $("#hiddenregister").click();
      }
      function signup() {
        console.log("signup()");
        var fname = $("#signupFname").val();
        var lname = $("#signupLname").val();
        var email = $("#signupEmail").val();
        var pass = $("#signupPass").val();
        var pass2 = $("#signupPass2").val();

        if (fname == "" || fname == null) {
          alertify.error("Please enter your first name.");
        } else if (lname == "" || lname == null) {
          alertify.error("Please enter your last name.");
        } else if (email == "" || email == null) {
          alertify.error("Please enter your email address.");
        } else if (pass == "" || pass == null) {
          alertify.error("Please enter your desired password.");
        } else if (pass2 == "" || pass2 == null) {
          alertify.error("Please confirm your desired password.");
        } else if (pass != pass2) {
          alertify.error("Passwords do not match.");
        } else {
        	$("#signupModal").modal('hide');
        	$("#dataprivacyact").modal('show');
        }
        
      }

      function postSignup() {
        console.log("postSignup()");
      }

      function login() {
        console.log("login()");
        var loginEmail = $("#loginEmail").val();
        var loginPassword = $("#loginPassword").val();
        if (loginEmail == "" || loginEmail == null) {
          alertify.error("Please enter your email address.");
        } else if (loginPassword == "" || loginPassword == null) {
          alertify.error("Please enter your password.");
        } else $("#hiddenlogin").click();
      }

      function getLogin() {
        console.log("getLogin()");
      }
    </script>

    <!-- SCRIPTS SRC -->
    <script src="libraries\jquery-3.4.1.slim.min.js"></script>
    <script src="libraries\popper.js-1.14.7\package\dist\popper.min.js"></script>
    <script src="libraries\bootstrap-4.0.0-dist\js\bootstrap.min.js"></script>
    <script
      type="text/javascript"
      charset="utf8"
      src="libraries\DataTables\DataTables-1.10.18\js\jquery.dataTables.js"
    ></script>
  </body>
</html>
<%}else {response.sendRedirect("profile.jsp");}%>
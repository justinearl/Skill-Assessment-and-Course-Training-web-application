<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page session="true"%>
    <%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>

<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SACT</title>
    <link rel="icon" href="icons/sact.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- alertify -->
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
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<%if(session.getAttribute("sessionID") == null) {%>
<%
PreparedStatement pse;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
pse = con.prepareStatement("Select * from User");
ResultSet rse = pse.executeQuery();
while (rse.next()) {
%>
	<p class="emailAdds" style="display: none;"><%out.print(rse.getString(2));%></p>
	<p class="passwords" style="display: none;"><%out.print(rse.getString(3));%></p>
<% }%>
    <!--::header part start::-->
    <header class="main_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand main_logo" href="index.jsp"> <img src="images/logo.png" style="height:60px;margin-bottom:10px" alt="logo"> </a>
                        <a class="navbar-brand single_page_logo" href="index.jsp"> <img src="img/footer_logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                            
                            </ul>
                        </div>
                        <a href="#" class="d-none d-sm-block btn_1 home_page_btn" data-toggle="modal" data-target="#loginModal">Log In</a>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!--::Header part end::-->

    <!--::banner part start::-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-5">
                    <div class="banner_img d-none d-lg-block">
                        <img src="img/banner_img.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h1>Assess your skills.
                                Train yourself.</h1>
                            <p>Elevate your skills by using this Skill Assessment and Course Training Web Application.</p>
                            <a href="assessment.jsp" class="btn_2" data-toggle="modal"
                            data-target="#signupModal">SIGN UP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <img src="img/animate_icon/Ellipse_7.png" alt="" class="feature_icon_1 custom-animation1">
        <img src="img/animate_icon/Ellipse_8.png" alt="" class="feature_icon_2 custom-animation2">
        <img src="img/animate_icon/Ellipse_1.png" alt="" class="feature_icon_3 custom-animation3">
        <img src="img/animate_icon/Ellipse_2.png" alt="" class="feature_icon_4 custom-animation4">
        <img src="img/animate_icon/Ellipse_3.png" alt="" class="feature_icon_5 custom-animation5">
        <img src="img/animate_icon/Ellipse_4.png" alt="" class="feature_icon_6 custom-animation6">
    </section>
    <!--::banner part start::-->

    <!--::use sasu part end::-->
    <section class="use_sasu padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src="img/icon/pricing_icon_2.png" alt="">
                            <h4>Career Advancement</h4>
                            <p>Ensure that you continue to be competent in your profession. Engage in an ongoing process and continue throughout your career. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src="img/icon/pricing_icon_2.png" alt="">
                            <h4>Self-Satisfaction</h4>
                            <p>Take learning at your own pace, focus on areas you are most interested in (or want to understand a bit better). </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_3.png" alt="">
                            <h4>Convenience and Flexibility</h4>
                            <p>Study at your convenience. Courses and assessments are always available online.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <img src="img/animate_icon/Ellipse_1.png" alt="" class="feature_icon_1 custom-animation1">
    </section>
    <!--::use sasu part end::-->

    <!--::about_us part start::-->
    <section class="about_us section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6 col-lg-5">
                    <div class="about_us_text">
                        <img src="img/icon/Icon_1.png" alt="">
                        <h2>Test Your Skills <br>
                            And Know Your Strength</h2>
                        <p>Choose from a variety of skill assessment tests we prepared for you.</p>
                        <a href="assessment.jsp" class="btn_2" data-toggle="modal"
                        data-target="#signupModal">sign up now</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="learning_img">
                        <img src="img/assess.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <img src="img/animate_icon/Ellipse_4.png" alt="" class="feature_icon_1 custom-animation1">
    </section>
    <!--::about_us part end::-->

    <!--::about_us part start::-->
    <section class="about_us right_time">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6 col-lg-6">
                    <div class="learning_img">
                        <img src="img/trainy.jpg" alt="">
                    </div>
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="about_us_text">
                        <img src="img/icon/Icon_2.png" alt="">
                        <h2>Boost Your Mind
                            and Train Your Skills</h2>
                        <p>Choose from a variety of training courses we prepared for you.</p>
                        <a href="training.jsp" class="btn_2" data-toggle="modal"
                        data-target="#signupModal">sign up now</a>
                    </div>
                </div>
            </div>
        </div>
        <img src="img/animate_icon/Ellipse_5.png" alt="" class="feature_icon_2 custom-animation2">
    </section>
    <!--::about_us part end::-->

    <!--::pricing part start::-->
    <section class="pricing_part section_padding home_page_pricing">
        
        <img src="img/animate_icon/Ellipse_2.png" alt="" class="feature_icon_2 custom-animation2">
    </section>
    <!--::pricing part end::-->


    <!--::footer_part start::-->
    <footer class="footer_part">
        <div class="container">
            <div class="row">
                <div class=" col-md-2 col-lg-4">
                    <div class="single_footer_part">
                        <a href="index.jsp" class="footer_logo_iner"> <img src="images/test.png" style="height: 75px"alt="#"> </a>
                        <p>Skills Assessment and Course Training Web Application
                        </p>
                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-6">
                    <div class="single_footer_part">
                        <h4>Our Mission</h4>
                      <p>SACT's mission is to inspire and develop people to achieve their goals - one person and one commitment to learning at a time. We enable users to determine their strengths and weaknesses. We aim to cultivate a world of better learners, thinkers, and problem solvers.</p>
                    </div>
                </div>
            
             
               
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-8">
                    <div class="copyright_text">
                        <p>
Copyright &copy;2019 All rights reserved.</p>

                    </div>
                </div>
                
            </div>
        </div>
    </footer>
    <!--::footer_part end::-->

     <!-- MODALS -->

     <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content" style="background-color: rgb(241,250,248)">
             <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLongTitle">LOG IN</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <form method="POST" action="Login.jsp" autocomplete="off" >
                     <div class="form-group">
                         <input type="email" class="form-control" id="loginEmail" name = "loginEmail"
                             placeholder="Email Address">
                     </div>
                     <div class="form-group">
                         <input type="password" class="form-control" id="loginPassword" name = "loginPassword"
                             placeholder="Password">
                     </div>
                     <div class="form-check">
                         <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                         <label class="form-check-label" for="dropdownCheck2">
                             Remember me
                         </label>
                     </div>
                     <button type="submit" id="hiddenlogin" class="btn btn-light" style="display:none; background-color:rgb(89,197,177); color: white;">Sign in</button>
             
                 </form>
             </div>
             <div class="modal-footer">
                 
                     <button type="submit" id="login" class="btn btn-light" style="background-color:rgb(59,48,141); color: white;">Sign in</button>
             </div>
         </div>
     </div>
 </div>

 <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content" style="background-color: rgb(241,250,248)">
             <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLongTitle">SIGN UP</h5>
                 <a href="isignup.jsp" style="margin-top: 2px;">&nbsp;(Sign up as instructor? Click here.)</a>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <form method="POST" action="signup.jsp" autocomplete="off">
                         <div class="row">
                                 <div class="col">
                                   <input type="text" class="form-control" placeholder="First name" id="signupFname" name="firstName">
                                 </div>
                                 <div class="col">
                                   <input type="text" class="form-control" placeholder="Last name" id="signupLname" name="lastName">
                                 </div>
                               </div>
                               <br>
                     <div class="form-group">
                         <input type="email" class="form-control" id="signupEmail" name="signEmail"
                             placeholder="Email Address">
                     </div>
                     <div class="form-group">
                         <input type="password" class="form-control" id="signupPass" name="signPassword"
                             placeholder="Password">
                     </div>
                     <div class="form-group">
                             <input type="password" class="form-control" id="signupPass2"
                                 placeholder="Confirm Password">
                     </div>
                     <button type="submit" id="hiddenregister" class="btn btn-light" style="display:none;background-color:rgb(89,197,177)">Register</button>
              
                 </form>
             </div>
             <div class="modal-footer">
                     <button type="submit" id="register" class="btn btn-light" style="background-color:rgb(59,48,141); color: white;">Register</button>
             </div>
         </div>
     </div>
 </div>

 
    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>

    <script type="text/javascript" src="libraries\alertifyjs\alertify.min.js"></script>
 
 <script>
     alertify.defaults.transition = "slide";
     alertify.defaults.theme.ok = "btn btn-success";
     $(document).keypress(
    		  function(event){
    		    if (event.which == '13') {
    		      event.preventDefault();
    		    }
    		});
 
 $(document).ready(function(){

         $("#login").click(login);
         $("#register").click(signup);
         $("#hiddenregister").click(function(){
           console.log("NACLICK!");
         })
 });

 function signup(){
        
         console.log("signup()");
         var fname = $("#signupFname").val();
         var lname = $("#signupLname").val();
         var email = $("#signupEmail").val();
         var pass = $("#signupPass").val();
         var pass2 = $("#signupPass2").val();
         var pw = pass.length;
         var match = false;
         var emailAdds = $(".emailAdds");
         var currEmail = "";
        for(var i=0;i<emailAdds.length;i++){
            currEmail = emailAdds[i].textContent;
            if (currEmail == email){
                match = true;
            }
        } 
         if (fname == '' || fname == null) {
             alertify.error('Please enter your first name.');
         } else if (lname == '' || lname == null) {
             alertify.error('Please enter your last name.');
         } else if (email == '' || email == null) {
             alertify.error('Please enter your email address.');
         } else if (pass == '' || pass == null) {
             alertify.error('Please enter your desired password.');
         } else if (pass2 == '' || pass2 == null) {
             alertify.error('Please confirm your desired password.');
         } else if (pass != pass2) {
             alertify.error('Passwords do not match.');
         } else if ( pw < 8 ) {
            alertify.error('Password must be at least 8 characters.');
         } else if (match == true){
             alertify.error('Email address already exists.');
         }else {
             alertify.success("Sign up successful!");
             $("#register").prop('disabled', 'true');
        	 setTimeout(function(){
        		 $("#hiddenregister").click();
        	 },2000);
        	 
        	 
        	 
         }
     }

     function postSignup(){
         console.log("postSignup()");
     }

     function login(){
         console.log("login()");
         var loginEmail = $("#loginEmail").val();
      	 var loginPassword = $("#loginPassword").val();
         if (loginEmail == '' || loginEmail == null) {
             alertify.error('Please enter your email address.');
         }
         else{
        	 if ((loginPassword == '' || loginPassword == null)) {
             	alertify.error('Please enter your password.');
          	 }
        	 else{
        		
          		var match = false;
             	var emailAdds = $(".emailAdds");
             	var passwords = $(".passwords");
             	var currEmail = "";
             	var currPw = "";
            	for(var i=0;i<emailAdds.length;i++){
                	currEmail = emailAdds[i].textContent;
                	currPw = passwords[i].textContent;
                	
                	if (currEmail == loginEmail){
                    	if (loginPassword == currPw ){
                    		match = true;
                    	}
                	}
         		}
            	
            	var adm = "admin@gmail.com";
				var adp = "admin";
				if ((adm == loginEmail) && adp == loginPassword){
        			match = true;
        		}
				console.log(match);
            	if (!(match) ){
            	 	alertify.error("Invalid login!");
             		} else $("#hiddenlogin").click();
          	 }
     	}
     }



     function getLogin(){
         console.log("getLogin()");

     }

 </script>

</body>

</html>
<%}else if(session.getAttribute("sessionID") == "admin"){
	response.sendRedirect("dashboard.jsp");
	}%>
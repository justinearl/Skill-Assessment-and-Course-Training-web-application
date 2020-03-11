<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SACT</title>
    <link rel="icon" href="../css/icons/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="../css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="../css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" type="text/css" href="../SACTStyle.css">
    <link rel="stylesheet" href="../css/style.css">
    <!-- alertify -->
    <link href="../libraries\alertifyjs/css/alertify.min.css" rel="stylesheet" type="text/css" />
    <!-- datatables -->
    <link rel="stylesheet" type="text/css" href="../libraries\DataTables\DataTables-1.10.18\css\jquery.dataTables.css">
    
<title>Sign up</title>
</head>
<body>
  <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg" style="height: 100px;">
        <div style="padding:30px; display: flex;">
           <h2 style="margin-top:0px; color:white;">INSTRUCTOR SIGNUP</h2>
        </div>
    </section>
    <!-- breadcrumb start-->

 <div style="background-color: rgb(241,250,248); width: 100%; height:100%; border-radius: 10px; padding: 30px; padding-left: 0px;">
 <div style="padding:50px;">
           <form method="POST" action="iattempt.jsp" autocomplete="off">
  <div class="form-row">
    <div class="col">
      <input type="text" class="form-control" placeholder="First name" id="ifname">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="Middle name" id="imname">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="Last name" id="ilname">
    </div>
  </div><br>
  <div class="form-row">
    <div class="col">
      <input type="email" class="form-control" placeholder="Email Address" id="iemail">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="Contact Number" id="ino">
    </div>
  </div><br>
  <div class="form-row">
    <div class="col">
      <input type="password" class="form-control" placeholder="Password" id="ipass">
    </div>
    <div class="col">
      <input type="password" class="form-control" placeholder="Confirm Password" id="icon">
    </div>
  </div><br>
  <div class="form-row">
    <div class="col">
      <input type="text" class="form-control" placeholder="Highest Educational Attainment" id="iback">
    </div>
  </div><br><br>
<input type="submit" id="buttonSubmit" name="buttonSubmit" value="Register" style="display:none;">

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
                        <P>
Copyright &copy;2019 All rights reserved.</P>,

                    </div>
                </div>
                
            </div>
        </div>
    </footer>
    <!-- jquery plugins here-->
<script src=<%=request.getContextPath() + "/js/jquery-1.12.1.min.js"%>></script>
<!-- chart js  -->
<script src=<%=request.getContextPath() + "/libraries/Chart.min.js"%>></script>
<!-- popper js -->
<script src=<%=request.getContextPath() + "/js/popper.min.js"%>></script>
<!-- bootstrap js -->
<script src=<%=request.getContextPath() + "/js/bootstrap.min.js"%>></script>
<!-- easing js -->
<script
	src=<%=request.getContextPath() + "/js/jquery.magnific-popup.js"%>></script>
<!-- swiper js -->
<script src=<%=request.getContextPath() + "/js/swiper.min.js"%>></script>
<!-- swiper js -->
<script src=<%=request.getContextPath() + "/js/masonry.pkgd.js"%>></script>
<!-- particles js -->
<script src=<%=request.getContextPath() + "/js/owl.carousel.min.js"%>></script>
<script
	src=<%=request.getContextPath() + "/js/jquery.nice-select.min.js"%>></script>
<!-- slick js -->
<script src=<%=request.getContextPath() + "/js/slick.min.js"%>></script>
<script src=<%=request.getContextPath() + "/js/jquery.counterup.min.js"%>></script>
<script src=<%=request.getContextPath() + "/js/waypoints.min.js"%>></script>
<script src=<%=request.getContextPath() + "/js/contact.js"%>></script>
<script src=<%=request.getContextPath() + "/js/jquery.ajaxchimp.min.js"%>></script>
<script src=<%=request.getContextPath() + "/js/jquery.form.js"%>></script>
<script src=<%=request.getContextPath() + "/js/jquery.validate.min.js"%>></script>
<script src=<%=request.getContextPath() + "/js/mail-script.js"%>></script>
<!-- custom js -->
<script src=<%=request.getContextPath() + "/js/custom.js"%>></script>
<script
	src=<%=request.getContextPath() + "/libraries/jquery-3.4.1.slim.min.js"%>></script>
<script type="text/javascript"
	src=<%=request.getContextPath() + "/libraries/alertifyjs/alertify.min.js"%>></script>
	
	
	
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
	  $('#register').click(validate); 
   });
   
   function validate(){
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
       } else if ( pw < 8 ) {
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
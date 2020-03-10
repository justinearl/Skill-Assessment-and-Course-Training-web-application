<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@ page session="true" %>
    <%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect("index.jsp");
}else {
	
	PreparedStatement psx;
	ResultSet rsx;
	String logoimg = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");

	psx = conx.prepareStatement("Select * from webcontent where webpart = ?");
	psx.setString(1, "logo1");
	rsx = psx.executeQuery();
	if(rsx.next()){
		logoimg = rsx.getString(5);
	}
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
    <!--::header part start::-->
    <header class="main_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand main_logo" href="home.jsp"> <img src="<%=rsx.getString(5) %>" style="height:50px" alt="logo"> </a>
                        <a class="navbar-brand single_page_logo" href="home.jsp"> <img src="img/footer_logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="home.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="profile1.jsp">My Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="assessment1.jsp">Assessments</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="training.jsp">Trainings</a>
                                </li>
                                
                
                                <li class="nav-item">
                                    <a class="nav-link" href="settings1.jsp">Settings</a>
                                </li>
                            </ul>
                        </div>
                        <a href="logout2.jsp" class="d-none d-sm-block btn_1 home_page_btn">Log Out</a>
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
                            <a href="assessment1.jsp" class="btn_2">START NOW</a>
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
                            <img src="img/icon/pricing_icon_4.png" alt="">
                            <h4>Self-Satisfaction</h4>
                            <p>Take learning at your own pace, focus on areas you are most interested in (or want to understand a bit better). </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src="img/icon/pricing_icon_1.png" alt="">
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
                        <a href="assessment1.jsp" class="btn_2">start now</a>
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
                        <a href="training1.jsp" class="btn_2">start now</a>
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
                        <a href="home.jsp" class="footer_logo_iner"> <img src="images/test.png" style="height: 75px"alt="#"> </a>
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
                        <P>
Copyright &copy;2019 All rights reserved.</P>
</P>
                    </div>
                </div>
                
            </div>
        </div>
    </footer>
    <!--::footer_part end::-->

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
</body>

</html>
<%}%>
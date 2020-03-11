<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@ page session="true" %>
    <%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<%@ include file="imports.jsp" %>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}else {
%>
<!doctype html>
<html lang="zxx">

<%@ include file="head.jsp" %>

<body>
    <%@ include file="header.jsp" %>

    <!--::banner part start::-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-5">
                    <div class="banner_img d-none d-lg-block">
                        <img src=<%=request.getContextPath()+ "/img/banner_img.png"%> alt="">
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
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_7.png"%> alt="" class="feature_icon_1 custom-animation1">
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_8.png"%> alt="" class="feature_icon_2 custom-animation2">
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_1.png"%> alt="" class="feature_icon_3 custom-animation3">
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_2.png"%> alt="" class="feature_icon_4 custom-animation4">
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_3.png"%> alt="" class="feature_icon_5 custom-animation5">
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_4.png"%> alt="" class="feature_icon_6 custom-animation6">
    </section>
    <!--::banner part start::-->

    <!--::use sasu part end::-->
    <section class="use_sasu padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src=<%=request.getContextPath()+ "/img/icon/pricing_icon_2.png"%> alt="">
                            <h4>Career Advancement</h4>
                            <p>Ensure that you continue to be competent in your profession. Engage in an ongoing process and continue throughout your career. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src=<%=request.getContextPath()+ "/img/icon/pricing_icon_4.png"%> alt="">
                            <h4>Self-Satisfaction</h4>
                            <p>Take learning at your own pace, focus on areas you are most interested in (or want to understand a bit better). </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature">
                        <div class="single_feature_part">
                            <img src=<%=request.getContextPath()+"/img/icon/pricing_icon_1.png" %> alt="">
                            <h4>Convenience and Flexibility</h4>
                            <p>Study at your convenience. Courses and assessments are always available online.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_1.png"%> alt="" class="feature_icon_1 custom-animation1">
    </section>
    <!--::use sasu part end::-->

    <!--::about_us part start::-->
    <section class="about_us section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6 col-lg-5">
                    <div class="about_us_text">
                        <img src=<%=request.getContextPath()+"/img/icon/Icon_1.png" %> alt="">
                        <h2>Test Your Skills <br>
                            And Know Your Strength</h2>
                        <p>Choose from a variety of skill assessment tests we prepared for you.</p>
                        <a href="assessment1.jsp" class="btn_2">start now</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="learning_img">
                        <img src=<%=request.getContextPath()+ "/img/assess.jpg"%> alt="">
                    </div>
                </div>
            </div>
        </div>
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_4.png"%> alt="" class="feature_icon_1 custom-animation1">
    </section>
    <!--::about_us part end::-->

    <!--::about_us part start::-->
    <section class="about_us right_time">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6 col-lg-6">
                    <div class="learning_img">
                        <img src=<%=request.getContextPath()+ "/img/trainy.jpg"%> alt="">
                    </div>
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="about_us_text">
                        <img src=<%=request.getContextPath()+ "/img/icon/Icon_2.png"%> alt="">
                        <h2>Boost Your Mind
                            and Train Your Skills</h2>
                        <p>Choose from a variety of training courses we prepared for you.</p>
                        <a href=<%=request.getContextPath()+ "/User/training1.jsp"%> class="btn_2">start now</a>
                    </div>
                </div>
            </div>
        </div>
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_5.png"%> alt="" class="feature_icon_2 custom-animation2">
    </section>
    <!--::about_us part end::-->

    <!--::pricing part start::-->
    <section class="pricing_part section_padding home_page_pricing">
        
        <img src=<%=request.getContextPath()+ "/img/animate_icon/Ellipse_2.png"%> alt="" class="feature_icon_2 custom-animation2">
    </section>
    <!--::pricing part end::-->


    <!--::footer_part start::-->
    <footer class="footer_part">
        <div class="container">
            <div class="row">
                <div class=" col-md-2 col-lg-4">
                    <div class="single_footer_part">
                        <a href=<%=request.getContextPath()+"/User/home.jsp" %> class="footer_logo_iner"> <img src=<%=request.getContextPath()+"/images/test.png" %> style="height: 75px"alt="#"> </a>
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

    <%@ include file="jsScriptUser.jsp" %>
</body>

</html>
<%}%>
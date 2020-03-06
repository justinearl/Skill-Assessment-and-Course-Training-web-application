<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@page import="java.io.IOException"%>
<%@ include file="imports.jsp" %>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect("index.jsp");
}else {
%>
<!doctype html>
<html lang="zxx">

<%@ include file="head.jsp" %>

<body>
   <%@ include file="header.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                            <h2>Assessments</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

   
    <div style="background-color: rgb(241,250,248); width: 100%; height:100%; border-radius: 10px; padding: 30px; padding-left: 0px;">
            <div class="container" style="padding:0px; padding-left: 60px; margin: 0px;">
                    <div class="container" style="display: flex; margin-left: 65%; margin-right: 0px;padding: 0px;">
                        <input type="text" id="myFilter" class="form-control" onkeyup="searchAssessment()" placeholder="Search.." style="width: 30%">
                        <select class="form-control form-control-sm" id="searchCategory" style="width: 18%; height: 40px;">
                                <option>By Course Title</option>
                                <option>By Course Category</option>
                        </select>
                    </div>
        
        <div class="container" style="display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px;">
                            <%
					PreparedStatement ps, trial;
					Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
					Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
					String id = (String) request.getSession().getAttribute("sessionID");
					ps = con.prepareStatement("Select * from assessmentList");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
									String attempt = "9";
									trial = con.prepareStatement("Select count (*) from assessmentCompleted where uid=? and assessCode =?");
									trial.setString(1, id);
									trial.setString(2, rs.getString(3));
									ResultSet ts = trial.executeQuery();
									
									ts.next();
									int tried = ts.getInt(1);
									if(tried == 2){
										attempt = "0";
									}else if(tried == 1){
										attempt = "1";
									}else if(tried == 0){
										attempt = "2";
									}else{
										attempt = "error";
									}
										
										%>              
                              <div class="card assess" style="width: 18rem; height: 330px!important;margin: 5px; margin-bottom: 10px">
                                    <img src="images/subjects/<%out.print(rs.getString(7));%>.jpg" class="card-img-top" alt="...">
                                    <div class="card-body" style="background-color: #f45b69;">
                                      <h4 class="card-title" style="color:white; font-size: 25px; border-bottom: 1px solid white;"><%out.print(rs.getString(2));%></h4>
                                      <p class="card-text" style="color: white;">Description: <%out.print(rs.getString(5));%></p>
                                      <h5 class="card-cat" style="color: white;">Category: <%out.print(rs.getString(4));%></h5>
                    
                                      <h6 id="<%out.print(attempt); %>" style="color: white;">Attempts Remaining: <%out.print(attempt); %></h6>
                                      <a href="<%out.print(rs.getString(6) + "?attempt=" + attempt);%>" id="<%out.print(attempt); %>" class="genric-btn primary circle proceed" style="background-color: #ebebeb; color: black; float: right;">PROCEED</a>
                                    
                                    </div>
                                  </div>
                                      <%}%>
                    
    </div>
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
</P>
                    </div>
                </div>
                
            </div>
        </div>
    </footer>
    <!--::footer_part end::-->
    
    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- chart js  -->
    <script src="libraries/Chart.min.js"></script>
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
    <script src="libraries\jquery-3.4.1.slim.min.js"></script>
    <script>
        
        $(document).ready(function(){
           getAttempt();
           
        });

       	function getAttempt(){
       		$(".proceed").each(function(){
       			var attempt = $(this).attr('id');
       			console.log("attempt" + attempt);
       			if(attempt == "0"){
       				$(this).css("display","none");
       				console.log("disabled");
       			}
       	
       		});
       		
       		
       	}
        function searchAssessment() {
            var input, filter, cards, cardContainer, h5, title, i, cat;
            input = $("#myFilter");
            filter = input.val().toUpperCase();
            cards = $(".card");
            cat = $("#searchCategory").val();
            if(cat == "By Course Title"){
                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h4.card-title");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            } else if(cat == "By Course Category"){
                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h5.card-cat");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>

</html>
<%}%>
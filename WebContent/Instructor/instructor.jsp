<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="imports.jsp" %>
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
                            <h2>My Classes</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <div class="tab-pane fade show" id="nav-prof" role="tabpanel" aria-labelledby="nav-prof-tab" style="padding-top:20px;">
        <div style="display:flex">
        <div class="container" id="userAbout" style="margin-right: 30px; margin-left: 30px; padding:25px 25px 25px 25px;background-color: rgb(127,174,242); width: 300px">
            <img src="avatar/6.png" class="userAvatar" style="width: 250px; height: 250px;">
            <h4 style="color: black; margin-top: 10px; margin-bottom: 0px; font-size:30px;" class="text-center"
                id="fullName">Juan Dela Cruz</h4>
            <p style="color: black" class="text-center" id="emailAdd">juandelacruz@email.com</p>
            <table class="table">
                <tbody style="color: black; font-size:12px;">
                    <tr class="rowAbout">
                        <td class="detailAbout">Bachelor's Degree</td>
                        <td id="bsCourse">BS in Computer Engineering</td>
                    </tr>
                    <tr class="rowAbout">
                        <td class="detailAbout">Master's Degree</td>
                        <td id="msCourse">None</td>
                    </tr>
                    <tr class="rowAbout">
                        <td class="detailAbout">School</td>
                        <td id="school">Polytechnic University of the Philippines</td>
                    </tr>
                </tbody>
            </table>
        </div>
    <div style="background-color: rgb(241,250,248); width: 80%; height:100%;  padding: 30px; padding-left: 0px;">
            <div class="container" style="padding:0px; margin: 0px;">
               
                <div class="container" style="display: flex; margin-left: 35px;padding: 0px;">
                    <button type="button" class="btn btn-secondary" style="width: 300px;" data-toggle="modal" data-target="#addClassModal">+ Add Class</button>
               
                    <div class="container" style="display: flex; margin-left: 50%; margin-right: 0px;padding: 0px;">
                        <input type="text" id="myFilter" class="form-control" onkeyup="searchAssessment()" placeholder="Search.." style="width: 42%">&nbsp;&nbsp;
                        <select class="form-control form-control-sm" id="searchCategory" style="width: 40%; height: 38px;">
                                <option>By Course Title</option>
                                <option>By Student Year</option>
                                <option>By Student Section</option>
                        </select>
                    </div>
                </div>
        
        <div class="container" style="display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px; padding-left: 30px;">
                        <div class="card assess" style="width: 300px!important;">
                                <img src="images/home.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <h4 class="card-title">Circuits</h4>
                                  <h5 class="card-text">5th Year</h5>
                                  <h5 class="card-cat">Section: 1</h5>
                                  <a href="#" class="btn btn-light proceed">Proceed</a>
                                </div>
                              </div>
                        
                              <div class="card assess" style="width: 300px!important;">
                                    <img src="images/home.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                      <h4 class="card-title">Programming</h4>
                                      <h5 class="card-text">2nd Year</h5>
                                      <h5 class="card-cat">Section: 3</h5>
                                      <a href="#" class="btn btn-light proceed">Proceed</a>
                                    </div>
                                  </div>
                                  <div class="card assess" style="width: 300px!important;">
                                        <img src="images/home.jpg" class="card-img-top" alt="...">
                                        <div class="card-body">
                                          <h4 class="card-title">Engineering Sciences</h4>
                                          <h5 class="card-text">1st Year</h5>
                                          <h5 class="card-cat">Section: 4</h5>
                                          <a href="#" class="btn btn-light proceed">Proceed</a>
                                        </div>
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

    <!-- MODALS -->
    <div class="modal fade" id="addClassModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 5%;">
          <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(59,19,176); border-radius: 0px;">
              <h5 class="modal-title" style="color: white;   margin: auto;">ADD NEW CLASS</h5>
              
            </div>
            <div class="modal-body">
              <form  method="post">
                  <label for="course">Class Name</label>
                
                  <input type=text class="form-control" id="cName" name="cName">
                  <label for="course">Class Description</label>
                
                  <input type=text class="form-control" id="cDesc" name="cDesc">
                  <br>
                  <label for="course">Class Year</label>
                  <select class="form-control" id="year">
                      <option>1st Year</option>
                      <option>2nd Year</option>
                      <option>3rd Year</option>
                      <option>4th Year</option>
                      <option>5th Year</option>
                    </select>
<br>
                    <label for="course">Class Section</label>
                  <select class="form-control" id="section">
                      <option>Section: 1</option>
                      <option>Section: 2</option>
                      <option>Section: 3</option>
                      <option>Section: 4</option>
                      <option>Section: 5</option>
                      <option>Section: 6</option>
                    </select>
                    <br>
                    <label for="key">Enrollment Key</label>
                    <input type="text" class="form-control" id="key" name="key"placeholder="Min. 8 characters - Max. 64 characters">
                    <input type="submit" value="Submit" id="classSubmit" hidden>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" id="closeModal" data-dismiss="modal">Close</button>
              <button  class="btn btn-primary"  id="saveClass">Save changes</button>
            </div>
            
          </div>
        </div>
      </div>
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
    <script src="js/jquery.min.js"></script>
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
    <script type="text/javascript" src="libraries/alertifyjs/alertify.min.js"></script>
    <script type="text/javascript" 
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
    <script>
    
    alertify.defaults.transition = "slide";
     alertify.defaults.theme.ok = "btn btn-success";
        $(document).ready(function(){
           $("#saveClass").click(checkClass);
          // $("").click(sendReq);
           
        });

        function sendReq(){
        	console.log("testthis");
        	
        	var name = $("#cName").val();
        	var desc = $("#cDesc").val();
        	var enKey = $("#key").val();
        	console.log("this");
        	$.post(
                'addClass.jsp',
                	{
                		cName: name,
                		cDesc: desc,
                		key: enKey
                	}
            ); 
        	console.log("nothis");
        }
        
        function checkClass(){
            console.log("clicked");
            
            var key = $("#key").val();
            console.log(key);
            console.log(key.length);
        if (key == '' || key == null) {
             alertify.error('Please enter an enrolment key.');
             console.log("aw");

         } else if (key.length <= 8 || key.length >= 64){
             console.log("nge");
             alertify.error('Invalid enrolment key.');
         } else {
        	 
        	 console.log("testthis");
         	
         	var name = $("#cName").val();
         	var desc = $("#cDesc").val();
         	var enKey = $("#key").val();
         	console.log("this");
         	$.post(
                 'addClass.jsp',
                 	{
                 		cName: name,
                 		cDesc: desc,
                 		key: enKey
                 	}
             ); 
         	console.log("nothis");
         	//$('#addClassModal').modal('hide');
         	$('#closeModal').click();
         }
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
            } else if(cat == "By Student Year"){
                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h5.card-text");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            } else if(cat == "By Student Section"){
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

</html>>
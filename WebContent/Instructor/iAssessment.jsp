
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

    <div class="tab-pane fade show" id="nav-prof" role="tabpanel" aria-labelledby="nav-prof-tab" style="padding-top:20px;">
        <div style="display:flex">
        <div class="container" id="userAbout" style="margin-right: 30px; margin-left: 30px; padding:25px 25px 25px 25px;background-color: rgb(127,174,242); width: 300px">
            <img src=<%=request.getContextPath() + "/avatar/6.png"%> class="userAvatar" style="width: 250px; height: 250px;">
            <h4 style="color: black; margin-top: 10px; margin-bottom: 0px; font-size:30px;" class="text-center"
                id="fullName">Juan Dela Cruz</h4>
            <p style="color: black" class="text-center" id="emailAdd">juandelacruz@email.com</p>
            <table class="table">
                <tbody style="color: black; font-size:12px;">
                    <tr class="rowAbout">
                        <td class="detailAbout">Total Assessments</td>
                        <td id="totalAssess">5</td>
                    </tr>
                    <tr class="rowAbout">
                        <td class="detailAbout">Total Students</td>
                        <td id="students">190</td>
                    </tr>
                </tbody>
            </table>
        </div>
    <div style="background-color: rgb(241,250,248); width: 80%; height:100%;  padding: 30px; padding-left: 0px;">
            <div class="container" style="padding:0px; margin: 0px;">
               
                <div class="container" style="display: flex; margin-left: 35px;padding: 0px;">
                    <button type="button" class="btn btn-secondary" style="width: 500px;" data-toggle="modal" data-target="#addAssessmentModal">+ Add Assessment</button>
               
                    <div class="container" style="display: flex; margin-left: 50%; margin-right: 0px;padding: 0px;">
                        <input type="text" id="myFilter" class="form-control" onkeyup="searchAssessment()" placeholder="Search.." style="width: 42%">&nbsp;&nbsp;
                        <select class="form-control form-control-sm" id="searchCategory" style="width: 40%; height: 38px;">
                                <option>By Assessment Title</option>
                                <option>By Subject Category</option>
                                <option>By Assessment Type</option>
                        </select>
                    </div>
                </div>
        
        <div class="container" style="display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px; padding-left: 30px;">
                        <div class="card assess" style="width: 300px!important;">
                                <img src=<%=request.getContextPath() +"/images/home.jpg" %> class="card-img-top" alt="...">
                                <div class="card-body">
                                  <h4 class="card-title">Resistance</h4>
                                  <h5 class="card-text">Subject: Circuits</h5>
                                      <h5 class="card-cat">Type: Activity</h5>
                                  <a href="#" class="btn btn-light proceed">View Assessment</a>
                                </div>
                              </div>
                        
                              <div class="card assess" style="width: 300px!important;">
                                <img src=<%=request.getContextPath() +"/images/home.jpg" %> class="card-img-top" alt="...">
                                <div class="card-body">
                                  <h4 class="card-title">Circuits Analysis</h4>
                                  <h5 class="card-text">Subject: Circuits</h5>
                                      <h5 class="card-cat">Type: Exam</h5>
                                  <a href="#" class="btn btn-light proceed">View Assessment</a>
                                </div>

                              </div> <div class="card assess" style="width: 300px!important;">
                                <img src=<%=request.getContextPath() +"/images/home.jpg" %> class="card-img-top" alt="...">
                                <div class="card-body">
                                  <h4 class="card-title">Passive or Active?</h4>
                                  <h5 class="card-text">Subject: Circuits</h5>
                                      <h5 class="card-cat">Type: Activity</h5>
                                  <a href="#" class="btn btn-light proceed">View Assessment</a>
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
    <div class="modal fade" id="addAssessmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 5%;">
          <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(59,19,176); border-radius: 0px;">
              <h5 class="modal-title" style="color: white;   margin: auto;">ADD NEW ASSESSMENT</h5>
              
            </div>
            <div class="modal-body">
              <form  method="post">
                  <label for="atitle">Assessment Title</label>
                  <input type=text class="form-control" id="atitle" name="atitle" placeholder="Ex. Circuit Analysis">

                  <label for="subject">Subject Category</label>
                  <select class="form-control" id="subject">
                    <option>Circuits</option>
                    <option>Electronics</option>
                    <option>Programming</option>
                    <option>Logic Circuits</option>
                    <option>General Engineering</option>
                    
                  </select>

                
                        <label for="assessType">Assessment Type</label>
                        <select class="form-control" id="assessType">
                            <option>Activity</option>
                            <option>Short Quiz</option>
                            <option>Examination</option>
                          </select>
                         <br>
                          
                         
                          
                 <div class="row">
                    <div class="col-md-4">
                        <label for="accessibility">Accessibility</label><br>
                         <label class="radio-inline">
                            <input type="radio" id="aPublic" name="accessibility" value="Public">Public
                          </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <label class="radio-inline">
                            <input type="radio" id="aPrivate" name="accessibility" value="Private">Private
                          </label>
                    </div>
                    <div class="col">
                        <div id="addKey" style="display:none">
                            <label for="key">Assessment Key</label>
                            <input type="text" class="form-control" id="key" name="key"placeholder="Min. 8 characters - Max. 64 characters">
                        </div>
                    </div>
                  </div>
                   <input type="submit" value="Submit" id="classSubmit" hidden>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" id="closeModal" data-dismiss="modal">Close</button>
              <button  class="btn btn-primary"  id="saveClass" href="newAssessment.html">Proceed</button>
            </div>
            
          </div>
        </div>
      </div>
  <%@ include file="jsScriptUser.jsp" %>
    
    <script>
    
    alertify.defaults.transition = "slide";
     alertify.defaults.theme.ok = "btn btn-success";
        $(document).ready(function(){
           $("#saveClass").click(checkClass);
          $("#aPrivate").click(function(){
              $("#addKey").css("display","block");
          });
          $("#aPublic").click(function(){
              $("#addKey").css("display","none");
          });
           
        });

        function checkClass(){
            var name = $("#atitle").val();
         	var desc = $("#assessType").val();
         	var key = $("#key").val();
            var subject = $("#subject").val();
            var value= $("input[name=accessibility]:checked").val();
            console.log(value+"VALUE");
        
        if (name == '' || name == null){
            alertify.error('Please enter an assessment title.');
        } else if (value == null){
            alertify.error('Please select assessment accessibility.');
        } else if (value == "Private"){
            if (key == '' || key == null) {
                alertify.error('Please enter an enrolment key.');
            } else if (key.length <= 8 || key.length >= 64){
                alertify.error('Invalid enrolment key!');
            }
         } else {
         	console.log("SAVE ASSESSMENT DETAILS");
         	$('#closeModal').click();
         }
        }
      
        function searchAssessment() {
            var input, filter, cards, cardContainer, h5, title, i, cat;
            input = $("#myFilter");
            filter = input.val().toUpperCase();
            cards = $(".card");
            cat = $("#searchCategory").val();
            if(cat == "By Assessment Title"){
                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h4.card-title");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            } else if(cat == "By Subject Category"){
                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h5.card-text");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            } else if(cat == "By Assessment Type"){
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
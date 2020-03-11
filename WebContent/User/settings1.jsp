<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page  language="java" import="java.security.MessageDigest"%>
    <%@ include file="imports.jsp" %>
<%
if(session.getAttribute("sessionID") == null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}else {
%>
<!doctype html>
<html lang="zxx">
<%@ include file="head.jsp" %>
<%
					PreparedStatement ps;
						String id = (String) request.getSession().getAttribute("sessionID");

						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");
						ps = con.prepareStatement("Select * from User where ID = ?");
						ps.setString(1, id);
						ResultSet rs = ps.executeQuery();
						String name = null;
						String name1 = null;
						String name2 = null;
						String email = null;
						String course = null;
						String school = null;
						String ava = null;
						if (!rs.next()) {
							out.print(id);
						} else {
							name = rs.getString(4);
							name1 = rs.getString(5);
							name2 = rs.getString(6);
							email = rs.getString(2);
							course = rs.getString(7);
							school = rs.getString(9);
							ava = rs.getString(15);
						}
				%>
<body>
  <%@ include file="header.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                            <h2>Settings and About</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    
    <div class="container"
		style="display: flex; width: 100%; height: 100%; padding-left: 0px; margin-top: 64px;">
		<div
			style="border: 1px solid rgb(244,74,64); width: 50%; padding: 20px;">
			<div style="display: flex; padding-right: 0px; margin-bottom: 5px; ">
				<h4 style="font-size: 20px; color: rgb(70, 70, 70);">Your
					Account</h4>
				<button type="button" class="btn btn-light"
					style="background-color: rgb(59,48,140); color: white;margin-left:60%;font-size: 13px;"
					id="editAcc">Edit Account</button>
				<button type="button" class="btn btn-light"
					style="display: none; margin-left: 47%;margin-right: 2px;font-size: 13px;"
					id="cancelChanges">Cancel</button>
				<button type="button" class="btn btn-light"
					style="display: none; background-color: rgb(244,74,64); color: white; font-size: 13px;"
					id="saveChanges">Save Changes</button>

			</div>
			<div style="display: flex">
				<div>
					<img src=<%=request.getContextPath()+"/avatar/1.png" %> class="userAvatar"
						style="width: 200px; height: 200px; margin-left: auto; margin-right: auto; margin-bottom: 10px;"><br>
					<button type="button" class="btn btn-light" id="changeAvatar"
						data-toggle="modal" data-target="#avatarModal"
						style="display: none; background-color: rgb(252, 232, 235); color: rgb(70, 70, 70); font-size: 13px; margin-left: auto; margin-right: auto;">Change
						Avatar</button>
				</div>
				
			</div>
			<br>
			<form method="POST" action="editDetails.jsp" autocomplete="off">
                    <div class="form-group">
                        
                            <input type="text" class="form-control editDetails" id="fName" name = "newFname"
                                 value="<%out.print(name);%>" placeholder="First name" disabled>
                        </div>
            
                        <div class="form-group">
                            <input type="text" class="form-control editDetails" id="mName" name = "newMname"
                                 value="<%out.print(name1);%>"  placeholder="Middle name" disabled>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control editDetails" id="lName" name = "newLname"
                                 value="<%out.print(name2);%>" placeholder="Last name" disabled>
                        </div>
				<div class="form-group">
					<input type="email" class="form-control editDetails" id="email" name = "newEmail"
						 value="<%out.print(email);%>" placeholder="Email Address"
						disabled>
				</div>
				<div class="form-group">
					<input type="text" class="form-control editDetails" id="bsDegree" name="newDegree"
						value="<%out.print(course);%>" placeholder="Bachelor's Degree"
						disabled>
				</div>
				<div class="form-group">
					<input type="text" class="form-control editDetails" id="school" name="newSchool"
						value="<%out.print(school);%>" placeholder="School"
						 disabled>
				</div>
				<br>
				
				 <button
                type="submit"
                id="hiddenSave"
                class="btn btn-light"
                style="display:none; background-color:rgb(89,197,177); color: white;"
              >
                Save
              </button>
			</form>

		</div>
        <div style="width: 45%; height: 100%; margin-left:20px;">
            <div style="margin-left: 15px;width:100%; ">
                <img src=<%=request.getContextPath()+"/img/about_img_1.png"%> style="width: 100%"><br><br>
                <h2 class="text-center">Send us your thoughts!</h2>
            </div>
                <div class="container" style=" padding:10px;">
                    <form  action="feedback.jsp" method="post" id="contactForm"
                    novalidate="novalidate">
                    <div class="row">
                            <div class="col-12">
                                    <div class="form-group">
                                      <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Enter Subject'" placeholder='Enter Subject'>
                                    </div>
                                  </div>
                      <div class="col-12">
                          
                        <div class="form-group">
        
                          <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"
                            placeholder='Enter Message'></textarea>
                        </div>
                      </div>
                     
                     
                    </div>
                    <div class="form-group mt-3">
                      <button type="submit" class="button btn_1" id="sendMsg" style="display:none">Send Message <i class="flaticon-right-arrow"></i> </button>
                    </div>
                  </form>
                  <button type="submit" class="button btn_1" id="sendM">Send Message <i class="flaticon-right-arrow"></i> </button>
                      
                </div>  
                    <div style="border-radius: 10px; width: 50%; height: 90%; background-color: rgb(241,250,248); background-image: url(designs/createdby.png); background-size:90%; background-repeat: no-repeat;"></div>
                
                       
                </div>

       
	</div>




    
     <!--::footer_part start::-->
     <footer class="footer_part">
        <div class="container">
            <div class="row">
                <div class=" col-md-2 col-lg-4">
                    <div class="single_footer_part">
                        <a href=<%=request.getContextPath()+ "/User/home.jsp"%> class="footer_logo_iner"> <img src="<%=request.getContextPath()+"/"+rsx.getString(5) %>" style="height: 75px"alt="#"> </a>
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

                    </div>
                </div>
                
            </div>
        </div>
    </footer>
    <!--::footer_part end::-->

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
                    action="changeavatar.jsp">
                    <div style="display: flex; flex-flow: row wrap;">
                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="1"
                            id="ava1"> <label class="form-check-label" for="ava1">

                            <img src=<%=request.getContextPath()+"/avatar/1.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>
                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="2"
                            id="ava2"> <label class="form-check-label" for="ava2">

                            <img src=<%=request.getContextPath()+"/avatar/2.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>
                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="3"
                            id="ava3"> <label class="form-check-label" for="ava3">

                            <img src=<%=request.getContextPath()+"/avatar/3.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="4"
                            id="ava4"> <label class="form-check-label" for="ava4">

                            <img src=<%=request.getContextPath()+"/avatar/4.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="5"
                            id="ava5"> <label class="form-check-label" for="ava5">

                            <img src=<%=request.getContextPath()+"/avatar/5.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="6"
                            id="ava6"> <label class="form-check-label" for="ava6">

                            <img src=<%=request.getContextPath()+"/avatar/6.png" %> style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="7"
                            id="ava7"> <label class="form-check-label" for="ava7">

                            <img src="avatar/7.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="8"
                            id="ava8"> <label class="form-check-label" for="ava8">

                            <img src="avatar/8.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="9"
                            id="ava9"> <label class="form-check-label" for="ava9">

                            <img src="avatar/9.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="10"
                            id="ava10"> <label class="form-check-label" for="ava10">

                            <img src="avatar/10.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="11"
                            id="ava11"> <label class="form-check-label" for="ava11">

                            <img src="avatar/11.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="12"
                            id="ava12"> <label class="form-check-label" for="ava12">

                            <img src="avatar/12.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>

                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="13"
                            id="ava13"> <label class="form-check-label" for="ava13">

                            <img src="avatar/13.png" style="width: 100px; height: 100px;">
                        </label>
                    </div>
                    <div class="form-check avatar">
                        <input class="form-check-input" type="radio" name="avatar" value="14"
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

    <p style="display:none" id="url"><%
    if(request.getParameter("message") != null)
    out.write(request.getParameter("message")); 
    %></p>
    <p style="display:none" id="editPro"><%
    if(request.getParameter("message") != null)
    out.write(request.getParameter("message")); 
    %></p>
 <%@ include file="jsScriptUser.jsp" %>

<script>
    alertify.defaults.transition = "slide";
    alertify.defaults.theme.ok = "btn btn-success";

    $(document).ready(function() {
        fillForm();
        $("#editAcc").click(editAcc);
        $("#saveChanges").click(validChanges);
        // $("#savePass").click(savePass);
        $("#cancelChanges").click(cancel);
        $("#sendM").click(feedback);
        notif();
    });

    function feedback(){
        var subject = $("#subject").val();
        var message = $("#message").val();

        if (subject == "" || subject == null) {
              alertify.error("Please enter your feedback subject.");
            } else if (message == "" || message == null) {
              alertify.error("Please enter your message.");
            } else $("#sendMsg").click();
    }
    
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
    // function savePass() {
    //     var pass = $("#editPass").val();
    //     var pass2 = $("#editPass2").val();

    //     if (pass == '' || pass == null) {
    //         alertify.error('Please enter your desired password.');
    //     } else if (pass2 == '' || pass2 == null) {
    //         alertify.error('Please confirm your desired password.');
    //     } else if (pass != pass2) {
    //         alertify.error('Passwords do not match.');
    //     } else {
    //         $("#changePassword").val(pass);
    //         $("#changePass").click();
    //     }
    // }

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

        if (bsDegree == "" || bsDegree == null) {
            $("#bsDegree").val("None");
        }
        if (school == "" || school == null) {
            $("#school").val("None");
        }
        if (fname == "" || fname == null) {
              alertify.error("Please enter your first name.");
            } else if (mname == "" || mname == null) {
              alertify.error("Please enter your middle name.");
            } else if (lname == "" || lname == null) {
              alertify.error("Please enter your last name.");
            } else if (email == "" || email == null) {
              alertify.error("Please enter your email address.");
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
    
    function notif(){
    	var message = $("#url").text();
    	if(message == "sent"){
    		alertify.success("Thank you for your feedback.");
    	}
    }
</script>

</body>

</html>
<%}%>
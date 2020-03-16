
<%@ include file="imports.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html lang="zxx">
<%@ include file="head.jsp"%>
<body>

	<%@ include file="iHeader.jsp"%>


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

	<div class="tab-pane fade show" id="nav-prof" role="tabpanel"
		aria-labelledby="nav-prof-tab" style="padding-top: 20px;">
		<div style="display: flex">
			<div class="container" id="userAbout"
				style="margin-right: 30px; margin-left: 30px; padding: 25px 25px 25px 25px; background-color: rgb(127, 174, 242); width: 300px">
				<img src="${photo}"
					class="userAvatar" style="width: 250px; height: 250px;">
				<h4
					style="color: black; margin-top: 10px; margin-bottom: 0px; font-size: 30px;"
					class="text-center" id="fullName">${name}</h4>
				<p style="color: black" class="text-center" id="emailAdd">${email}</p>
				<table class="table">
					<tbody style="color: black; font-size: 12px;">
						<tr class="rowAbout">
							<td class="detailAbout">Total Classes</td>
							<td id="totalClass">5</td>
						</tr>
						<tr class="rowAbout">
							<td class="detailAbout">Total Students</td>
							<td id="students">190</td>
						</tr>
					</tbody>
				</table>
			</div>
	<div
		style="background-color: rgb(241, 250, 248); width: 80%; height: 100%; padding: 30px; padding-left: 0px;">
		<div class="container" style="padding: 0px; margin: 0px;">

			<div class="container"
				style="display: flex; margin-left: 35px; padding: 0px;">
				<button type="button" class="btn btn-secondary"
					style="width: 300px;" data-toggle="modal"
					data-target="#addClassModal">+ Add Class</button>

				<div class="container"
					style="display: flex; margin-left: 50%; margin-right: 0px; padding: 0px;">
					<input type="text" id="myFilter" class="form-control"
						onkeyup="searchAssessment()" placeholder="Search.."
						style="width: 42%">&nbsp;&nbsp; <select
						class="form-control form-control-sm" id="searchCategory"
						style="width: 40%; height: 38px;">
						<option>By Course Title</option>
						<option>By Student Year</option>
						<option>By Student Section</option>
					</select>
				</div>
				</div>
			
			
		<div class="container" id="cardAppend"
			style="display: flex; flex-direction: row; flex-wrap: wrap; margin-top: 25px; padding-left: 30px;">

			<c:forEach items="${getClass}" var="lClass">
				<div class="card assess" style="width: 300px !important;">
					<img src="${lClass.img }" class="card-img-top" alt="...">
					<div class="card-body">
						<h4 class="card-title">${lClass.name}</h4>
						<h5 class="card-text">${lClass.subject }</h5>
						<h5 class="card-text">${lClass.year }</h5>
						<h5 class="card-cat">${lClass.section }</h5>
						<a href="${lClass.id }" class="btn btn-light proceed">Proceed</a>
					</div>
				</div>
			</c:forEach>

		</div>
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
						<P>Copyright &copy;2019 All rights reserved.</P>
						,

					</div>
				</div>

			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

	<!-- MODALS -->
	<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document"
			style="margin-top: 5%;">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: rgb(59, 19, 176); border-radius: 0px;">
					<h5 class="modal-title" style="color: white; margin: auto;">ADD
						NEW CLASS</h5>

				</div>
				<div class="modal-body">
					<form method="post" action="/Final/Instructor/AddClass">



						<div class="row">
							<div class="col">
								<label for="cName">Class Name</label> <input type=text
									class="form-control" id="cName" name="className"
									placeholder="Ex. Circuits 1">
							</div>
							<div class="col">
								<label for="subject">Subject Category</label> <select
									class="form-control" id="classSubject" name="classSubject">
									<option>Circuits</option>
									<option>Electronics</option>
									<option>Programming</option>
									<option>Logic Circuits</option>
									<option>General Engineering</option>

								</select>
							</div>
						</div>
						<br> <label for="cDesc">Class Description</label> <input
							type=text class="form-control" id="cDesc" name="classDescription"
							placeholder="Ex. Contains basic circuits lessons."> <br>

						<div class="row">
							<div class="col">
								<label for="course">Class Year</label> <select
									class="form-control" name="classYear" id="year">
									<option>1st Year</option>
									<option>2nd Year</option>
									<option>3rd Year</option>
									<option>4th Year</option>
									<option>5th Year</option>
								</select>
							</div>
							<div class="col">
								<label for="section">Class Section</label> <select
									class="form-control" name="classSection"id="section">
									<option>Section: 1</option>
									<option>Section: 2</option>
									<option>Section: 3</option>
									<option>Section: 4</option>
									<option>Section: 5</option>
									<option>Section: 6</option>
								</select>
							</div>
						</div>

						<br> <label for="key">Enrollment Key</label> <input
							type="text" class="form-control" id="key" name="enrollmentKey"
							placeholder="Min. 8 characters - Max. 64 characters"> 
							<input
							type="submit" value="Submit" id="classSubmit" hidden>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeModal"
						data-dismiss="modal">Close</button>
					<button class="btn btn-primary" id="saveClass">Save
						changes</button>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="jsScriptUser.jsp"%>
	<script>
    
    alertify.defaults.transition = "slide";
    alertify.defaults.theme.ok = "btn btn-success";
    let cardContent = document.getElementById("cardAppend");

        $(document).ready(function(){
           $("#saveClass").click(checkClass);
           
        });
        
        function checkClass(){
            var name = $("#cName").val();
         	var desc = $("#cDesc").val();
         	var key = $("#key").val();
         	
         	var element = document.getElementById("classSubject");
         	var subject = element.options[element.selectedIndex].value;
         	
         	console.log(element);
         	console.log(subject);
         	
            var year = $("#year").val();
            var section = $("#section").val();
        
        if (name == '' || name == null){
            alertify.error('Please enter a class name.');
        } else if (desc == '' || desc == null){
            alertify.error('Please enter a class description.');
        } else if (key == '' || key == null) {
             alertify.error('Please enter an enrolment key.');
         } else if (key.length <= 8 || key.length >= 64){
             alertify.error('Invalid enrolment key!');
         } else {
        	 console.log("test");
        	$('#classSubmit').click();
//         	console.log(subject);
//          	$.post(
//                  '/Final/Instructor/AddClass',
//                  	{
//                  		className : name,
//                  		classDescription: desc,
//                  		enrollmentKey: key,
//                  		classSubject: subject,
//                  		classYear: year,
//                  		classSection: section
//                  	}
//              ); 

//             createCard(subject, year, section, "51");
            
//             document.getElementById("cName").value = "";
//             document.getElementById("cDesc").value = "";
//             document.getElementById("key").value = "";
			
            
         	$('#closeModal').click();
         }
        }

        function createCard(subject, year, section, id) {
            let cardBox = document.createElement("div");
            cardBox.classList.add("card", "assess");
            cardBox.style.width = "300px !important";
            let cardImg = document.createElement("img");
            cardImg.classList.add("card-img-top");
            cardImg.src = "../images/subjects/prog.jpg";
            let cardBody = document.createElement("div");
            cardBody.classList.add("card-body");
            let cardTitle = document.createElement("h4");
            cardTitle.classList.add("card-title");

            let cardMid = document.createElement("h5");
            cardMid.classList.add("card-text");

            let cardCategory = document.createElement("h5");
            cardCategory.classList.add("card-cat");
            let cardButton = document.createElement("button");
            cardButton.classList.add("btn", "btn-light", "proceed");
            cardButton.innerHTML = "Proceed";
            cardButton.id = id;

            cardTitle.innerHTML = subject;
            cardMid.innerHTML = year;
            cardCategory.innerHTML = section;
            
            cardBody.appendChild(cardTitle);
            cardBody.appendChild(cardMid);
            cardBody.appendChild(cardCategory);
            cardBody.appendChild(cardButton);

            cardBox.appendChild(cardImg);
            cardBox.appendChild(cardBody);

            cardContent.appendChild(cardBox);
            
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

</html>
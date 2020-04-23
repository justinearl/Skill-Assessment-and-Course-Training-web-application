
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
				style="margin-right: 30px; margin-left: 30px; padding: 25px 25px 25px 25px; background-color: white; width: 300px">

				<button type="button" class="btn btn-secondary" style="width: 100%;"
					data-toggle="modal" id="aTab">Assessments</button>
				<button type="button" class="btn btn-secondary" style="width: 100%;"
					data-toggle="modal" id="bTab">Students</button>
				<button type="button" class="btn btn-secondary" style="width: 100%;"
					data-toggle="modal" id="cTab">Submissions</button>
			</div>

			<div
				style="background-color: rgb(241, 250, 248); width: 80%; height: 100%; padding: 30px; padding-left: 0px;">

					<div class="container" id="assessmentsTab">
						<div style="display: flex">
							<h3>Part 1</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div style="padding-top: 5px;">
								<label class="radio-inline"> <input type="radio"
									id="mc1" name="part1Type" value="mc" checked>Multiple
									Choice
								</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="radio-inline">
									<input type="radio" id="identi1" name="part1Type" value="id">Identification
								</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-lg-12">
								<table class="table table-bordered table-striped"
									id="part1Multi" style="display: block;"></table>
								<table class="table table-bordered table-striped"
									id="part1Identi" style="display: none;"></table>
							</div>
							<div class="col-md-12 col-lg-12">
								<button type="button" class="btn btn-info" id="create"
									data-toggle="modal" data-target="#exampleModalCenter">Publish
									Assessment</button>
							</div>
						</div>
					</div>
					
					<div class="container" id="studentsTab">
					</div>
					
					<div class="container" id="submissionTab">
					</div>
					
					
					
					
				

			</div>

		</div>
	</div>

	<!--::footer_part start::-->

	<!--Modal  -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Publish
						Assessment</h5>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to publish this assessment?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="exitButton">No, go back.</button>
					<button type="button" class="btn btn-primary" id="publish">Yes,
						proceed.</button>
				</div>
			</div>
		</div>
	</div>
	<!--Modal end  -->
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

	<%@ include file="jsScriptUser.jsp"%>
	<script>
	var url_string = window.location.href;
	var url = new URL(url_string);
	var classId = url.searchParams.get("classId");
		var mytable1 = document.getElementById("part1Multi");
		var mytable2 = document.getElementById("part1Identi");
		alertify.defaults.transition = "slide";
		alertify.defaults.theme.ok = "btn btn-success";
		let cardContent = document.getElementById("cardAppend");
		let showAssessDiv = document.getElementById("assessmentsTab");
		let showStudentDiv = document.getElementById("studentsTab");
		let showSubDiv = document.getElementById("submissionTab");

		$(document).ready(function() {
			$("#mc1").click(part1MC);
			$("#identi1").click(part1Id);
			$("#publish").click(publish);
			
			$("#aTab").click(showAssess);
			$("#bTab").click(showStud);
			$("#cTab").click(showSub);

		});
		
		function showAssess(){
			showAssessDiv.style.display = "block";
			showStudentDiv.style.display = "none";
			showSubDiv.style.display = "none";
		}
		function showStud(){
			showAssessDiv.style.display = "none";
			showStudentDiv.style.display = "block";
			showSubDiv.style.display = "none";
		}
		function showSub(){
			showAssessDiv.style.display = "none";
			showStudentDiv.style.display = "none";
			showSubDiv.style.display = "block";
		}
		

		function showData() {
			var data = $("#part1Multi").getTableData();
			var data2 = $("#part1Identi").getTableData();

			$("#data").text(data + "<br>" + data2);
		}

		function publish() {
			let qData = null;
			var data = null;
			        	var part1 = $("input[name='part1Type']:checked").val();
			     		if (part1 == "mc"){
			     			data = $("#part1Multi").getTableData();
			     			qData = JSON.stringify(data);
			     			qData = "{ \"saveThis\" : " + qData + "}";
			     			$.post('/Final/Instructor/SaveQuestion', 
			    					{
			    						questionJson : qData,
			    						pendingId : classId
			    					}
			    			);
			     		} else {
			     			data=$("#part1Identi").getTableData();
			     			qData = JSON.stringify(data);
			     			qData = "{ \"saveThis\" : " + qData + "}";
			     			$.post('/Final/Instructor/SaveQuestionIdent', 
			    					{
			    						questionJson : qData,
			    						pendingId : classId
			    					}
			    			);
			     		}
			     			
			     		
// 			var rLength = mytable1.rows.length;

// 			for (var i = 0; i < rLength - 2; i++) {
// 				var data = mytable1.rows.item(i + 2).cells;

// 				var q = data.item(1).getElementsByTagName("span")[0].innerText;
// 				var a = data.item(2).getElementsByTagName("span")[0].innerText;
// 				var b = data.item(3).getElementsByTagName("span")[0].innerText;
// 				var c = data.item(4).getElementsByTagName("span")[0].innerText;
// 				var d = data.item(5).getElementsByTagName("span")[0].innerText;
// 				var ans = data.item(6).getElementsByTagName("span")[0].innerText;
				
// 			}
			
			
			console.log("test"); 	
			$('#exitButton').click();
		}

		function part1MC() {
			$("#part1Multi").css("display", "block");
			$("#part1Identi").css("display", "none");
		}
		function part1Id() {
			$("#part1Identi").css("display", "block");
			$("#part1Multi").css("display", "none");
		}
		let jSon = null;
		
		$(function() {
			$.ajaxSetup({
				async : false
			});
			$.get('/Final/LoadAssessmentData', {
				pendingId : classId
			}, function(data) {
				jSon = JSON.parse(data);
			});
			$("#part1Multi")
					.dynamicTable(
							{
								columns : [ {
									text : "Question",
									key : "question"
								}, {
									text : "Choice A",
									key : "a"
								}, {
									text : "Choice B",
									key : "b"
								}, {
									text : "Choice C",
									key : "c"
								}, {
									text : "Choice D",
									key : "d"
								}, {
									text : "Correct Answer",
									key : "ans"
								}, ],
								data : jSon,
								getControl : function(columnKey) {
									if (columnKey == "ans") {
										return '<select class="form-control"><option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option></select>';
									}

									return '<input type="text" class="form-control" />';
								},
								buttons : {
									addButton : '<input type="button" value="Add" class="btn btn-primary create" /> ',
									cancelButton : '<input type="button" value="Cancel" class="btn btn-secondary create" />',
									deleteButton : '<input type="button" value="Delete" class="btn btn-danger create" />',
									editButton : '<input type="button" value="Edit" class="btn btn-warning create" />',
									saveButton : '<input type="button" value="Save" class="btn btn-success create" />',
								},
							});

		});
		
		let jSon2 = null;
		$(function() {
			$.ajaxSetup({
				async : false
			});
			$.get('/Final/LoadIdentification', {
				pendingId : classId
			}, function(data) {
				
				jSon2 = JSON.parse(data);
				
			});
			$("#part1Identi")
					.dynamicTable(
							{
								columns : [ {
									text : "Question",
									key : "question"
								}, {
									text : "Correct Answer",
									key : "ans"
								}, ],
								data : jSon2,
								getControl : function(columnKey) {

									return '<input type="text" class="form-control" />';
								},
								buttons : {
									addButton : '<input type="button" value="Add" class="btn btn-primary create" /> ',
									cancelButton : '<input type="button" value="Cancel" class="btn btn-secondary create" />',
									deleteButton : '<input type="button" value="Delete" class="btn btn-danger create" />',
									editButton : '<input type="button" value="Edit" class="btn btn-warning create" />',
									saveButton : '<input type="button" value="Save" class="btn btn-success create" />',
								},
							});

		});
	</script>
</body>

</html>
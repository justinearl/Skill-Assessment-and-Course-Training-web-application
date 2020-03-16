
<!doctype html>
<html lang="zxx">
    <%@ include file="head.jsp" %>
<body>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg" style="height: 100px; border-radius:0px;">
         
                    <div style="padding-top: 0px;height:100px;"class="breadcrumb_iner text-center">
                        <div style="padding-top: 0px;" class="breadcrumb_iner_item">
                            <h2 style="font-size:30px;	margin-top:0px;">Create Assessment</h2>
                        </div>
                    </div>
              
    </section>
    <!-- breadcrumb start-->
     
    <div style="background-color: rgb(241,250,248); width: 100%; height:100%;  padding: 30px;">
          
            
                    <div style="display: flex">
                    <h3>Part 1</h3>&nbsp;&nbsp;&nbsp;&nbsp;
                    <div style=" padding-top: 5px;">
                         <label class="radio-inline">
                            <input type="radio" id="mc1" name="part1Type" value="mc" checked>Multiple Choice
                          </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <label class="radio-inline">
                            <input type="radio" id="identi1" name="part1Type" value="id">Identification
                          </label>
                        </div>
                        
                    </div>
                    
                    
                 <div class="row">
                <div class="col-md-12 col-lg-12">
                    <table class="table table-bordered table-striped" id="part1Multi" style="display:block;"></table>
                    <table class="table table-bordered table-striped" id="part1Identi" style="display:none;"></table>
                </div>
                
                
                <div class="col-md-12 col-lg-12">
                <button type="button" class="btn btn-info" id="create" data-toggle="modal" data-target="#exampleModalCenter">Publish Assessment</button>
   
                  
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
    
   
      
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Publish Assessment</h5>
      </div>
      <div class="modal-body">
         <p>Are you sure you want to publish this assessment?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="exitButton">No, go back.</button>
        <button type="button" class="btn btn-primary" id="publish">Yes, proceed.</button>
      </div>
    </div>
  </div>
</div>

      <%@ include file="jsScriptUser.jsp" %>
    
    <script>
    var mytable1 = document.getElementById("part1Multi");
    var mytable2 = document.getElementById("part1Identi");
    alertify.defaults.transition = "slide";
     alertify.defaults.theme.ok = "btn btn-success";
        $(document).ready(function(){
        	$("#mc1").click(part1MC);
        	$("#identi1").click(part1Id);
        	$("#publish").click(publish);
           
        });

        
        function showData(){
        	var data = $("#part1Multi").getTableData();
        	var data2 = $("#part1Identi").getTableData();
        	
        	$("#data").text(data + "<br>" + data2);
        }

        function publish(){
//         	var part1 = $("input[name='part1Type']:checked").val();
//     		if (part1 == "mc"){
//     			var data = $("#part1Multi").getTableData();
//     		} else var data=$("#part1Identi").getTableData();
		
		var rLength = mytable1.rows.length;

		for(var i=0 ; i < rLength-2 ; i++){
			var data = mytable1.rows.item(i+2).cells;
		
			var q = data.item(1).getElementsByTagName("span")[0].innerText;
			var a = data.item(2).getElementsByTagName("span")[0].innerText;
			var b = data.item(3).getElementsByTagName("span")[0].innerText;
			var c = data.item(4).getElementsByTagName("span")[0].innerText;
			var d = data.item(5).getElementsByTagName("span")[0].innerText;
			var ans = data.item(6).getElementsByTagName("span")[0].innerText;
		}
		
    		
     		$.post('addQuestion.jsp',
     				{
     					question: q,
     					a: a,
     					b: b,
     					c: c,
     					d: d,
     					ans: ans
     				}
    				);
    		
     		$('#exitButton').click();
        }
        
        function part1MC(){
        	$("#part1Multi").css("display","block");
        	$("#part1Identi").css("display","none");
        }
        function part1Id(){
        	$("#part1Identi").css("display","block");
        	$("#part1Multi").css("display","none");
        }
        $(function () {
            $("#part1Multi").dynamicTable({
                columns: [{
                        text: "Question",
                        key: "question"
                    },
                    {
                        text: "Choice A",
                        key: "a"
                    },
                    {
                        text: "Choice B",
                        key: "b"
                    },
                    {
                        text: "Choice C",
                        key: "c"
                    },
                    {
                        text: "Choice D",
                        key: "d"
                    },
                    {
                        text: "Correct Answer",
                        key: "ans"
                    },
                ],
                data: [{
                        question: 'What is the unit of resistance?',
                        a: 'Ohm',
                        b: 'Ampere',
                        c: 'Volt',
                        d: 'Watt',
                        ans: 'A',
                    },
                ],
                getControl: function (columnKey) {
                    if (columnKey == "ans") {
                        return '<select class="form-control"><option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option></select>';
                    }

                    return '<input type="text" class="form-control" />';
                },
                buttons: {
                    addButton: '<input type="button" value="Add" class="btn btn-primary create" /> ',
                    cancelButton: '<input type="button" value="Cancel" class="btn btn-secondary create" />',
                    deleteButton: '<input type="button" value="Delete" class="btn btn-danger create" />',
                    editButton: '<input type="button" value="Edit" class="btn btn-warning create" />',
                    saveButton: '<input type="button" value="Save" class="btn btn-success create" />',
                  },
            });

           
            
          
        });
        
        $(function () {
            $("#part1Identi").dynamicTable({
                columns: [{
                        text: "Question",
                        key: "question"
                    },
                    {
                        text: "Correct Answer",
                        key: "ans"
                    },
                ],
                data: [{
                        question: 'What is the unit of resistance?',
                        ans: 'Ohm',
                    },
                ],
                getControl: function (columnKey) {

                    return '<input type="text" class="form-control" />';
                },
                buttons: {
                    addButton: '<input type="button" value="Add" class="btn btn-primary create" /> ',
                    cancelButton: '<input type="button" value="Cancel" class="btn btn-secondary create" />',
                    deleteButton: '<input type="button" value="Delete" class="btn btn-danger create" />',
                    editButton: '<input type="button" value="Edit" class="btn btn-warning create" />',
                    saveButton: '<input type="button" value="Save" class="btn btn-success create" />',
                  },
            });
            
          
        });
        
        //to get the array of data, use $("#myTable").getTableData();
       
    </script>
</body>

</html>
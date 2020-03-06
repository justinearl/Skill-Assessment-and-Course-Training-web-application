<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page language="java"
import="java.security.MessageDigest"%> <%@ page session="true" %> <%
response.setHeader("Pragma", "No-cache"); response.setHeader("Cache-Control",
"no-cache, no-store, must-revalidate"); response.setDateHeader("Expires", -1);
%> <% if(session.getAttribute("sessionID") == null){
response.sendRedirect("index.jsp"); }else { 
	String att = request.getParameter("attempt");
	
	if(att == null){
		response.sendRedirect("assessment1.jsp");
	}else{
		int checkAttempt = Integer.parseInt(att);
	if(!(checkAttempt > 0)){
		response.sendRedirect("assessment1.jsp");
	}
	}
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
      rel="stylesheet"
      href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />
    <link rel="stylesheet" href="libraries/bootstrap-4.0.0-dist/css/bootstrap.min.css" class="css">
    <title>Test #2</title>
    <style>

        * {
            font-family: "Montserrat";
        }

        body {
            background-color:white;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: black;
            font-family: "Concert One";
        }

        

        select {
            display: inline-block;
            margin-left: 20px;
            width: 100px;
            height: 258px;
            text-align: center;
            background-color: black;
            color: white;
            font-family: "Concert One";
            -webkit-appearance: none;
            appearance: none;
            padding-left: 30px;
            margin-top: 30px;
            border: 1px solid black;
        }

        select:focus {
            outline: none;
        }

        h3 {
            text-align: center;
            margin: 30px;
            color: black;
        }

       



        @media only screen and (max-width: 600px) {

            .container {
                margin: 20px auto;
                width: 500px;
            }

            select {
                width: 80px;
                height: 180px;
                padding-left: 20px;

            }
        }
        
        .blankresistor{
            
            vertical-align: center  ;
            position: absolute;
            z-index: -1;
            margin-left: 115px;
            width: 900px;
            
        }

        .btn-success {
            color: #fff;
            background-color: #e4a199!important;
            border-color: #e4a199!important;
            width: 250px;
            margin: 0px 30px;
            padding: 0;
            font-family: "Concert One";
            font-size: 24px;
        }

        .btn-success:hover {
            color: #fff;
            background-color: #218838;
            border-color: #e4a199!important;
        }

        .btn-success:focus, .btn-success.focus {
            box-shadow: none!important;
        }

        .btn-success.disabled, .btn-success:disabled {
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:not(:disabled):not(.disabled):active, .btn-success:not(:disabled):not(.disabled).active,
        .show > .btn-success.dropdown-toggle {
            color: #fff;
            background-color: #1e7e34;
            border-color: #1c7430;
        }

        .btn-success:not(:disabled):not(.disabled):active:focus, .btn-success:not(:disabled):not(.disabled).active:focus,
        .show > .btn-success.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
        }

        .btn-secondary {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
            width: 250px;
            padding: 0;
            font-family: "Concert One";
            font-size: 24px;
        }

        .btn-secondary:hover {
            color: #fff;
            background-color: #5a6268;
            border-color: #545b62;
        }

        .btn-secondary:focus, .btn-secondary.focus {
            box-shadow: none!important;
        }
        #message{
            font-size: 23px;
            margin-top: 6px;
            margin-bottom: 0;
            font-family: "Concert One";
        }

    </style>

</head>
<body>
<div class="container pt-5 text-center">
    <p style="font-family: 'Concert One'; font-size: 30px"> Directions: Assign a color for each color band of the resistor to make it 560 ohms with a tolerance of 5%.</p>
    <div class="container pt-5" >
        <img class="blankresistor d-block" src="images/blankresistor.png" alt="">
        <select name="" id="firstColumn">
            <option value="0" id="black">Black</option>
            <option value="90" id="white">White</option>
            <option value="0" id="gold">Gold</option>
            <option value="0" id="silver">Silver</option>
            <option value="10" id="brown">Brown</option>
            <option value="20" id="red">Red</option>
            <option value="60" id="blue">Blue</option>
            <option value="70" id="violet">Violet</option>
            <option value="80" id="grey">Grey</option>
            <option value="30" id="orange">Orange</option>
            <option value="40" id="yellow">Yellow</option>
            <option value="50" id="green">Green</option>
        </select>

        <select name=""  id="secondColumn">
            <option value="0" id="black">Black</option>
            <option value="5" id="green">Green</option>
            <option value="4" id="yellow">Yellow</option>
            <option value="3" id="orange">Orange</option>
            <option value="6" id="blue">Blue</option>
            <option value="7" id="violet">Violet</option>
            <option value="8" id="grey">Grey</option>
            <option value="2" id="red">Red</option>
            <option value="9" id="white">White</option>
            <option value="0" id="gold">Gold</option>
            <option value="1" id="brown">Brown</option>
            <option value="0" id="silver">Silver</option>
        </select>

        <select name=""  id="thirdColumn">
            <option value="1" id="black">Black</option>
            <option value="1000" id="orange">Orange</option>
            <option value="10000" id="yellow">Yellow</option>
            <option value="10" id="brown">Brown</option>
            <option value="100" id="red">Red</option>
            <option value="1.01" id="silver">Silver</option>
            <option value="0" id="grey">Grey</option>
            <option value="0" id="white">White</option>
            <option value="0.1" id="gold">Gold</option>
            <option value="100000" id="green">Green</option>
            <option value="1000000" id="blue">Blue</option>
            <option value="10000000" id="violet">Violet</option>
        </select>

        <select name="" id="fourthColumn">
            <option value="0" id="black">Black</option>
            <option value="1" id="brown">Brown</option>
            <option value="2" id="red">Red</option>
            <option value="0" id="orange">Orange</option>
            <option value="0" id="yellow">Yellow</option>
            <option value="5" id="green">Green</option>
            <option value="0.25" id="blue">Blue</option>
            <option value="0.1" id="violet">Violet</option>
            <option value="0.05" id="grey">Grey</option>
            <option value="0" id="white">White</option>
            <option value="5" id="gold">Gold</option>
            <option value="10" id="silver">Silver</option>
        </select>
    </div>
    <div class="container text-center pt-5">
        <button type="button" id="submit" class="btn btn-success " >
            Submit
        </button>
        <a href="#" type="button" id="next" class="btn btn-secondary ">
            Next
        </a>
    </div>
    
    <h3 id="message"></h3>
    
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var score = 0;
        $(document).ready(function(){
             $("#submit").click(test);
             $("#next").click(function(){
            	 $("#next").attr('href','storeAssess.jsp?asc=ASCT1003&sc='+score);
             });
        });
         function calculate(columnFirst, columnSecond, columnThird) {
             var columnFirst = document.getElementById('firstColumn').value;
             var columnSecond = document.getElementById('secondColumn').value;
             var columnThird = document.getElementById('thirdColumn').value;
             var columnFourth = document.getElementById('fourthColumn').value;
             var wynik;
     
             if (columnThird == 0) {
                 wynik = parseInt(columnFirst) + parseInt(columnSecond);
             } else {
                 wynik = (parseInt(columnFirst) + parseInt(columnSecond)) * parseInt(columnThird);
             }
             return wynik;
         }
     
         let select = document.querySelectorAll("select");
          function test(){
              $("#next").prop('disabled','false');
              $("#submit").prop('disabled','true');
             showResult();
                 check();
          }
     
         select.forEach(function (element,){
             element.addEventListener("change", function() {
                 // console.log(this)
                 let listOption = this.options[this.selectedIndex].id;
                 this.style.backgroundColor = listOption;
                 if (listOption === "black" || listOption === "blue") {
                     this.style.color = "white";
                 } else {
                     this.style.color = "black";
                 }
                
             });
         });
     
         function showResult() {
             let calculationResult = calculate();
             let columnFourth = document.getElementById('fourthColumn').value;
             let digitCount = calculationResult.toString().length;
             if (digitCount >= 4 && digitCount < 7) {
                 return  calculate() / 1000 + " kOhms and the tolerance is " + columnFourth + "%";
             } else if (digitCount >= 7 && digitCount <= 9) {
                 return calculate() / 1000000 + " MOhms and the tolerance is " + columnFourth + "%";
             } else {
                 return calculate() + " Ohms and the tolerance is " + columnFourth + "%";
             }
         }
        
         function check() {
     	
             var answer = "560 Ohms and the tolerance is 5%"
     
             if (showResult() === answer){
                $('#message').text('Correct!');
                score = 100;
             }
             else {
                 console.log(showResult());
                 $('#message').text("wrong!");
                 score = 0;
                
             }
         }
         
      
     
     </script>


</body>

</html>
<%}%>
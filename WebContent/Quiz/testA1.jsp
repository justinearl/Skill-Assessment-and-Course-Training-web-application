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
  <meta charset="utf-8">
  <title>Circuits I</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
 <style>
      .widget{
          border: 4px dashed #e4a199;
          padding: 20px;
          margin: auto;
          margin-top: 150px;
          display: none;
          text-align: center;
      }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "input[type=radio]" ).checkboxradio({
      icon: false
    });
  } );
  </script>
</head>
<body>
<div class="container">
    <div class="widget " id="ques1" style="display: block; ">
        <fieldset>
            <legend><b>Compute the resistance of the given circuit.</b></legend>
            <img src="circuits/1.png" height="200px"><br><br>
            <label for="q1a">2000 ohms</label>
            <input type="radio" name="q1" id="q1a" checked>
            <label for="q1b">1.5 ohms</label>
            <input type="radio" name="q1" id="q1b">
            <label for="q1c">738 ohms</label>
            <input type="radio" name="q1" id="q1c">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques2" >
        <fieldset>
            <legend><b>What is the value of the given resistor?</b></legend>
            <img src="circuits/2.jpg" height="150px"><br><br>
            Answer: <input type="text" id="q2" placeholder="ex. 10" style="margin-bottom: 20px"> ohms
            <br>
            <button type="button" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques3" >
        <fieldset>
            <legend><b>3 amps flow through a 1 ohm resistor. What is the voltage?</b></legend>
            <br><br>
            <label for="q3a">1V</label>
            <input type="radio" name="q3" id="q3a" checked>
            <label for="q3b">1/3V</label>
            <input type="radio" name="q3" id="q3b">
            <label for="q3c">3V</label>
            <input type="radio" name="q3" id="q3c">
            <label for="q3d">None of the above</label>
            <input type="radio" name="q3" id="q3d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques4" >
        <fieldset>
            <legend><b>It is the electrical size of a capacitor and the amount of charge per unit of voltage that a capacitor can store. </b></legend>
            <br><br>

            <label for="q4a">Capacitance</label>
            <input type="radio" name="q4" id="q4a" checked>
            <label for="q4b">Resistance</label>
            <input type="radio" name="q4" id="q4b">
            <label for="q4c">Inductance</label>
            <input type="radio" name="q4" id="q4c">
            <label for="q4d">Conductance</label>
            <input type="radio" name="q4" id="q4d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques5" >
        <fieldset>
            <legend><b>It is the reciprocal of resistance </b></legend>
            <br> <br>

            <label for="q5a">Capacitance</label>
            <input type="radio" name="q5" id="q5a" checked>
            <label for="q5b">Reactance</label>
            <input type="radio" name="q5" id="q5b">
            <label for="q5c">Conductance</label>
            <input type="radio" name="q5" id="q5c">
            <label for="q5d">Resistance</label>
            <input type="radio" name="q5" id="q5d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques6">
        <fieldset>
            <legend><b>What is the current through R1, R2, R3, and R4 in the following diagram?</b></legend>
            <img src="circuits/6.png" height="200px"><br><br>
            <label for="q6a">I<sub>1</sub> = 10A; I<sub>2</sub> = 53A; I<sub>3</sub> = 33A; I<sub>4</sub> = 25A; </label>
            <input type="radio" name="q6" id="q6a" checked>
            <label for="q6b">I<sub>1</sub> = 1A; I<sub>2</sub> = 5A; I<sub>3</sub> = 3.3A; I<sub>4</sub> = 2.5A;</label>
            <input type="radio" name="q6" id="q6b">
            <label for="q6c">I<sub>1</sub> = 0.25A; I<sub>2</sub> = 0.33A; I<sub>3</sub> = 0.5A; I<sub>4</sub> = 0.1A;</label>
            <input type="radio" name="q6" id="q6c">
            <label for="q6d">I<sub>1</sub> = 1A; I<sub>2</sub> = 0.5A; I<sub>3</sub> = 0.33A; I<sub>4</sub> = 0.25A;</label>
            <input type="radio" name="q6" id="q6d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques7" >
        <fieldset>
            <legend><b>Why do we say the "voltage across" or "the voltage with respect to?" Why can't we just say voltage? </b></legend>
            <br><br>

            <label for="q7a">Voltage is a measure of electric potential difference between two electrical points.</label>
            <input type="radio" name="q7" id="q7a" checked>
            <label for="q7b">It’s an electrical cliche.</label>
            <input type="radio" name="q7" id="q7b">
            <label for="q7c">The other point could be positive or negative.</label>
            <input type="radio" name="q7" id="q7c">
            <label for="q7d">None of the above.</label>
            <input type="radio" name="q7" id="q7d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>


    <div class="widget" id="ques8" >
        <fieldset>
            <legend><b>Two identical resistors are connected in series. The voltage across both of them is 250 volts. What is the voltage across each one? </b></legend>

            <label for="q8a">R<sub>1</sub> = 125V and R<sub>2</sub> = 125V</label>
            <input type="radio" name="q8" id="q8a" checked>
            <label for="q8b">R<sub>1</sub> = 250V and R<sub>2</sub> = 0V</label>
            <input type="radio" name="q8" id="q8b">
            <label for="q8c">R<sub>1</sub> = 150V and R<sub>2</sub> = 100V</label>
            <input type="radio" name="q8" id="q8c">
            <label for="q8d">R<sub>1</sub> = 200V and R<sub>2</sub> = 50V</label>
            <input type="radio" name="q8" id="q8d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques9" >
        <fieldset>
            <legend><b>What is the current through the battery based on the given circuit. </b></legend>
            <img src="circuits/17.JPG" height="200px"><br><br>
            <label for="q9a">3.3A</label>
            <input type="radio" name="q9" id="q9a" checked>
            <label for="q9b">1.0A</label>
            <input type="radio" name="q9" id="q9b">
            <label for="q9c">1.7A</label>
            <input type="radio" name="q9" id="q9c">
            <label for="q9d">2.2A</label>
            <input type="radio" name="q9" id="q9d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques10" >
        <fieldset>
            <legend><b>A resistor has 8 volts across it and 3 amps going through it. What is the power consumed? </b></legend>
            <br><br>
            <label for="q10a">24W</label>
            <input type="radio" name="q10" id="q10a" checked>
            <label for="q10b">8W</label>
            <input type="radio" name="q10" id="q10b">
            <label for="q10c">0W</label>
            <input type="radio" name="q10" id="q10c">
            <label for="q10d">2.2W</label>
            <input type="radio" name="q10" id="q10d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques11" >
        <fieldset>
            <legend><b>How does the current through the battery compare from when switch is open(I<sub>open</sub>) to when the switch is closed(I <sub>closed</sub>)
            </b></legend>
            <label for="q11a">I <sub>open</sub> is greater than I <sub>closed</sub> </label>
            <input type="radio" name="q11" id="q11a" checked>
            <label for="q11b">I <sub>open</sub> is less than I <sub>closed</sub></label>
            <input type="radio" name="q11" id="q11b">
            <label for="q11c">I <sub>open</sub> is equal to I <sub>closed</label>
            <input type="radio" name="q11" id="q11c">
            <label for="q11d">None of the above</label>
            <input type="radio" name="q11" id="q11d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques12" >
        <fieldset>
            <legend><b>It converts chemical energy into electrical energy</b></legend>
            <br><br>
            <label for="q12a">Power Supply</label>
            <input type="radio" name="q12" id="q12a" checked>
            <label for="q12b">Battery</label>
            <input type="radio" name="q12" id="q12b">
            <label for="q12c">Generator</label>
            <input type="radio" name="q12" id="q12c">
            <label for="q12d">Solar Cell</label>
            <input type="radio" name="q12" id="q12d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques13" >
        <fieldset>
            <legend><b>It is the driving force that tends to move the electrons.</b></legend>
            <br><br>
            <label for="q13a">Resistance (R)</label>
            <input type="radio" name="q13" id="q13a" checked>
            <label for="q13b">Current (I)</label>
            <input type="radio" name="q13" id="q13b">
            <label for="q13c">Voltage (V)</label>
            <input type="radio" name="q13" id="q13c">
            <label for="q13d">Power (P)</label>
            <input type="radio" name="q13" id="q13d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques14" >
        <fieldset>
            <legend><b>10.A 5 ohm and a 2 ohm resistor are connected in parallel. What is the total resistance?</b></legend>
            <br><br>
            <label for="q14a">10/7 ohms</label>
            <input type="radio" name="q14" id="q14a" checked>
            <label for="q14b">7/10 ohms</label>
            <input type="radio" name="q14" id="q14b">
            <label for="q14c">10/6 ohms</label>
            <input type="radio" name="q14" id="q14c">
            <label for="q14d">6/10 ohms</label>
            <input type="radio" name="q14" id="q14d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>



    <div class="widget" id="ques15" >
        <fieldset>
            <legend><b>An ammeter connected in series with three resistors reads an electric current of 2 A. What is the electric
                current flowing trough resistor R<sub>3</sub>?
            </b></legend>
            <img src="circuits/15.JPG" height="200px" width="900px"><br><br>
            <label for="q15a">1A</label>
            <input type="radio" name="q15" id="q15a" checked>
            <label for="q15b">2A</label>
            <input type="radio" name="q15" id="q15b">
            <label for="q15c">3A</label>
            <input type="radio" name="q15" id="q15c">
            <label for="q15d">4A</label>
            <input type="radio" name="q15" id="q15d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques16" >
        <fieldset>
            <legend><b>Three resistors: R<sub>1</sub> = 3 Ω,R<sub>2</sub> = 6 Ω, and R<sub>3</sub> = 9 Ω are connected in series to each other and to a
                36 V battery. What is the ammeter reading after the switch is closed?
            </b></legend>
            <img src="circuits/16.JPG" height="200px"><br><br>
            <label for="q16a">1A</label>
            <input type="radio" name="q16" id="q16a" checked>
            <label for="q16b">2A</label>
            <input type="radio" name="q16" id="q16b">
            <label for="q16c">3A</label>
            <input type="radio" name="q16" id="q16c">
            <label for="q16d">4A</label>
            <input type="radio" name="q16" id="q16d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques17" >
        <fieldset>
            <legend><b>What is the current I<sub>1</sub> flowing through resistor R<sub>1</sub>?
            </b></legend>
            <img src="circuits/17.JPG" height="200px"><br><br>
            <label for="q17a">4.5A</label>
            <input type="radio" name="q17" id="q17a" checked>
            <label for="q17b">12A</label>
            <input type="radio" name="q17" id="q17b">
            <label for="q17c">3.0A</label>
            <input type="radio" name="q17" id="q17c">
            <label for="q17d">1.5A</label>
            <input type="radio" name="q17" id="q17d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques18" >
        <fieldset>
            <legend><b>The opposing capacity of materials against the current flow is
            </b></legend>

            <label for="q18a">Resistance</label>
            <input type="radio" name="q18" id="q18a" checked>
            <label for="q18b">Capacitance</label>
            <input type="radio" name="q18" id="q18b">
            <label for="q18c">Conductance</label>
            <input type="radio" name="q18" id="q18c">
            <label for="q18d">Reactance</label>
            <input type="radio" name="q18" id="q18d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>

    <div class="widget" id="ques19" >
        <fieldset>
            <legend><b>The opposing capacity of materials against the current flow is
            </b></legend>

            <label for="q19a">Resistance</label>
            <input type="radio" name="q19" id="q19a" checked>
            <label for="q19b">Capacitance</label>
            <input type="radio" name="q19" id="q19b">
            <label for="q19c">Conductance</label>
            <input type="radio" name="q19" id="q19c">
            <label for="q19d">Reactance</label>
            <input type="radio" name="q19" id="q19d">
            <br>
            <button type="submit" class="btn btn-success submit">Submit</button>
            <button type="button" class="btn btn-secondary next" disabled>Next</button>

        </fieldset>

    </div>
    <div class="widget" id="ques20">
        <h1>You have answered all questions for easy round. You may proceed to the next round.</h1>
        <a href="storeAssess.jsp?asc=ASCT1002&sc=50">PROCEED</a>
    </div>
</div>

</body>

<script>
    var n = 1;
    $(document).ready(function(){
        $(".submit").click(submit);
        $(".next").click(next);
    });

    function submit(){
        $(".next").prop('disabled',false);
        
    }

    function next(){
        var prev = '#ques' + n + '';
        n+=1;
        var next = '#ques' + n + '';
        $(prev).css('display','none');
        $(next).css('display','block');
        $(".next").prop('disabled',true);
    }
</script>
</html>
<%}%>
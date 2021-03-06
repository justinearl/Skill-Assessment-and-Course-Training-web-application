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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Test #1</title>
    <link
      rel="stylesheet"
      href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />
    <link
      rel="stylesheet"
      href="libraries/bootstrap-4.0.0-dist/css/bootstrap.min.css"
    />
    <style>
      .container {
        overflow: hidden;
      }

      #passiveGrp,
      #activeGrp,
      #choices {
        list-style-type: none;
        margin: 0;
        float: left;
        margin-right: 10px;
        padding: 5px;
        width: 300px;
        border: 4px dashed #e4a199;
      }
      #passiveGrp li,
      #activeGrp li,
      #choices li {
        margin: 5px;
        padding: 5px;
        font-size: 1.2em;
        /*width: 120px;*/
      }
      .label {
        font-size: 23px;
        font-family: "Concert One";
      }

      .btn-success {
        color: #fff;
        background-color: #e4a199 !important;
        border-color: #e4a199 !important;
        width: 250px;
        margin: 0px 30px;
        padding: 0;
        font-family: "Concert One";
        font-size: 24px;
      }

      .btn-success:hover {
        color: #fff;
        background-color: #218838;
        border-color: #e4a199 !important;
      }

      .btn-success:focus,
      .btn-success.focus {
        box-shadow: none !important;
      }

      .btn-success.disabled,
      .btn-success:disabled {
        color: #fff;
        background-color: #28a745;
        border-color: #28a745;
      }

      .btn-success:not(:disabled):not(.disabled):active,
      .btn-success:not(:disabled):not(.disabled).active,
      .show > .btn-success.dropdown-toggle {
        color: #fff;
        background-color: #1e7e34;
        border-color: #1c7430;
      }

      .btn-success:not(:disabled):not(.disabled):active:focus,
      .btn-success:not(:disabled):not(.disabled).active:focus,
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

      .btn-secondary:focus,
      .btn-secondary.focus {
        box-shadow: none !important;
      }

      #message {
        font-size: 23px;
        margin-top: 6px;
        margin-bottom: 0;
        font-family: "Concert One";
      }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
      $(function() {
        $("ul.droptrue").sortable({
          connectWith: "ul"
        });

        $("ul.dropfalse").sortable({
          connectWith: "ul",
          dropOnEmpty: false
        });

        $("#passiveGrp, #activeGrp, #choices").disableSelection();
      });
    </script>
  </head>
  <body>
    <div class="container label" style=" margin-left: 229px">
      <p style=" margin-top: 8px!important; margin-bottom: 3px!important">
        DIRECTIONS: DRAG EACH COMPONENT TO ITS APPROPRIATE TYPE.
      </p>
    </div>
    <div
      class="container d-flex justify-content-around"
      style="margin-top: 1px!important"
    >
      <div class="d-flex align-items-center">
        <ul
          id="choices"
          class="droptrue text-center"
          style="height: 585px!important; margin: 5px 20px 0px 20px"
        >
          <p class="label" style=" padding-top: 0; margin-bottom: 0!important">
            COMPONENTS
          </p>
          <li class="passiveE">
            <img
              src="./images/passive/resistor.png"
              style="width: 200px; height: 40px;"
              alt=""
            />
          </li>
          <li class="passiveE">
            <img
              src="./images/passive/capacitor.png"
              style="width: 50px; height: 80px;"
              alt=""
            />
          </li>
          <li class="activeE">
            <img
              src="./images/active/transistor.png"
              style="width: 50px; height: 90px;"
              alt=""
            />
          </li>
          <li class="passiveE">
            <img
              src="./images/passive/ldr.png"
              style="width: 90px; height: 100px;"
              alt=""
            />
          </li>
          <li class="activeE">
            <img
              src="./images/active/diode.png"
              style="width: 200px; height: 40px;"
              alt=""
            />
          </li>
          <li class="activeE">
            <img
              src="./images/active/seven-segment.png"
              style="width: 90px; height: 90px;"
              alt=""
            />
          </li>
        </ul>
      </div>

      <div>
        <ul
          id="passiveGrp"
          class="droptrue text-center"
          style="height: 585px!important; margin: 5px 20px 0px 20px"
        >
          <p class="label" style=" padding-top: 0; margin-bottom: 0!important">
            PASSIVE
          </p>
        </ul>
      </div>

      <div>
        <ul
          id="activeGrp"
          class="droptrue text-center"
          style="height: 585px!important; margin: 5px 20px 0px 20px"
        >
          <p
            class="label"
            style=" padding-top: 0!important; margin-bottom: 0!important"
          >
            ACTIVE
          </p>
        </ul>
      </div>
      <br style="clear:both" />
    </div>
    <br />
    <div
      class="container text-center"
      style="display: flex; flex-direction: row; "
    >
      <button
        type="button"
        id="submit"
        class="btn btn-success btn-style"
        disabled
      >
        Submit
      </button>
      <a
        href="#"
        type="button"
        id="next"
        class="btn btn-secondary btn-style"
        style="display:none"
      >
        Next
      </a>

      <p id="message"></p>
    </div>

    <br />

    <script>
      $(document).ready(function() {
        console.log("ready");
        $("#submit").click(check);
        $("#next").click(next);
        $(".droptrue").on("sortreceive", function(event, ui) {
          if ($("#choices li").length == 0) {
            $("#submit").prop("disabled", false);
          }
          if ($("#choices li").length > 0) {
            $("#submit").prop("disabled", true);
          }
        });
      });
      var tScore = 0;
      function check() {
        console.log("check");
        var passive = $("#passiveGrp").find("li.passiveE").length;
        var active = $("#activeGrp").find("li.activeE").length;
        var total = passive + active;
        console.log(total);
        total = (total / 6) * 100;
        total = parseInt(total);
        console.log(total);
        tScore = total;
        var score = passive + active + " correct answer(s)!";
        if (total > 0) {
          if ($("#passiveGrp").find("li.passiveE").length == 3) {
            if ($("#activeGrp").find("li.activeE").length == 3) {
              $("#message").text("PERFECT! " + score);
            } else $("#message").text(score);
          } else $("#message").text(score);
        } else $("#message").text("No correct answer :(");

        $(".droptrue").sortable("disable");
        $("#submit").prop("disabled", true);
        $("#next").css("display", "block");
      }
      function next() {
        $("#next").attr("href", "storeAssess.jsp?asc=ASCT1001&sc=" + tScore);
        // window.location.href = "storeAssess.jsp?asc=ASCT1001&sc="+tScore;
      }
    </script>
  </body>
</html>
<%}%>

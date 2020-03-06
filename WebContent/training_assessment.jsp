<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page import="java.io.IOException"%> <%@page
import="java.sql.Connection"%> <%@page import="java.sql.DriverManager"%> <%@page
import="java.sql.PreparedStatement"%> <%@page import="java.sql.ResultSet"%> <%@
page session="true"%> <% response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1); %> <% if
(session.getAttribute("sessionID") == null) {
response.sendRedirect("index.jsp"); } else { %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="au theme template" />
    <meta name="author" content="Hau Nguyen" />
    <meta name="keywords" content="au theme template" />

    <!-- Title Page-->
    <title>SACT Admin</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all" />
    <link
      href="vendor/font-awesome-4.7/css/font-awesome.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/font-awesome-5/css/fontawesome-all.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/mdi-font/css/material-design-iconic-font.min.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Bootstrap CSS-->
    <link
      href="vendor/bootstrap-4.1/bootstrap.min.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Vendor CSS-->
    <link
      href="vendor/animsition/animsition.min.css"
      rel="stylesheet"
      media="all"
    />
    <link
      href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
      rel="stylesheet"
      media="all"
    />
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all" />
    <link
      href="vendor/css-hamburgers/hamburgers.min.css"
      rel="stylesheet"
      media="all"
    />
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all" />
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all" />
    <link
      href="vendor/perfect-scrollbar/perfect-scrollbar.css"
      rel="stylesheet"
      media="all"
    />

    <!-- Data Table CSS -->
    <link
      href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
      rel="stylesheet"
    />
    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all" />
  </head>

  <body>
    <div class="page-wrapper">
      <%@ include file="adminHeader.jsp" %>

      <!-- PAGE CONTENT-->
      <div class="page-content--bgf7">
        <!-- WELCOME-->
        <section class="welcome p-t-10">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <br />
                <h1 class="title-4">
                  Trainings
                </h1>
                <hr class="line-seprate" />
              </div>
            </div>
          </div>
        </section>
        <!-- END WELCOME-->

        <!-- DATA TABLE-->
        <section class="p-t-20">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="table-responsive table-responsive-data2">
                  <table class="table table-data2" id="trainings">
                    <thead>
                      <tr>
                        <th>Course Title</th>
                        <th>Course Category</th>
                        <th>Takers</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
												PreparedStatement ps1;
													Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
													Connection con1 = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
													ps1 = con1.prepareStatement("Select * from assessmentList");
													ResultSet rs1 = ps1.executeQuery();
													while (rs1.next()) {
											%>
                      <tr class="tr-shadow">
                        <td>
                           <%out.print(rs1.getString(2)); %>
                        </td>

                        <td>
                           <%out.print(rs1.getString(4)); %>
                        </td>
                        <td>
                          <%
                          PreparedStatement ps4;
							Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
							Connection con4 = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
							ps4 = con4.prepareStatement("Select COUNT(ID) from assessmentCompleted");
							ResultSet rs4 = ps4.executeQuery();
							while (rs4.next()) {
								out.print(rs4.getString(1));
							}
						%>
                        </td>
                      </tr>
                      <%} %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- END DATA TABLE-->
        <section class="welcome p-t-10">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <br />
                <h1 class="title-4">
                  Assessments
                </h1>
                <hr class="line-seprate" />
              </div>
            </div>
          </div>
        </section>

        <!-- DATA TABLE-->
        <section class="p-t-20">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="table-responsive table-responsive-data2">
                  <table class="table table-data2" id="assessments">
                    <thead>
                      <tr>
                        <th>Course Title</th>
                        <th>Course Category</th>
                        <th>Set number</th>
                        <th>Takers</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
												PreparedStatement ps;
													Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
													Connection con = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
													ps = con.prepareStatement("Select * from assessmentList");
													ResultSet rs = ps.executeQuery();
													while (rs.next()) {
											%>
                      <tr class="tr-shadow">
                        <td>
                          <%out.print(rs.getString(2)); %>
                        </td>

                        <td>
                          <%out.print(rs.getString(4)); %>
                        </td>
                        <td>
                          <%out.print(rs.getString(8)); %>
                        </td>
                        <td>
                          <%
                          PreparedStatement ps3;
							Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
							Connection con3 = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\Asus\\Documents\\OOP.accdb");
							ps3 = con3.prepareStatement("Select COUNT(ID) from trainingEnrolled");
							ResultSet rs3 = ps3.executeQuery();
							while (rs3.next()) {
								out.print(rs3.getString(1));
							}
						%>
                          
                        </td>
                      </tr>
                      <%} %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- END DATA TABLE-->

        <!-- COPYRIGHT-->
        <section class="p-t-60 p-b-20">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="copyright">
                  <p>Copyright © 2019 SACT. All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- END COPYRIGHT-->
      </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js"></script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js"></script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script
      type="text/javascript"
      charset="utf8"
      src="libraries\DataTables\datatables.min.js"
    ></script>

    <!-- Main JS-->
    <script src="js/main.js"></script>

    <script>
      $(document).ready(function() {
        $("#trainings").DataTable({
          paging: true
        });
        $("#assessments").DataTable({
          paging: true
        });
      });
    </script>
  </body>
</html>

<% } %>

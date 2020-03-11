<!-- HEADER DESKTOP-->


<%@ page import="java.sql.*"%>
<%
PreparedStatement psx;
ResultSet rsx;
String logoimgss = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conx = DriverManager.getConnection("jdbc:mysql://localhost:3306/sactapp", "root", "1234");

psx = conx.prepareStatement("Select * from webcontent where webpart = ?");
psx.setString(1, "logo1");
rsx = psx.executeQuery();
if(rsx.next()){
	logoimgss = rsx.getString(5);
}
%>
		<header class="header-desktop3 d-none d-lg-block"
			style="background-color: white">
			<div class="section__content section__content--p35"
				style="background-color: white">
				<div class="header3-wrap">
					<div class="header__logo">
						<a href="<%=request.getContextPath()+ "/Admin/dashboard.jsp"%>"> <img src="<%=request.getContextPath()+"/"+rsx.getString(5) %>" class="logo"
							style="height: 50px" alt="SACT" />
						</a>
					</div>
					<div class="header__navbar">
						<ul class="list-unstyled">
							<li class="has-sub"><a href="<%=request.getContextPath()+ "/Admin/dashboard.jsp"%>"> <i
									class="fas fa-tachometer-alt"></i>Dashboard <span
									class="bot-line"></span>
							</a></li>
							<li><a href="<%=request.getContextPath()+ "/Admin/training_assessment.jsp" %>"> <i class="fas fa-book"></i> <span
									class="bot-line"></span>Training and Assessments
							</a></li>
							<li><a href="<%=request.getContextPath()+ "/Admin/feedbackAdmin.jsp" %>"> <i class="fas fa-comment"></i> <span
								class="bot-line"></span>Feedback
						</a></li>
						<li><a href="<%=request.getContextPath()+ "/Admin/cmsAdmin.jsp"%>"> <i class="fas fa-edit"></i> <span
								class="bot-line"></span>CMS
						</a></li>
						

						</ul>
					</div>
					<div class="header__tool">


						<div class="account-wrap">
							<div
								class="account-item account-item--style2 clearfix js-item-menu">
								<div class="image">
									<img src=<%=request.getContextPath()+"/avatar/admin.jpg" %> alt="Admin" />
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#">Admin</a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<a href="#"> <img src=<%=request.getContextPath()+"/avatar/admin.jpg" %> alt="Admin" />
											</a>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="#">Admin</a>
											</h5>
											<span class="email">SACT Admin</span>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href=<%=request.getContextPath()+"/logout2.jsp"%>> <i class="zmdi zmdi-power"></i>Logout
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- END HEADER DESKTOP-->
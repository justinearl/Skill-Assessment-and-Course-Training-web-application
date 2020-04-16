<!-- HEADER DESKTOP-->


<%@ page import="java.sql.*"%>
<%@ page import="resources.dbConnection"%>
<%
PreparedStatement psx;
ResultSet rsx;
String logoimgss = null;

Connection conx = dbConnection.getConnection();

psx = conx.prepareStatement("Select * from webcontent where webpart = ?");
psx.setString(1, "logo1");
rsx = psx.executeQuery();
if(rsx.next()){
	logoimgss = rsx.getString("link");
}
%>
		<header class="header-desktop3 d-none d-lg-block"
			style="background-color: white">
			<div class="section__content section__content--p35"
				style="background-color: white">
				<div class="header3-wrap">
					<div class="header__logo">
						<a href="<%=request.getContextPath()+ "/Admin/Dashboard"%>"> <img src="<%=rsx.getString("link")%>" class="logo"
							style="height: 50px" alt="SACT" />
						</a>
					</div>
					<div class="header__navbar">
						<ul class="list-unstyled">
							<li class="has-sub"><a href="<%=request.getContextPath()+ "/Admin/Dashboard"%>"> <i
									class="fas fa-tachometer-alt"></i>Dashboard <span
									class="bot-line"></span>
							</a></li>
							<li><a href="<%=request.getContextPath()+ "/Admin/TrainAssess" %>"> <i class="fas fa-book"></i> <span
									class="bot-line"></span>Classes and Assessments
							</a></li>
							<li><a href="<%=request.getContextPath()+ "/Admin/Feedback" %>"> <i class="fas fa-comment"></i> <span
								class="bot-line"></span>Feedback
						</a></li>
						<li><a href="<%=request.getContextPath()+ "/Admin/ContentManagement"%>"> <i class="fas fa-edit"></i> <span
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
										<a href=<%=request.getContextPath()+"/Logout"%>> <i class="zmdi zmdi-power"></i>Logout
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
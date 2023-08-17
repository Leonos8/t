<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String userid=(String)session.getAttribute("LOGIN_USER");
	if(userid==null)
	{
    	response.sendRedirect("../login/LoginPage.jsp");
    	return; //the return is important; forces redirect to go now
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Summary Sales Report</title>
		
		<style>
			.reportText
			{
				text-align: left;
				font-size: 50px;
			}
			
			.homePageLogo
  			{
  				background-color: #0080fe
  				text-align: center;
  				font-size:50px;
  				cursor: pointer;
  				border: 2px solid black;
  				text-align: center;
  			}
		</style>
		
		<script>
			function goToHome()
			{
				location.replace("HomePage.jsp")
			}
		</script>
	</head>
	<body>
		<div class="homePageLogo">
			<a onclick=goToHome()>Online Auction</a>
		</div>
	
		<%
			userHandler.UserHandler uh=new userHandler.UserHandler();
		%>
	
		<div class="reportText">
			Summary Sales Report for <% out.println(uh.getTime()); %>
			<br><br>
			Total Earnings: $<% out.println(uh.getTotalEarnings()); %>
			<br>
			
		</div>
	</body>
</html>
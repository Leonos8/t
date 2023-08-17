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
		<title>Notifications</title>
		
		<style>
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
	
		<h1 style="text-align: center; font-size: 50px;">Messages</h1>
		<%
			userHandler.UserHandler uh=new userHandler.UserHandler();
	
			String user=(String)session.getAttribute("LOGIN_USER");
		
			java.util.ArrayList<Object[]> messages=uh.getNotifications(user);
			
			for(int i=0; i<messages.size(); i++)
			{
				%>
					<h2 style="text-align: center;"><% out.println(messages.get(i)[3]); %></h2>
					<div style="text-align: center; border: 2px solid black;">
						<% out.println(messages.get(i)[4]); %>
					</div>
				<%
			}
		%>
		
	</body>
</html>
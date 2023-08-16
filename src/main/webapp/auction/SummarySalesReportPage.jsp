<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		</style>
	</head>
	<body>
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
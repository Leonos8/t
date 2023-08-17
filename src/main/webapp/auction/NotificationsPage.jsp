<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Notifications</title>
	</head>
	<body>
	<%
		userHandler.UserHandler uh=new userHandler.UserHandler();
	
		String user=(String)session.getAttribute("LOGIN_USER");
	%>
		<div style="width: 100%;">
   			<div style="float:left; width: 80%;">
   			</div>
   			test
   			<div style="float:right;">
   			test22
   			</div>
		</div>
		<div style="clear:both"></div>
	</body>
</html>
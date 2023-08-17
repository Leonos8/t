<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String uname=request.getParameter("DAuname");
	String pword=request.getParameter("DApword");
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	boolean status=uh.deleteAccount(uname, pword);
	
	if(status)
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../login/LoginPage.jsp'" />
			</html>
		<%
	}
	else
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/ProfilePage.jsp'" />
			</html>
		<%
	}
%>
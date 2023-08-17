<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String uname=request.getParameter("uname");
	String pword=request.getParameter("psw");
	
	System.out.println("U="+uname);
	System.out.println("P="+pword);

	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	if(uh.loginAccount(uname, pword))
	{	
		session.setMaxInactiveInterval(3600); //3600 secs = 60 mins
		session.setAttribute("LOGIN_USER", uname);
		System.out.println("LPROCUser="+session.getAttribute("LOGIN_USER"));
		%>
		
		<html>
			<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
		</html>
		
		<%
	}
	else
	{
		%>
		
		<html>
			<meta http-equiv="Refresh" content="0; url='../login/LoginPage.jsp'" />
		</html>
		
		<%
	}
%>
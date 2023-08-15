<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String info=request.getParameter("submit");

	System.out.println(info);
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	if(info.equals("Reset Password"))
	{
		String currentUser=(String)session.getAttribute("LOGIN_USER");
		String uname=request.getParameter("RPuname");
		String pword=request.getParameter("RPpword");
		String cpword=request.getParameter("RPcpword");
		
		int status=uh.resetPassword(currentUser, uname, pword, cpword);
	}
%>
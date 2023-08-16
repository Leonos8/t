<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String currentUser=(String)session.getAttribute("LOGIN_USER");
	String uname=(String)request.getAttribute("uname");
	String pword=(String)request.getAttribute("pword");
	
	int bidID=(int)session.getAttribute("BID_SELECTED");
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	if(currentUser.equals(uname) && uh.verifyUser(uname, pword));
	{
		uh.deleteBid(bidID);
	}
	
%>

<html>
	<meta http-equiv="Refresh" content="0; url='../auction/ViewAuctionPage.jsp'" />
</html>
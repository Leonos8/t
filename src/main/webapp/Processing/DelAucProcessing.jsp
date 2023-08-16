<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	System.out.println("testing213");

	int auctID=(int)session.getAttribute("AUCTION_OPENED");
	
	String currentUser=(String)session.getAttribute("LOGIN_USER");
	String uname=(String)request.getParameter("uname");
	String pword=(String)request.getParameter("pword");
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	boolean status;
	
	System.out.println("CU"+currentUser);
	System.out.println("LU"+uname);
	System.out.println("VU"+uh.verifyUser(uname, pword));
	
	if(currentUser.equals(uname) && uh.verifyUser(uname, pword))
	{
		status=uh.deleteAuction(auctID);
	}
	else
	{
		status=false;
	}
	
	System.out.println(status);
	
	if(status)
	{
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
				<meta http-equiv="Refresh" content="0; url='../auction/ViewAuctionPage.jsp'" />
			</html>
		<%
	}
%>
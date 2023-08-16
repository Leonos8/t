<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String amountString=(String)request.getParameter("amount");
	String maxString=(String)request.getParameter("max");

	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	try
	{
		int aid=(int)session.getAttribute("AUCTION_OPENED");
		
		double amount=Double.parseDouble(amountString);
		double max=Double.parseDouble(maxString);
		
		boolean status=uh.createBid((String) session.getAttribute("LOGIN_USER"), aid, amount, max);
		
		if(status)
		{
			%>
				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/ViewAuctionPage.jsp'" />
				</html>
			<%
		}
		else
		{
			%>
				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewBidPage.jsp'" />
				</html>
			<%
		}
	}catch(NumberFormatException ex)
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/NewBidPage.jsp'" />
			</html>
		<%
	}
%>
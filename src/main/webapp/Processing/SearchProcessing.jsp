<%@page import="userHandler.UserHandler"%>
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

<%
	String search=request.getParameter("search");
	String itemType=request.getParameter("itemType");

	//System.out.println("Search="+search);
			
	String[] keywords=search.split("[ ]+");
			
	System.out.println(keywords.length);
	
	if(keywords.length>0 && !keywords[0].isBlank())
	{
		userHandler.UserHandler uh=new userHandler.UserHandler();
		
		java.util.ArrayList<String> users=uh.searchProfile(keywords);
				
		java.util.ArrayList<Object[]> auctions=uh.getAuctions(itemType, keywords);
		java.util.ArrayList<Object[]> items=uh.getItems(itemType, keywords);
		
		//System.out.println(items.get(0)[0]);
		%>
			<html>
				<head>
					<meta charset="ISO-8859-1">
					<title>Search Results</title>
					<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
					
					<style>
						.results
						{
							overflow: auto;
							height: 90%;
							width: 90%;
							font-size: 35px;
						}
				
						.search input[type=text] 
						{
  							float: right;
  							padding: 6px;
  							outline: 1px;
  							width: 50%;
  							margin-top: 8px;
  							margin-right: 25%;
  							font-size: 17px;
						}
			
						.searchButton 
						{
    						float: right;
    						display: block;
    						text-align: left;
    						width: 5%;
    						margin-right: 0;
    						margin-top: 8px;
    						padding: 8px;
  						}
  						
  						.itemTypeSelect
  						{
  							vertical-align: middle;
  							display-inline: block;
  							margin-right: 5%;
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
				
					<div class="search">
						<form action="../Processing/SearchProcessing.jsp">
      						<input type="text" placeholder="Search..." name="search">
      						<button type="submit" class=searchButton><i class="fa fa-search"></i></button>
    					
    						<div class="itemTypeSelect">
    							<select name="itemType" id="itemType">
									<option value="clothing">Clothing</option>
   	 								<option value="computers">Computers</option>
   	 								<option value="vehicles">Vehicles</option>
    								<option value="other">Other</option>
  								</select>
    						</div>
    					</form>
					</div>
			
					
				</body>
				<div class="results">
					<br><br>
					<%
						for(int i=0; i<users.size(); i++)
						{
							%>
								<a href="../auction/ProfilePage.jsp" onclick="<%session.setAttribute("PROFILE_USER", users.get(i));%>">
							<%
							out.println(users.get(i));
							%>
								</a>
								<br>
							<%
						}
					%>
					<%
						for(int i=0; i<auctions.size(); i++)
						{
							String link=String.valueOf(auctions.get(i)[0]);
							for(int j=1; j<items.get(i).length; j++)
							{
								link+=" "+items.get(i)[j];
							}
							
							Object[] itemInfo=uh.getItemInfo(items.get(i), (int)items.get(i)[1]);
							for(int j=1; j<itemInfo.length; j++)
							{
								link+=" "+itemInfo[j];
							}
							%>
								<a href="../auction/ViewAuctionPage.jsp" onclick="<%session.setAttribute("AUCTION_OPENED", auctions.get(i)[0]);%>">
							<%
							out.println(link);
							%>
								</a>
								<br>
							<%
						}
					%>
				</div>
			</html>
		<%
	}
	else
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
			</html>
		<%
	}
%>
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
		<title>View Auction</title>
		
		<style>
			.itemName
			{
				font-size: 50px;
				border-style: solid;
				word-wrap: break-word;
			}
			
			.newBidDiv
			{
				float: left;
				margin-top: 10px;
				margin-Left 10px;
			}
			
			.newBidButton
			{
				font-size: 25px;
								display: inline-block;
				
			}
			
			.deleteAuctionDiv
			{
				float: right;
				margin-top: 10px;
				margin-Left 10px;
			}
			
			.deleteAuctionButton
			{
				font-size: 25px;
			}
			
			.bidsDisplay
  			{
  				border-style: solid;
  				text-align: left;
  				overflow: auto;
  				margin-top:5%;
  				padding: 0px;
  				height: 400px;
  				word-wrap: break-word;
  				font-size: 25px;
  				text-align: center;
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
  			
  			table, td
  			{
  				border: 5px, solid, black;
  				width=100%;
  			}
  			
  			thead, tfoot 
  			{
  				background-color: #333;
  				color: #fff;
			}
			
  			#deleteBidPopup
			{
				margin: 0; 
				margin-left: 40%; 
				margin-right: 40%;
				margin-top: 50px; 
				padding-top: 10px; 
				width: 20%; 
				height: 150px; 
				position: absolute; 
				background: #FBFBF0; 
				border: solid #000000 2px; 
				z-index: 9; 
				font-family: arial; 
				visibility: hidden; 
			}
			
			#deleteAuctionPopup
			{
				margin: 0; 
				margin-left: 40%; 
				margin-right: 40%;
				margin-top: 50px; 
				padding-top: 10px; 
				width: 20%; 
				height: 150px; 
				position: absolute; 
				background: #FBFBF0; 
				border: solid #000000 2px; 
				z-index: 9; 
				font-family: arial; 
				visibility: hidden; 
			}
		</style>
		
		<script>
			function changeLink()
			{
				<% 
					int aid=(int)session.getAttribute("AUCTION_OPENED");
				
					userHandler.UserHandler uh=new userHandler.UserHandler();
				
					Object[] item=uh.getItem((int)session.getAttribute("AUCTION_OPENED"));
				
					String itemString=String.valueOf(session.getAttribute("AUCTION_OPENED"))+" ";
				
					for(int i=0; i<item.length-1; i++)
					{
						itemString+=item[i]+" ";
					}
				
					itemString+=item[item.length-1];
				%>
				var jsItem = "<%=itemString%>"
				
				window.history.replaceState({}, "", jsItem);
			}
			
			function deleteAuctionVerification(showhide)
			{
				if(showhide == "show")
				{
    				document.getElementById('deleteAuctionPopup').style.visibility="visible";
				}else if(showhide == "hide")
				{
    				document.getElementById('deleteAuctionPopup').style.visibility="hidden"; 
    				location.replace("ViewAuctionPage.jsp")
				}
			}
			
			function deleteBidVerification(showhide)
			{
				if(showhide == "show")
				{
    				document.getElementById('deleteBidPopup').style.visibility="visible";
				}else if(showhide == "hide")
				{
    				document.getElementById('deleteBidPopup').style.visibility="hidden"; 
    				location.replace("ViewAuctionPage.jsp")
				}
			}
		
			function goToHome()
			{
				location.replace("HomePage.jsp")
			}
		</script>
	</head>
	<body onload=changeLink()>
		<div class="homePageLogo">
			<a onclick=goToHome()>Online Auction</a>
		</div>
	
		<div class="itemName">
			<p><% out.println(itemString); %></p>
		</div>
		
		<div class="newBidDiv">
			<form action="NewBidPage.jsp">
				<button class="newBidButton">New Bid</button>
			</form>
		</div>
		
		<div class="deleteAuctionDiv">
			<form action="javascript:deleteAuctionVerification('show')">
				<button class="deleteAuctionButton">Delete Auction</button>
			</form>
		</div>
		
		<div id="deleteBidPopup"> 
			<form name="login" action="../Processing/DBProcessing.jsp" method="post">
				<center>Username:</center>
				<center><input name="uname" size="14" /></center>
				<center>Password:</center>
				<center><input name="pword" type="password" size="14" /></center>
				<center><input type="submit" name="submit" value="Verify" /></center>
			</form>
			<br/>
			<center><a href="javascript:deleteBidVerification('hide');">close</a></center> 
		</div> 
		
		<div id="deleteAuctionPopup"> 
			<form name="da" action="../Processing/DelAucProcessing.jsp" method="post">
				<center>Username:</center>
				<center><input name="uname" size="14" /></center>
				<center>Password:</center>
				<center><input name="pword" type="password" size="14" /></center>
				<center><input type="submit" name="submit" value="Verify" /></center>
			</form>
			<br/>
			<center><a href="javascript:deleteAuctionVerification('hide');">close</a></center> 
		</div> 
		
		<div class="bidsDisplay">
			<table style="width: 100%; border: 2px solid black;">
  				<thead>
    				<tr>
      					<th colspan="4">Bids</th>
    				</tr>
  				</thead>
  				<tbody>
    				<tr>
      					<td>BidID</td>
      					<td>Amount</td>
      					<td>Created By</td>
      					<td>Date Created</td>
    				</tr>
    				
    				<%
    					java.util.ArrayList<Object[]> bids=uh.getBids(aid);
    					String currentUser=(String) session.getAttribute("LOGIN_USER");
    					
    					for(int i=bids.size()-1; i>=0; i--)
    					{
    						if((boolean)bids.get(i)[6])
    						{
    							if(uh.isCustomerRep(currentUser)
        								|| uh.isAdmin(currentUser))
        						{
        							%>
    									<tr>
    										<td onclick="javascript:deleteBidVerification('show')" onclick="<% session.setAttribute("BID_SELECTED", bids.get(i)[1]); %>"><% out.println(bids.get(i)[1]); %></td>
    										<td onclick="javascript:deleteBidVerification('show')" onclick="<% session.setAttribute("BID_SELECTED", bids.get(i)[1]); %>"><% out.println(bids.get(i)[2]); %></td>
    										<td onclick="javascript:deleteBidVerification('show')" onclick="<% session.setAttribute("BID_SELECTED", bids.get(i)[1]); %>"><% out.println(bids.get(i)[4]); %></td>
    										<td onclick="javascript:deleteBidVerification('show')" onclick="<% session.setAttribute("BID_SELECTED", bids.get(i)[1]); %>"><% out.println(bids.get(i)[5]); %></td>
    									</tr>
    								<%
        						}
        						else
        						{
        							%>
        								<tr>
        									<td><% out.println(bids.get(i)[1]); %></td>
        									<td><% out.println(bids.get(i)[2]); %></td>
        									<td><% out.println(bids.get(i)[4]); %></td>
        									<td><% out.println(bids.get(i)[5]); %></td>
        								</tr>
        							<%
        						}
    						}
    					}
    				%>
  				</tbody>
			</table>
		</div>
	</body>
</html>
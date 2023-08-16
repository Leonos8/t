<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		
		</script>
	</head>
	<body onload=changeLink()>
		<div class="itemName">
			<p><% out.println(itemString); %></p>
		</div>
		
		<div class="newBidDiv">
			<form action="NewBidPage.jsp">
				<button class="newBidButton">New Bid</button>
			</form>
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
    				
    					for(int i=bids.size()-1; i>0; i--)
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
    				%>
  				</tbody>
			</table>
		</div>
	</body>
</html>
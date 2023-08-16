<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>New Bid</title>
		
		<style>
			.itemName
			{
				font-size: 50px;
				border-style: solid;
				word-wrap: break-word;
			}
			
			.container 
			{
  				padding: 16px;
			}
			
			input[type=text], input[type=password] 
			{
  				width: 100%;
  				padding: 12px 20px;
  				margin: 8px 0;
  				display: inline-block;
  				border: 1px solid #ccc;
  				box-sizing: border-box;
			}

			button 
			{
  				background-color: #1B7CED;
  				color: white;
  				padding: 14px 20px;
  				margin: 8px 0;
  				border: none;
  				cursor: pointer;
  				width: 10%;
  				font-size: 16px;
			}

			button:hover 
			{
  				opacity: 0.8;
			}
			
			.backButton 
  			{
  				float: right;
     			width: 100%;
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
	<body onload="changeLink()">
		<div class="itemName">
			<p><% out.println(itemString); %></p>
		</div>
		
		<form action="../Processing/NBProcessing.jsp">
			<div class="container">
				<label for="amount"><b>Amount:</b></label>
    			<input type="text" placeholder="Enter amount" name="amount" required>
    			
    			<label for="max"><b>Max Amount:</b></label>
    			<input type="text" placeholder="Enter max amount" name="max" required>
        		
        		<p>
        			<button class="submit" type="submit">Create Bid</button>
        			
        			<div>
        				<a class="backButton" href="ViewAuctionPage.jsp">Back</a>
        			</div>
    			</p>
			</div>
		</form>
	</body>
</html>
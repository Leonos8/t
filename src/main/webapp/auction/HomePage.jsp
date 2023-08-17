<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String userid=(String)session.getAttribute("LOGIN_USER");
	if(userid==null)
	{
    	response.sendRedirect("../login/LoginPage.jsp");
    	return; //the return is important; forces redirect to go now
	}
%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Auction</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		<style>
			.search input[type=text] 
			{
  				float: right;
  				padding: 6px;
  				outline: 1px;
  				width: 50%;
  				margin-top: 8px;
  				margin-right: 25%;
  				font-size: 17px;
  				display-inline: block;
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
    			display-inline: block;
  			}
  			
  			.newAuctionButton 
			{
    			float: right;
    			display: block;
    			text-align: left;
    			width: 7%;
    			margin-left: 0%;
    			margin-top: 8px;
    			padding: 8px;
  			}
  			
  			.itemTypeSelect
  			{
  				vertical-align: middle;
  				display-inline: block;
  				margin-right: 5%;
  			}
  			
  			*
  			{
	
				padding: 0;
				margin: 1;
				font-family: sans-serif;
			}
	
			ul
			{
				list-style: none;
				backgrond: black;
			}
	
			ul li
			{
				display: inline-block;
				position: relative;
				border: 2px solid black;
			}
	
			ul li a
			{
				display: block;
				padding: 13px 16px;
				color: black;
				text-decoration: none;
				text-align: center;
				font-size: 16px;
			}
	
			ul li ul.dropdown li
			{
				display: block;
			}
		
			ul li ul.dropdown
			{
				width: 100%;
				background: white;
				position: absolute;
				z-index: 1;
				display: none;
			}
	
			ul li a:hover
			{
				background: blue;
			}
	
			ul li:hover ul.dropdown
			{
				display: block;
			}
		</style>
		
		<script type="text/javascript">		
			function passUser()
			{
				<% 
					session.setAttribute("PROFILE_USER", session.getAttribute("LOGIN_USER"));
				%>
			}
		</script>
		
	</head>
	
	<body>
		<nav>
			<ul>
				<li>
					<a href="#"><i class="fa fa-user"></i>User</a>	
								
					<ul class="dropdown">
						<li><a href="ProfilePage.jsp" onclick="passUser()">Profile</a></li>
						<%
							String currentUser=(String)session.getAttribute("LOGIN_USER");
							userHandler.UserHandler uh=new userHandler.UserHandler();
							if(uh.isCustomerRep(currentUser)
									|| uh.isAdmin(currentUser))
							{
								%>
								<li><a href="AdminPage.jsp">Admin</a></li>
								<%
							}
						%>
						<li><a href="../forum/ForumPage.jsp">Forum</a></li>
						<li><a href="../login/LoginPage.jsp">Log Out</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		
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
		
		<div>
			<form action="NewAuctionPage.jsp">
      			<button type="submit" class="newAuctionButton">New Auction</button>
    		</form>
		</div>
		
		<div>
			<form>
				<button style="font-size: 25px;"><i class="fa fa-envelope" aria-hidden="true"></i></button>
			</form>
		</div>
	</body>	
</html>
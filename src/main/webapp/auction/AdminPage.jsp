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
		<title>Admin Tools</title>
		
		<style>
			.tab 
			{
  				overflow: hidden;
  				border: 1px solid #ccc;
  				background-color: #f1f1f1;
			}
			
			.tab button 
			{
  				background-color: inherit;
  				float: left;
  				border: none;
  				outline: none;
  				cursor: pointer;
  				padding: 14px 16px;
  				transition: 0.3s;
  				font-size: 17px;
			}
				
			.tab button:hover 
			{
  				background-color: #ddd;
			}	
		
			.tab button.active 
			{
  				background-color: #ccc;
			}
			
			.tabcontent 
			{
  				display: none;
  				padding: 6px 12px;
  				border: 1px solid #ccc;
  				border-top: none;
			}
		
			.button
			{
				
				width:15%;
				font-size: 18px;
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
		function openCity(evt, cityName) 
		{
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) 
			{
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) 
			{
				tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		
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
	
		<div class="tab">
  			<button class="tablinks" onclick="openCity(event, 'Accounts')">Accounts</button>
			<button class="tablinks" onclick="openCity(event, 'Reports')">Reports</button>
		</div>
		
		<div id="Accounts" class="tabcontent">
  			<h3>Accounts</h3>
  				<%
					userHandler.UserHandler uh=new userHandler.UserHandler();
					String currentUser=(String)session.getAttribute("LOGIN_USER");
					if(uh.isAdmin(currentUser))
					{
						%>
							<form action="CreateCRPage.jsp">
  								<p><button class=button>Create Customer Representative</button></p>
  							</form>
						<%
					}
				%>
		</div>
		
		<div id="Reports" class="tabcontent">
  			<h3>Reports</h3>
  			<%
  				if(uh.isAdmin(currentUser))
				{
					%>
						<form action="SummarySalesReportPage.jsp">
  							<p><button class=button>Generate Sales Summary Report</button></p>
  						</form>
					<%
				}
  			%>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <html>
    	<style>
    		.forumLogo
			{
				background-color: #0080fe;
  				text-align: center;
  				font-size:50px;
  				cursor: pointer;
  				border: 2px solid black;
			}
    	</style>
    	
    	<script>
    		function goToHome()
			{
				location.replace("HomePage.jsp")
			}
    	</script>
    	
    	<body>
    		<div class="forumLogo">
				<a onclick=goToHome()>Forum</a>
			</div>
    	</body>
    </html>
<%
	String userid=(String)session.getAttribute("LOGIN_USER");
	if(userid==null)
	{
    	response.sendRedirect("../login/LoginPage.jsp");
    	return; //the return is important; forces redirect to go now
	}
%>

<%
	String search=(String)request.getParameter("search");

	String[] keywords=search.split("[ ]+");

	System.out.println(keywords.length);

	if(keywords.length>0 && !keywords[0].isBlank())
	{
		userHandler.UserHandler uh=new userHandler.UserHandler();
		
		java.util.ArrayList<Object[]> questions=uh.searchQuestions(keywords);
		
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
					</style>
				</head>
			
				<body>
					<div class="search">
						<form action="SearchQuestionPage.jsp">
  							<input type="text" placeholder="Search..." name="search">
  							<button type="submit" class=searchButton><i class="fa fa-search"></i></button>
						</form>
					</div>
		
				
				</body>
				<div class="results">
					<br><br>
					<%
						for(int i=questions.size()-1; i>=0; i--)
						{
							%>
								<a href="../auction/ProfilePage.jsp" onclick="<%session.setAttribute("QUESTION_OPENED", questions.get(i)[0]);%>">
							<%
								out.println(questions.get(i)[1]);
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
				<meta http-equiv="Refresh" content="0; url='ForumPage.jsp'" />
			</html>
		<%
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Forum</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<style>
		
		.forumLogo
		{
			background-color: #0080fe;
  			text-align: center;
  			font-size:50px;
  			cursor: pointer;
  			border: 2px solid black;
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
    		width: 2%;
    		margin-right: 25;
    		margin-top: 8px;
    		padding: 8px;
  		}
  		
  		.searchButton 
		{
    		float: right;
    		display: block;
    		text-align: left;
    		width: 2%;
    		margin-right: 25;
    		margin-top: 8px;
    		padding: 8px;
  		}
  		
  		.newQuestionButton
  		{
  			float: right;
    		display: block;
    		text-align: right;
    		width: 10%;
    		font-size: 18px;
    		margin-left: 20%;
    		margin-top: 8px;
    		padding: 8px;
  		}
  		
  		.questionsList
  		{
  			overflow: auto;
			height: 90%;
			width: 90%;
			font-size: 35px;
  		}
	
	</style>
	
	<script language="JavaScript" type="text/javascript">
		function goToHome()
		{
			location.replace("../auction/HomePage.jsp")
		}
	</script>
	
	<body>
	
		<div class="forumLogo">
			<a onclick=goToHome()>Forum</a>
		</div>
		
		<div class="search">
			<form action="../forum/SearchQuestionPage.jsp">
      			<input type="text" placeholder="Search..." name="search">
      			<button type="submit" class=searchButton><i class="fa fa-search" ></i></button>
    		</form>
		</div>
		
		<div>
			<form action="NewQuestionPage.jsp">
				<button type="submit" class="newQuestionButton">New Question</button>
			</form>
		</div>
		
		<div class="questionsList">
			<%
				userHandler.UserHandler uh=new userHandler.UserHandler();
				java.util.ArrayList<Object[]> questions=uh.getQuestions();
			
				for(int i=questions.size()-1; i>=0; i--)
				{
					%>
						<a href="ViewQuestionPage.jsp" onclick="<%session.setAttribute("QUESTION_OPENED", questions.get(i)[0]);%>">
					<%
					out.println(questions.get(i)[1]);
					%>
						</a>
						<br>
					<%
				}
			%>
		</div>
	</body>
</html>
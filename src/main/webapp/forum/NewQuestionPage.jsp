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
		<title>New Question</title>
		
		<style>
			.titleBox
  			{
  				margin-top: 100px;
  				text-align: center;
  			}
  			
  			.questionBox
  			{
  				margin-top: 20px;
  				text-align: center;
  			}
  			
  			.submitDiv
  			{
  				padding-top: 10px;
  				text-align: center;
  			}
  			
  			.submitButton
  			{	
  				font-size: 30px;
  			}
  			
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
	</head>
	<body>
		<div class="forumLogo">
			<a onclick=goToHome()>Forum</a>
		</div>
	
		<form action="../Processing/CQProcessing.jsp">
			<div class="titleBox">
        		<p>Enter a title for your question</p>
        		<input style="font-size:50px;" type="text" name="title" placeholder="Enter Title" required>
        	</div>
        	<div class="questionBox">
        		<textarea placeholder="Enter description" name="question" rows=10 cols=100 style="font-size:20px;"></textarea>
        	</div>
        		
        	<div class="submitDiv">
        		<button type="submit" class="submitButton">Submit Question</button>
        	</div>
    	</form>
	</body>
</html>
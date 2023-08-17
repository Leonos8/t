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
		<title>New Answer</title>
		
		<style>
			.title
			{
				border-style: solid;
				text-align: center;
				margin-top: 25px;
				font-size: 25px;
			}
			
			.userInfo
			{
				border-style: solid;
				text-align: left;
				float: left;
				margin-top: 10px;
				font-size: 25px;
				width: 24%;
			}
			
			.question
			{
				border-style: solid;
				text-align: left;
				margin-top: 10px;
				float: right;
				font-size: 25px;
				width: 75%;
				word-wrap: break-word;
			}
			
			.answerBox
  			{
  				margin-top: 5px;
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
		function changeLink()
		{
			<% 
				int qid=(int)session.getAttribute("QUESTION_OPENED");
				
				userHandler.UserHandler uh=new userHandler.UserHandler();
				
				String user=(String)uh.getQuestions().get(qid-1)[1];
				user+=" NEW-ANSWER";
			%>
				
			var jsqid = "<%=qid%>"
			var jsUser = "<%=user%>"
				
			console.log(jsqid);
				
			window.history.replaceState({}, "", jsUser);
			}
		
			function goToHome()
			{
				location.replace("HomePage.jsp")
			}
		</script>
	</head>
	<body onload="changeLink()">
		<div class="forumLogo">
			<a onclick=goToHome()>Forum</a>
		</div>
		<%
			Object[] questionInfo=uh.getQuestions().get(qid-1);
		%>
	
		<div class="title">
			<h1 style="font-size: 50px;"><% out.println(questionInfo[1]); %></h1>
		</div>
		
		<div class="userInfo">
			<p>
			<a href="../auction/ProfilePage.jsp" onclick="<%session.setAttribute("PROFILE_USER", questionInfo[3]);%>"><% out.println(questionInfo[3]); %></a>
			<%
				if(uh.isCustomerRep((String)questionInfo[3]))
				{
					%>
						&emsp;Customer Representative
					<%
				}
			
				if(uh.isAdmin((String)questionInfo[3]))
				{
					%>
						&emsp;Administrator
					<%
				}
				%>
			<br>
			<% out.println(questionInfo[4]); %>
			</p>
		</div>
		
		<div class="question">
			<p><% out.println(questionInfo[2]); %></p>
		</div>
		
		<form action="../Processing/NewAnsProcessing.jsp">
			<div class="answerBox">
        		<textarea placeholder="Enter answer" name="answer" rows=10 cols=100 style="font-size:20px;"></textarea>
        	</div>
        		
        	<div class="submitDiv">
        		<button type="submit" class="submitButton">Submit Answer</button>
        	</div>
		</form>
	</body>
</html>
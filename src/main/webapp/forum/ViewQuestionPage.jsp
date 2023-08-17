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
		<title>Question</title>
		
		<style>
			.title
			{
				border-style: solid;
				text-align: center;
				margin-top: 25px;
				font-size: 25px;
			}
			
			.answerButton
			{
    			display: block;
    			text-align: right;
    			width: 5%;
    			font-size: 18px;
    			margin-left: 0%;
    			margin-top: 10px;
    			padding: 5px;
			}
			
			.questionUserInfo
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
			
			.answerUserInfo
			{
				border-style: solid;
				text-align: left;
				float: left;
				margin-top: 50px;
				font-size: 25px;
				width: 20%;
			}
			
			.answers
			{
				border-style: solid;
				text-align: left;
				margin-top: 25px;
				float: right;
				font-size: 25px;
				width: 75%;
				word-wrap: break-word;
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
		
		<form action="NewAnswerPage.jsp">
			<button class="answerButton">Answer</button>
		</form>
		
		<div class="questionUserInfo">
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
		
		<%
			java.util.ArrayList<Object[]> answers=uh.getAnswers((int)questionInfo[0]);
			
			for(int i=0; i<answers.size(); i++)
			{
				%>
					<div class="answerUserInfo">
						<p>
							<a href="../auction/ProfilePage.jsp" onclick="<%session.setAttribute("PROFILE_USER", questionInfo[3]);%>"><% out.println(questionInfo[3]); %></a>
							<%
								if(uh.isCustomerRep((String)answers.get(i)[3]))
								{
									%>
										&emsp;Customer Representative
									<%
								}
			
								if(uh.isAdmin((String)answers.get(i)[3]))
								{
									%>
										&emsp;Administrator
									<%
								}
							%>
							<br>
							<% out.println(answers.get(i)[4]); %>
						</p>
					</div>
		
					<div class="answers">
						<p><% out.println(answers.get(i)[2]); %></p>
					</div>
				<%
			}
		%>
	</body>
</html>
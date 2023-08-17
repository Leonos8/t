<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String answer=(String)request.getParameter("answer");
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	int qid=(int)session.getAttribute("QUESTION_OPENED");
	String currentUser=(String)session.getAttribute("LOGIN_USER");
	
	boolean status=uh.createAnswer(currentUser, qid, answer);
	
	if(status)
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../forum/ViewQuestionPage.jsp'" />
			</html>
		<%
	}
	else
	{
		%>
		<html>
			<meta http-equiv="Refresh" content="0; url='../forum/NewAnswerPage.jsp'" />
		</html>
	<%
	}
%>
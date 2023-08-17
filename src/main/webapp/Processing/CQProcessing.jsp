<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	String title=request.getParameter("title");
	String question=request.getParameter("question");
	
	System.out.println(title+" "+question);
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	boolean status=uh.createQuestion((String)session.getAttribute("LOGIN_USER"), title, question);
	
	if(status)
	{
		%>

		<html>
			<meta http-equiv="Refresh" content="0; url='../forum/ForumPage.jsp'" />
		</html>
		
		<%
	}
	else
	{
		%>

		<html>
			<meta http-equiv="Refresh" content="0; url='../forum/NewQuestionPage.jsp'" />
		</html>
		
		<%
	}
%>
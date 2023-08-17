<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String uname=request.getParameter("uname");
String pword=request.getParameter("psw");
String email=request.getParameter("eml");
String phone=request.getParameter("pn");

userHandler.UserHandler uh=new userHandler.UserHandler();
//System.out.println(userHandler.UserHandler.createAccount(uname, pword, email, phone));
int status=uh.createCustomerRep(uname, pword, email, phone);
System.out.println("Status="+status);
if(status!=6)
{
	System.out.println("Not 6");
	
	%>

	<html>
		<meta http-equiv="Refresh" content="0; url='../auction/CreateCRPage.jsp'" />
	</html>
	
	<%
}
else
{
	System.out.println(6);
	
	%>

	<html>
		<meta http-equiv="Refresh" content="0; url='../auction/AdminPage.jsp'" />
	</html>
	
	<%
}
%>
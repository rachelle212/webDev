<%-- 
    Document   : logout
    Created on : 03-Apr-2017, 14:25:15
    Author     : Abhishek
--%>
<%
	//invalidate session
	if(session.getAttribute("uname") != null) {             
		//if session was created
		session.invalidate();
		response.sendRedirect("index.jsp");
    }
	else
	{
		// passing variable "b" with URL
		// lets say "b" is for "user must login"
		response.sendRedirect("index.jsp?b");
    }
%>

<%

	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == ""))
	{
%>
You are not logged in<br/>
<a href="index.jsp">Please login</a>
<%
	}
	else
	{
%>
		Welcome <%=session.getAttribute("username").toString()%>
		<a href='logout.jsp'>Log out</a>
<%
	}
%>

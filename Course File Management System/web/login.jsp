<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("inputPassword");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cfms", "root", "");

	conn.setAutoCommit(false);
	
	Statement st= conn.createStatement();
	ResultSet rs;

	rs = st.executeQuery("select * from userlogin where username='" + username + "' and password = '" + password + "'");
	
	if (rs.next())
	{
		//session.setAttribute("username", username);
		out.println("Login success <a href='index.jsp'> Go back </a>");
		//response.sendRedirect("success.jsp");
	}
	else
	{
		out.println("Invalid password <a href='index.jsp'> Try again </a>");
	}
%>
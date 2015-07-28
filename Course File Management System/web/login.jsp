<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("inputPassword");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cfms", "root", "");

	conn.setAutoCommit(false);
	
	Statement st = conn.createStatement();
	ResultSet rs;

	rs = st.executeQuery("SELECT * FROM userlogin WHERE username='" + username + "' AND password = '" + password + "'");
	
	if (rs.next())
	{
		//session.setAttribute("username", username);
		out.println("Login success <a href='index.jsp'> Go back </a>");
                out.println(username);
                out.println(password);
                out.println(rs.getString("usertype"));
		//response.sendRedirect("success.jsp");
                
                if (rs.getString("usertype").equals("root")) {
%>

                    <jsp:include page="root/rootHome.jsp"/> <!-- ADMIN -->

<%                    
                } else if (rs.getString("usertype").equals("admin")) {
                    
%>

                    <jsp:include page="admin/adminHome.jsp"/> <!-- PENTADBIR -->
                    
<%
                } else if (rs.getString("usertype").equals("lecturer")) {
                    
%>

                    <jsp:include page="lecturer/lecturerHome.jsp"/> <!-- LECTURER -->

<%
                }
	}
	else
	{
		out.println("Invalid password <a href='index.jsp'> Try again </a>");
                out.println(username);
                out.println(password);
	}
%>
<%@ page import ="java.sql.*, common.DB" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("inputPassword");

	ResultSet rs = DB.query("SELECT * FROM userlogin WHERE username='" + username + "' AND password = '" + password + "'");
	
	if (rs.next())
	{
		session.setAttribute("username", username);
                out.println(rs.getString("usertype"));
		//response.sendRedirect("login_success.jsp");
                
                if (rs.getString("usertype").equals("root")) {
                    response.sendRedirect("root/rootHome.jsp"); // ROOT
                } else if (rs.getString("usertype").equals("admin")) {
                    response.sendRedirect("admin/adminHome.jsp"); // ADMIN/PENTADBIR
                } else if (rs.getString("usertype").equals("lecturer")) {
                    response.sendRedirect("lecturer/lecturerHome.jsp"); // LECTURER
                }
	}
	else
	{
		out.println("Invalid password <a href='index.jsp'> Try again </a>");
                out.println(username);
                out.println(password);
	}
%>
<%@ page import ="java.sql.*, common.DB" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String emailAdd = request.getParameter("emailAdd");
	String phoneNo = request.getParameter("phoneNo");
	String department = request.getParameter("department");
	String status = request.getParameter("status");

	int rs = DB.update("INSERT INTO user VALUES ('" + username + "', '" + password + "', 'lecturer')");

	int rs2 = DB.update("INSERT INTO profile (`name`, `emailAdd`, `phoneNo`, `department`, `status`, `username`) VALUES ('"+ name+ "', '"+ emailAdd +"', '"+ phoneNo +"', '"+ department +"', '"+ status +"', '"+ username +"')");

	response.sendRedirect("viewLecturers.jsp");
	
%>
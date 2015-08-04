<%@ page import ="java.sql.*, common.DB" %>
<%
	String courseCode = request.getParameter("courseCode");
	String courseID = request.getParameter("courseID");
	String courseName = request.getParameter("courseName");
	String creditHours = request.getParameter("creditHours");


	int rs = DB.update("INSERT INTO course VALUES ('" + courseCode + "', '" + courseID + "', '" + courseName + "', '" + creditHours + "')");

	response.sendRedirect("viewCourses.jsp");
	
%>
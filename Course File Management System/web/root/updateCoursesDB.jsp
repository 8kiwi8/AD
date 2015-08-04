<%@ page import ="java.sql.*, common.DB" %>
<%
	String courseCode = request.getParameter("courseCode");
	String courseID = request.getParameter("courseID");
	String courseName = request.getParameter("courseName");
	String creditHours = request.getParameter("creditHours");

	int rs = DB.update("UPDATE course SET courseName='"+ courseName +"', creditHours='"+ creditHours +"' WHERE courseCode='"+ courseCode+ "' AND courseID='"+ courseID +"'");

	response.sendRedirect("viewCourses.jsp");
	
%>
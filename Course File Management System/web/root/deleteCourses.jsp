<%@ page import ="java.sql.*, common.DB" %>
<%
	String courseCode = request.getParameter("courseCode");
	String courseID = request.getParameter("courseID");

	int rs = DB.update("DELETE FROM course WHERE courseCode= '"+courseCode +"' AND courseID= '" + courseID + "'");

	response.sendRedirect("viewCourses.jsp");
%>
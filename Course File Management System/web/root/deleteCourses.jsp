<%@ page import ="java.sql.*, common.DB" %>
<jsp:include page="../auth.jsp"/>
<%
	String courseCode = request.getParameter("courseCode");
	String courseID = request.getParameter("courseID");

	int rs = DB.update("DELETE FROM course WHERE courseCode= '"+courseCode +"' AND courseID= '" + courseID + "'");

	response.sendRedirect("viewCourses.jsp");
%>
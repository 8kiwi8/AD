<%@ page import ="java.sql.*, common.DB" %>

<jsp:include page="../auth.jsp"/>

<%
	String username = request.getParameter("username");
	String name = request.getParameter("name");
	String emailAdd = request.getParameter("emailAdd");
	String phoneNo = request.getParameter("phoneNo");
	String department = request.getParameter("department");
	String status = request.getParameter("status");

	int rs = DB.update("UPDATE profile SET name='"+ name+ "', emailAdd='"+ emailAdd +"', phoneNo='"+ phoneNo +"', department='"+ department +"', status='"+ status +"' WHERE username = '"+ username +"'");

	response.sendRedirect("viewLecturers.jsp");
	
%>
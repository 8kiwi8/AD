<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String courseID = request.getParameter("courseID");
        String username = request.getParameter("username");
        String sql = "SELECT * FROM section WHERE courseID="+courseID+" AND username='"+username+"'";
        ResultSet rs = DB.query(sql);
        rs.next();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= rs.getString(5) %> <%= courseID %></title>
    </head>
    <body>
        <h1><%= rs.getString(5) %> <%= courseID %></h1>
        Section:<%= rs.getString(7) %>
    </body>
</html>

<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String username = request.getParameter("username");
        String sql = "SELECT * FROM profile WHERE username='"+username+"'";
        ResultSet rs = DB.query(sql);
        rs.next();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= rs.getString(1) %></title>
    </head>
    <body>
        <h1><%= rs.getString(1) %></h1>
        Courses:
    
    <%
        // Getting the courseID for the lecturer
        sql = "SELECT * FROM course_offered WHERE username='"+username+"'";
        ResultSet rs2 = DB.query(sql);
        ResultSet rs3;
        boolean empty = !rs2.next();
        
        if (!empty) {
            // Getting the courseName for the courseID
            String courseID = rs2.getString(3);
            sql = "SELECT * FROM course WHERE courseID='"+courseID+"'";
            rs3 = DB.query(sql);
            rs3.next();
            
            // Display the courseName
    %>
        <a href="viewSection.jsp?courseID=<%= courseID %>&username=<%= username %>"><%= rs3.getString(3) %></a>
    <%
        } else {
            out.print("None");
        }
    %>
        
    </body>
</html>

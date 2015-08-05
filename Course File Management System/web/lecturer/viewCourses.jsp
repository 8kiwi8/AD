<%@ page import ="java.sql.*, common.DB" %>
<jsp:include page="../auth.jsp"/>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<%
    ResultSet rs = DB.query("SELECT section.sectionID, section.courseCode, section.courseID, course.courseName FROM section JOIN course ON course.courseID=section.courseID AND course.courseCode=section.courseCode WHERE section.username='lecturer'");
%>
    <jsp:include page="../header.jsp"/>
    <div class="container">
            
      <table class="table">
        <caption>List of Courses</caption>
        <thread>
            <tr>
                <th>Section ID</th>
                <th>Course Code</th>
                <th>course ID</th>
                <th>Course Name</th>
            </tr>
        </thread>
        <tbody>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>

            </tr>
        <% } %>
        </tbody>
      </table>
        
    </div> <!-- /.container -->
</body>
</html>
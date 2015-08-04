<%@ page import ="java.sql.*, common.DB" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<%
    ResultSet rs = DB.query("SELECT * FROM course");
%>

    <div class="container">
        <jsp:include page="../auth.jsp"/>
        
      <table class="table">
        <caption>List of Courses</caption>
        <thread>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Credit Hours</th>
                <th></th>
            </tr>
        </thread>
        <tbody>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(1) %> <%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><a href="updateCourses.jsp?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>
        </tbody>
      </table>
    
 <p>
   <a role="button" class="btn btn-primary" href="addCourses.jsp">
      Add
   </a>
</p>

    </div> <!-- /.container -->
</body>
</html>
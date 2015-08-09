<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<%
    ResultSet rs = DB.query("SELECT * FROM course");
%>

    <div class="container">
      <table 
          data-toggle="table" 
          data-search="true"
          data-pagination="true"
          data-show-toggle="true">
        <thead>
            <tr>
                <th data-sortable="true" data-field="courseCode">Course Code</th>
                <th data-sortable="true" data-field="courseName">Course Name</th>
                <th data-field="courseHours">Credit Hours</th>
                <th data-field="action"></th>
            </tr>
        </thead>
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
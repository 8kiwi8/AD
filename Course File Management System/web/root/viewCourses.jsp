<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Courses - <%=session.getAttribute("User").toString()%></title>
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
                <td><a href="updateCourses.jsp?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-upload"></span>Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-danger btn-xs" onclick= "return confirm('Are you sure you want to continue')"><span class="glyphicon glyphicon-remove"></span>Delete</button></a></td>
            </tr>
        <% } %>
        </tbody>
      </table>
 <p>
   <a role="button" pull-right class="btn btn-primary btn-lg" href="addCourses.jsp">
      Add
   </a>
</p>

    </div> <!-- /.container -->
</body>
<jsp:include page="../footer.jsp"/>
</html>
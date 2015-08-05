<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
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
    ResultSet rs = DB.query("SELECT * FROM course WHERE courseCode='SCSJ'");
    ResultSet rs2 = DB.query("SELECT * FROM course WHERE courseCode='SCSR'");
    ResultSet rs3 = DB.query("SELECT * FROM course WHERE courseCode='SCSB'");
    ResultSet rs4 = DB.query("SELECT * FROM course WHERE courseCode='SCSV'");

%>

    <div class="container">
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
            <tr><td><b>SCSJ (Software Engineering)</b></td><td></td><td></td><td></td></tr>
        <%while(rs.next()){ %>
            
            <tr>
                <td><%=rs.getString(1) %> <%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><a href="updateCourses.jsp?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>
            <tr><td><b>SCSR (Network Communication & Security)</b></td><td></td><td></td><td></td></tr>
        <%while(rs2.next()){ %>
            <tr>
                <td><%=rs2.getString(1) %> <%=rs2.getString(2) %></td>
                <td><%=rs2.getString(3) %></td>
                <td><%=rs2.getString(4) %></td>
                <td><a href="updateCourses.jsp?courseCode=<%=rs2.getString(1)%>&courseID=<%=rs2.getString(2)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs2.getString(1)%>&courseID=<%=rs2.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>
            <tr><td><b>SCSB (Bioinformatic)</b></td><td></td><td></td><td></td></tr>
        <%while(rs3.next()){ %>
            <tr>
                <td><%=rs3.getString(1) %> <%=rs3.getString(2) %></td>
                <td><%=rs3.getString(3) %></td>
                <td><%=rs3.getString(4) %></td>
                <td><a href="updateCourses.jsp?courseCode=<%=rs3.getString(1)%>&courseID=<%=rs3.getString(2)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs3.getString(1)%>&courseID=<%=rs3.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>
        <tr><td><b>SCSV (Graphic Design)</b></td><td></td><td></td><td></td></tr>
        <%while(rs4.next()){ %>
            <tr>
                <td><%=rs4.getString(1) %> <%=rs4.getString(2) %></td>
                <td><%=rs4.getString(3) %></td>
                <td><%=rs4.getString(4) %></td>
                <td><a href="updateCourses.jsp?courseCode=<%=rs4.getString(1)%>&courseID=<%=rs4.getString(2)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteCourses?courseCode=<%=rs4.getString(1)%>&courseID=<%=rs4.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
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
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
    
        <div class="jumbotron">
            <h1>Course File Management System</h1>
            <p>Upload all your course-related documents here for the usage of students and administrators.</p>
        </div>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="rootHome.jsp">Home</a></li>
                    <li><a href="viewLecturers.jsp">Lecturers</a></li>
                    <li class="active"><a href="#">Courses</a></li>
                    <li><a href="viewSemesters.jsp">Semesters</a></li>
                    
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/Course_File_Management_System/web/logout.jsp">Log Out</a></li>
                </ul>
            </div> <!-- /.container-fluid -->
            
        </nav>
        
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
                <a href="deleteCourses.jsp?courseCode=<%=rs.getString(1)%>&courseID=<%=rs.getString(2)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
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
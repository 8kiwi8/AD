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
    ResultSet rs = DB.query("SELECT section.sectionID, section.courseCode, section.courseID, course.courseName FROM section JOIN course ON course.courseID=section.courseID AND course.courseCode=section.courseCode WHERE section.username='lecturer'");
%>

    <div class="container">
    
        <div class="jumbotron">
            <h1>Course File Management System</h1>
            <p>Upload all your course-related documents here for the usage of students and administrators.</p>
        </div>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="lecturerHome.jsp">Home</a></li>
                    <li class="active"><a href="#">Courses</a></li>
                    <li><a href="viewUploads.jsp">Uploads</a></li>
                    
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="logOut.html">Log Out</a></li>
                </ul>
            </div> <!-- /.container-fluid -->
            
        </nav>
        
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
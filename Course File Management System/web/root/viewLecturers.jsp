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
    ResultSet rs = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer'");
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
                    <li class="active"><a href="#">Lecturers</a></li>
                    <li><a href="viewCourses.jsp">Courses</a></li>
                    <li><a href="viewSemesters.jsp">Semesters</a></li>
                    
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/Course_File_Management_System/logout.jsp">Log Out</a></li>
                </ul>
            </div> <!-- /.container-fluid -->
            
        </nav>
        
      <table class="table">
        <caption>List of Lecturers</caption>
        <thread>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Email Address</th>
                <th>Phone Number</th>
                <th>Department</th>
                <th>Status</th>
            </tr>
        </thread>
        <tbody>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><%=rs.getString(5) %></td>
            </tr>
        <% } %>
        </tbody>
      </table>
        
    </div> <!-- /.container -->
</body>
</html>
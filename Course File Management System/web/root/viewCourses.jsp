<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<%Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cfms", "root", "");

    conn.setAutoCommit(false);
    
    Statement st= conn.createStatement();
    ResultSet rs;

    rs = st.executeQuery("SELECT * FROM course");
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
                <th>Course ID</th>
                <th>course Name</th>
                <th>Course code</th>
                <th>Credit Hours</th>
            </tr>
        </thread>
        <tbody>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(4) %></td>
            </tr>
        <% } %>
        </tbody>
      </table>
        
    </div> <!-- /.container -->
</body>
</html>
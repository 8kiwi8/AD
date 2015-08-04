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
    
        <jsp:include page="../auth.jsp"/>
        
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
                <th></th>
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
                <td><a href="updateLecturer.jsp?username=<%=rs.getString(6)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteLecturer?username=<%=rs.getString(6)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>
        </tbody>
      </table>
            <p>
   <a role="button" class="btn btn-primary" href="addLecturer.jsp">
      Add
   </a>
</p>
    </div> <!-- /.container -->
</body>
</html>
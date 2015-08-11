<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Lecturers - <%=session.getAttribute("User").toString()%></title>
</head>
<body>

<%
    ResultSet rs = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer' AND profile.department='Software Engineering'");

    ResultSet rs2 = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer' AND profile.department='Computer Science'");

    ResultSet rs3 = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer' AND profile.department='Information System'");
%>
    <div class="container">
      <table class="table">
        <caption>List of Lecturers</caption>
        <thread>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Email Address</th>
                <th>Phone Number</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thread>
        <tbody>
        <tr><td><b>Dept. of Software Engineering</b></td><td></td><td></td><td></td><td></td><td></td></tr>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(5) %></td>
                <td><a href="updateLecturer.jsp?username=<%=rs.getString(6)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteLecturer?username=<%=rs.getString(6)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>

        <tr><td><b>Dept. of Computer Science</b></td><td></td><td></td><td></td><td></td><td></td></tr>
        <%while(rs2.next()){ %>
            <tr>
                <td><%=rs2.getString(6) %></td>
                <td><%=rs2.getString(1) %></td>
                <td><%=rs2.getString(2) %></td>
                <td><%=rs2.getString(3) %></td>
                <td><%=rs2.getString(5) %></td>
                <td><a href="updateLecturer.jsp?username=<%=rs2.getString(6)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteLecturer?username=<%=rs2.getString(6)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
            </tr>
        <% } %>

        <tr><td><b>Dept. of Information System</b></td><td></td><td></td><td></td><td></td><td></td></tr>
        <%while(rs3.next()){ %>
            <tr>
                <td><%=rs3.getString(6) %></td>
                <td><%=rs3.getString(1) %></td>
                <td><%=rs3.getString(2) %></td>
                <td><%=rs3.getString(3) %></td>
                <td><%=rs3.getString(5) %></td>
                <td><a href="updateLecturer.jsp?username=<%=rs3.getString(6)%>"><button class="btn btn-primary btn-xs">Update</button></a>
                <a href="<%=request.getContextPath()%>/deleteLecturer?username=<%=rs3.getString(6)%>"><button class="btn btn-danger btn-xs">Delete</button></a></td>
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
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lecturers</title>
</head>
<body>

<%
    ResultSet rs;
    String department = request.getParameter("department");
    String sql;
    if (department != null) {
        sql = "SELECT * FROM profile, user WHERE user.username=profile.username AND user.usertype='lecturer' AND profile.department='"+department+"'";
    } else {
        sql = "SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer'";
    }
    
    rs = DB.query(sql);
%>
    <div class="container">
        <a href="viewLecturers.jsp">All</a>
        <a href="?department=Information%20System">Information System</a>
        <a href="?department=Software%20Engineering">Software Engineering</a>
        <a href="?department=Computer%20Science">Computer Science</a>
        <table 
            data-toggle="table" 
            data-search="true"
            data-pagination="true"
            data-show-toggle="true">
            <thead>
                <tr>
                    <th data-sortable="true">Username</th>
                    <th data-sortable="true">Name</th>
                    <th data-sortable="true">Email Address</th>
                    <th data-sortable="true">Phone Number</th>
                    <th data-sortable="true">Department</th>
                    <th data-sortable="true">Status</th>
                </tr>
            </thead>
            <tbody>
            <%while(rs.next()){ %>
                <tr>
                    <td><a href="viewLect.jsp?username=<%=rs.getString(6) %>"><%=rs.getString(6) %></a></td>
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
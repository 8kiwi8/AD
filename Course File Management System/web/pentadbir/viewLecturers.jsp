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
    ResultSet rs = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer'");
%>
    <div class="container">
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
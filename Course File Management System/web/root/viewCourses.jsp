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
        <jsp:include page="../auth.jsp"/>
        
      <table class="table">
        <caption>List of Courses</caption>
        <thread>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Credit Hours</th>
                <th>Penyelaras</th>
            </tr>
        </thread>
        <tbody>
        <%while(rs.next()){ %>
            <tr>
                <td><%=rs.getString(1) %> <%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td>
                    <select class="form-control" id="section">
                        <option>01</option>
                    </select>
                </td>
            </tr>
        <% } %>
        </tbody>
      </table>
        
    </div> <!-- /.container -->
</body>
</html>
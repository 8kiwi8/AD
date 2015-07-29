<%
session.setAttribute("username", null);
session.removeAttribute("password");
session.invalidate();
response.sendRedirect("index.jsp");
%>

<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>LogOut</title>
</head>
<body>
    <div class="container">
    
        <div class="jumbotron">
            <h1>Course File Management System</h1>
            <p>TEMPORARY LOG OUT PAGE</p>
        </div>
        
        
    </div> <!-- /.container -->
</body>
</html>
<jsp:include page="header.jsp"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <%
            if (session.getAttribute("Error") != null) { // If there is an error during login
        %>
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute("Error") %></strong>
                </div>
        <%
            session.removeAttribute("Error");
            }
        %>
        <div class="col-xs-8 panel panel-default">
            <h1>Index</h1>
        </div>
              
        <div class="col-xs-4 panel panel-default">
            <h1>Yea!</h1>
            <p>The quick brown fox jumps over the lazy dog</p>
        </div>
        
    </div> <!-- /.container -->
</body>
</html>
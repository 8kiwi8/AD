<jsp:include page="../auth.jsp"/>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    <div class="container">
        
        
        
        <div class="col-xs-8 panel panel-default">
            <h1>Test</h1>
            <p>You are logged in as: Lecturer</p>
        </div>
              
        <div class="col-xs-4 panel panel-default">
            <h1>Test 2</h1>
            <p>The quick brown fox jumps over the lazy dog</p>
        </div>
        
    </div> <!-- /.container -->
</body>
</html>
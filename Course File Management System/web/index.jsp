<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String 
%>


<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <div class="container">
    
        <div class="jumbotron">
            <h1>Course File Management System</h1>
            <p>Upload all your course-related documents here for the usage of students and administrators.</p>
        </div>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li></li>
                </ul>
            </div> <!-- /.container-fluid -->
        </nav>
        
        <div class="col-xs-4">
        </div>
        
        <div class="col-xs-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Login</h3>
                </div>
                <div class="panel-body">
                
                    <form class="form-horizontal" method="post" action="login.jsp">
                        <div class="form-group">
                            <label for="username" class="control-label col-xs-4">Username</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="username" placeholder="Username">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputPassword" class="control-label col-xs-4">Password</label>
                            <div class="col-xs-8">
                                <input type="password" class="form-control" name="inputPassword" placeholder="Password">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-xs-offset-4 col-xs-8">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </div>
                    </form>
                    
                </div> <!-- /.panel-body -->
                
            </div> <!-- /.container -->
        </div>
        
        <div class="col-xs-4">
        </div>
      
        
    </div> <!-- /.container -->
</body>
</html>
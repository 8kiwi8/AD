<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userType") != null) {
        response.sendRedirect(session.getAttribute("userType") + "/home.jsp");
    }
    boolean invalidPassword = false;
    
    if (request.getAttribute("Error") != null) {
        if (request.getAttribute("Error").equals("Invalid password.")) {
            invalidPassword = true;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            
            <div class="col-xs-4"></div>

            <div class="col-xs-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/loginAction.jsp">
                            <div class="form-group">
                                <label for="username" class="control-label col-xs-4">Username</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="inputUsername" placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group <% if (invalidPassword) out.println("has-error"); %>">
                                <label for="inputPassword" class="control-label col-xs-4">Password</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control" name="inputPassword" placeholder="Password">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-8 col-xs-4">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </div>
                        </form>
                    </div> <!-- /.panel-body -->

                </div> <!-- /.panel .panel-default -->
                <%
                    if (request.getAttribute("Error") != null) { // If there is an error during login
                %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                            <strong><%=request.getAttribute("Error") %></strong>
                        </div>
                <%
                    }
                %>
            </div>

            <div class="col-xs-4"></div>
            
        </div> <!-- /.container -->
    </body>
</html>

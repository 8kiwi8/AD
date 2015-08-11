<jsp:include page="header.jsp"/>
<%
    String userType = "Guest";
    boolean isLoggedIn = false;
    if (session.getAttribute("userType") != null) {
        userType = (String) session.getAttribute("userType");
        isLoggedIn = true;
    } 
    
    boolean invalidPassword = false;
    
    if (session.getAttribute("Error") != null) {
        if (session.getAttribute("Error").equals("Invalid password.")) {
            invalidPassword = true;
        }
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <%
            String access_error = "Access Error";
            if (session.getAttribute(access_error) != null) { // If there is an error during login
        %>
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute(access_error) %></strong>
                </div>
        <%
            session.removeAttribute(access_error);
            }
        %>
        
        <div class= "<% if (!isLoggedIn) out.println("col-xs-8"); %>">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>News</strong></h3>
                </div>
                <div class="panel-body">
                    <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. 
                        The languages only differ in their grammar, their pronunciation and their most common words.</p>

                    <p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to 
                        have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular 
                        than that of the individual languages.</p>

                    <p>The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be 
                        Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European 
                        languages are members of the same family.</p>

                    <p>Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, 
                        their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive 
                        translators.</p>

                    <p>To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of 
                        the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than 
                        the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified 
                        English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence 
                        is a</p>
                </div>
            </div>
        </div>
        
        <%
            if (!isLoggedIn) {
        %>
            <div class="col-xs-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Login</strong></h3>
                    </div>
                    <div class="panel-body">

                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/LoginServlet">
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
                    String login_error = "Login Error";
                    if (session.getAttribute(login_error) != null) { // If there is an error during login
                %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                            <strong><%=session.getAttribute(login_error) %></strong>
                        </div>
                <%
                    session.removeAttribute(login_error);
                    }
                %>
            </div>
        <%
            }
        %>
                
    </div> <!-- /.container -->
</body>
</html>

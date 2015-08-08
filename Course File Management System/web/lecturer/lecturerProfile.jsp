<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%
    String query = "SELECT * FROM user AS u, profile AS p WHERE p.username = u.username AND p.username = '"+session.getAttribute("User")+"'";
    ResultSet rs = DB.query(query);
    rs.next();
%>

<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Update Lecturer Profile</title>
</head>

<body>
    <div class="container">
    <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/lecturerProfileDB?username=<%=rs.getString(1) %>">
            <div class="form-group">
                 <label for="username" class="control-label col-xs-4">Username</label>
                     <div class="col-xs-8">
                                <input type="text" class="form-control" name="username" value="<%=rs.getString(1) %>" disabled>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="password" class="control-label col-xs-4">Current Password</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="password" value="<%=rs.getString(2) %>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="control-label col-xs-4">Name</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="name" value="<%=rs.getString(4) %>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="control-label col-xs-4">Email Address</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="emailAdd" value="<%=rs.getString(5) %>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phoneNo" class="control-label col-xs-4">Phone Number</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="phoneNo" value="<%=rs.getString(6) %>">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-xs-offset-4 col-xs-8">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </form>
    </div>
</body>
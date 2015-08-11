<%-- 
    Document   : test
    Created on : Aug 11, 2015, 10:24:51 AM
    Author     : Kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=request.getRequestURI().replace(request.getContextPath()+"/", "")%></h1>
        <h1><%=request.getContextPath()%></h1>
        
    </body>
</html>

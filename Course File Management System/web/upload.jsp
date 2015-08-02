<%-- 
    Document   : upload
    Created on : Jul 29, 2015, 10:08:11 PM
    Author     : zavie_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
    </head>
    <body>
        <form method="post" action="<%=request.getContextPath()%>/Upload" enctype="multipart/form-data">
            Select file to upload:
            <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
            <input type="submit" value="Upload" />
        </form>
    </body>
</html>

<%-- 
    Document   : upload
    Created on : Jul 29, 2015, 10:08:11 PM
    Author     : zavie_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, common.DB, java.util.*, CourseFileManagementSystem.Upload" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style type="text/css">
            form{
                margin-left: 10px;
            }
            .fileUpload {
                position: relative;
                overflow: hidden;
                margin: 10px;
            }
            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
            input[type="submit"] {
                display: block;
            }
            #uploadFile {
                line-height: 28px;
            }
        </style>
        <script type="text/javascript">
        function hide() {
            $("#hide").hide();           
        }
        </script>
    </head>
    <body>        
        <form method="post" action="<%=request.getContextPath()%>/Upload" enctype="multipart/form-data">
            <div class="">
                <% String semesterID = request.getParameter("semesterID"); %>
                <% String sectionID = request.getParameter("sectionID"); %>
                <% Upload.setID (semesterID, sectionID); %>
            </div>
            <input id="uploadFile" placeholder="Choose File" disabled="disabled" />
            <div class="fileUpload btn btn-default">
                <span>Browse</span>
                <input id="fileChooser" name="dataFile" type="file" class="upload" />
            </div>
            <input type="submit" value="Upload" class="btn btn-primary"/>
        </form>
        <script type="text/javascript">
            document.getElementById("fileChooser").onchange = function () {
                document.getElementById("uploadFile").value = this.value.slice(12);
                console.log(this.value);
            };
        </script>
    </body>
</html>

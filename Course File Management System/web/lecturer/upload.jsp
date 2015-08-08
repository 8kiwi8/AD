<%-- 
    Document   : upload
    Created on : Jul 29, 2015, 10:08:11 PM
    Author     : zavie_000
--%>

<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, common.DB, java.util.*, CourseFileManagementSystem.Upload" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link href="path/to/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="path/to/js/fileinput.min.js"></script>
        <!-- bootstrap.js below is only needed if you wish to the feature of viewing details
             of text file preview via modal dialog -->       
        <script src="path/to/js/fileinput_locale_<lang>.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
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
            .btn-aidan { 
            color: #F7F3F2; 
            background-color: #7AA7DE; 
            border-color: #EBE017; 
          }         
        .btn-aidan:hover, .btn-aidan:active, .btn-aidan.active, .open > .dropdown-toggle.btn-aidan 
        {
            background: blue;
        }
        
        .btn-aidan:focus
        {
            background: cyan;
        }
 
        .btn-aidan:active, .btn-aidan.active {
            background: cornflowerblue;
            box-shadow: none;
        }
        
        .btn-aidan.outline
        {
            border: 8px solid darkturquoise;
            color: darkturquoise;
        }
        .btn-aidan .badge { 
            color: #7AA7DE; 
            background-color: #F7F3F2; 
          }
        btn-aidan.round 
        {
            border-radius: 8px;
        }
        </style>
    </head>
    <body>        
        <form method="post" action="<%=request.getContextPath()%>/Upload" enctype="multipart/form-data">
            <div class="">
                <% String semesterID = request.getParameter("semesterID"); %>
                <% String sectionID = request.getParameter("sectionID"); %>
                <% String username = request.getParameter("username"); %>
                <% Upload.setID (semesterID, sectionID, username); %>
                
            </div>        
            <table>
                <thead>
                <th>No.</th>
                <th>Label</th>
                <th>Status</th>
                </thead>
                <tbody>
                <%
                    ResultSet rs = DB.query("SELECT * FROM upload_checklist");
                    while(rs.next()) {
                    ResultSet rs2 = DB.query("SELECT * FROM files AS f, section AS s WHERE f.sectionID = s.sectionID AND f.sectionID="+sectionID+
                        " AND s.username='"+username+"' AND f.checklistID="+rs.getString("id"));
                %>
                <tr>
                    <td><%=rs.getString("id") %></td>
                    <td><%=rs.getString("label") %></td>
                    <%
                    if(rs2.next()){
                        %>
                        <td><img src = "<%=request.getContextPath()%>/img/tick.png" width="35" height="35" alt = "submit"></img>                         
                        <%String path = rs2.getString("fileDirectory");
                          Path path1 = Paths.get(path);%>                                                                        
                        <a href = "<%=rs2.getString("fileDirectory")%>" download ="<%=path1.getFileName()%>"> 
                            <button class="btn-aidan" type="button"> Download </button>                     
                        </a>                 
                    <%} else { %>
                     </td>
                    <td>            
                        <div class="fileUpload btn btn-default">
                            <input id="uploadFile-<%=rs.getString("id")%>" placeholder="Choose File" disabled="disabled"/>
                            <button class="browse btn btn-primary" type="button"><i class="glyphicon glyphicon-folder-open"></i> Browse</button>
                            <input name="checklist-<%=rs.getString("id")%>" type="file" cl_ID="<%=rs.getString("id")%>" class="upload" multiple />
                        </div>
                    </td>
            <%
                        }
                        %>
                </tr>
            <% } %>
                <tbody>
            </table>                   
            <input type="submit" value="Upload" class="btn btn-primary"/>
        </form>
        <script type="text/javascript">            
            $(".upload").change(function () 
            {
                cl_id = $(this).attr("cl_id");
                $("#uploadFile-"+cl_id).val($(this).val().slice(12));
                console.log(this.value);
            });           
        </script>
    </body>
</html>

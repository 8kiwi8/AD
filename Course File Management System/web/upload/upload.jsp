<%-- 
    Document   : upload
    Created on : Jul 29, 2015, 10:08:11 PM
    Author     : zavie_000
--%>

<%@page import="CourseFileManagementSystem.Delete"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<jsp:include page="../header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, common.DB, java.util.*, CourseFileManagementSystem.Upload" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
        <!-- bootstrap.js below is only needed if you wish to the feature of viewing details
             of text file preview via modal dialog -->       
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
            .btn btn-primary.outline
            {
                border: 8px solid darkturquoise;
                color: darkturquoise;
            }      
            .btn btn-primary.round 
            {
                border-radius: 8px;
            }
            table a:link {
            color: #666; //dark grey
            font-weight: bold;
            text-decoration:none;
            }
            table a:visited {
                    color: #999999;
                    font-weight:bold;
                    text-decoration:none;
            }
            table a:active,
            table a:hover {
                    color: #bd5a35; //moderate orange
                    text-decoration:underline;
            }
            table {
                    font-family:Arial, Helvetica, sans-serif;
                    color:#666;
                    font-size:12px;
                    text-shadow: 1px 1px 0px #fff;
                    background:#eaebec; //light grayish blue
                    margin:20px;
                    border:#ccc 1px solid;

                    -moz-border-radius:3px;
                    -webkit-border-radius:3px;
                    border-radius:3px;

                    -moz-box-shadow: 0 1px 2px #d1d1d1;
                    -webkit-box-shadow: 0 1px 2px #d1d1d1;
                    box-shadow: 0 1px 2px #d1d1d1;
            }
            table th {
                    padding:21px 25px 22px 25px;
                    border-top:1px solid #fafafa; //very light gray
                    border-bottom:1px solid #e0e0e0; //very light gray

                    background: #ededed; //very light gray
                    background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
                    background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
            }
            table th:first-child {
                    text-align: left;
                    padding-left:20px;
            }
            table tr:first-child th:first-child {
                    -moz-border-radius-topleft:3px;
                    -webkit-border-top-left-radius:3px;
                    border-top-left-radius:3px;
            }
            table tr:first-child th:last-child {
                    -moz-border-radius-topright:3px;
                    -webkit-border-top-right-radius:3px;
                    border-top-right-radius:3px;
            }
            table tr {                  
                    padding-left:20px;
            }
            table td:first-child {
                    text-align: left;
                    padding-left:20px;
                    border-left: 0;
            }
            table td {
                    padding:18px;
                    border-top: 1px solid #ffffff;
                    border-bottom:1px solid #e0e0e0;
                    border-left: 1px solid #e0e0e0;

                    background: #fafafa;
                    background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
                    background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
            }
            table tr.even td {
                    background: #f6f6f6;
                    background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
                    background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
            }
            table tr:last-child td {
                    border-bottom:0;
            }
            table tr:last-child td:first-child {
                    -moz-border-radius-bottomleft:3px;
                    -webkit-border-bottom-left-radius:3px;
                    border-bottom-left-radius:3px;
            }
            table tr:last-child td:last-child {
                    -moz-border-radius-bottomright:3px;
                    -webkit-border-bottom-right-radius:3px;
                    border-bottom-right-radius:3px;
            }
            table tr:hover td {
                    background: #f2f2f2;
                    background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
                    background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
            }
        </style>
    </head>
    <body>
        <div class = "container">
        <form method="post" action="<%=request.getContextPath()%>/Upload" enctype="multipart/form-data">
            <div class="">
                <% String semesterID = request.getParameter("semesterID"); %>
                <% String sectionID = request.getParameter("sectionID"); %>
                <% String username = request.getParameter("username"); %>
                <% Upload.setID (semesterID, sectionID, username); %>
                <% Delete.setID (semesterID, sectionID, username); %>
            </div>        
            <table style = "width:100%">
                <thead>
                <th>No.</th>
                <th>Label</th>
                <th>Status</th>
                </thead>
                <tbody>
                <%
                    ResultSet rs = DB.query("SELECT * FROM upload_checklist");
                    while(rs.next()) {
                    ResultSet rs2 = DB.query("SELECT * FROM files AS f, lecturer_upload AS lu, section AS s WHERE lu.sectionID = s.sectionID AND f.fileID = lu.fileID AND lu.sectionID="+sectionID+
                        " AND lu.checklistID="+rs.getString("checklistID"));
                %>
                <tr>
                    <td><%=rs.getString("checklistID") %></td>
                    <td><%=rs.getString("label") %></td>
                    <td>
                    <%
                    boolean found = false;                   
                    while(rs2.next()){
                        found = true;
                        %>                         
                        <img src = "<%=request.getContextPath()%>/img/tick.png" width="35" height="35" alt = "submit"></img>                         
                        <%String path = rs2.getString("fileDirectory");
                          Path path1 = Paths.get(path);%>                                                                        
                        <a href = "<%=rs2.getString("fileDirectory")%>" download ="<%=path1.getFileName()%>"> 
                            <button class="btn btn-primary" type="button"><i class = "glyphicon glyphicon-download-alt"></i> Download </button>                     
                        </a>                 
                        <a href = "<%=request.getContextPath()%>/Delete?fileID=<%=rs2.getString("fileID")%>&filePath=<%=rs2.getString("fileDirectory")%>" name = "Delete" onclick = "return DeleteConfirmation();"> 
                            <button class="btn btn-danger" type="button"><i class = "glyphicon glyphicon-trash" ></i> Delete </button>                     
                        </a> 
                        <%=path1.getFileName()%>
                        <br>
                        
                    <%}%> 
                    <% if(!found) { %>                              
                        <div class="fileUpload btn btn-default">
                            <input id="uploadFile-<%=rs.getString("checklistID")%>" placeholder="Choose File" disabled = "disabled"/>
                            <button class="browse btn btn-primary" type="button"><i class="glyphicon glyphicon-folder-open"></i> Browse</button>
                            <input name="checklist-<%=rs.getString("checklistID")%>" type="file" cl_ID="<%=rs.getString("checklistID")%>" class="upload" multiple onchange="updateList();" id = "file"/> 
                            <div id = "fileList"> </div>
                        </div>
                    </td>
            <%}%>
                </tr>
            <% } %>
                <tbody>
            </table> <br>                
            <input type="submit" value="Upload" class="btn btn-primary"/>
        </form>
        <script type="text/javascript">            
            $(".upload").change(function () 
            {
                cl_id = $(this).attr("cl_id");
                $("#uploadFile-"+cl_id).val($(this).val().slice(12));
                console.log(this.value);
            });
            
            function DeleteConfirmation ()
            {
                var x = confirm("Are you sure you want to delete?");
                if (x)
                   return true;
                else
                  return false;
            };
            
            updateList = function() {
            var input = document.getElementById('file');
            var output = document.getElementById('fileList');

            output.innerHTML = '<ul>';
            for (var i = 0; i < input.files.length; ++i) {
              output.innerHTML += '<li>' + input.files.item(i).name + '</li>';
            }
            output.innerHTML += '</ul>';
            };
        </script>
        <div>
    </body>
</html>

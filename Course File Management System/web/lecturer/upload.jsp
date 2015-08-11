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
<jsp:include page="../auth.jsp"/>
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
                            <input name="checklist-<%=rs.getString("checklistID")%>" type="file" cl_ID="<%=rs.getString("checklistID")%>" class="upload" multiple />
                            
                        </div>
                    </td>
            <%}%>
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
            
            function DeleteConfirmation ()
            {
                var x = confirm("Are you sure you want to delete?");
                if (x)
                   return true;
                else
                  return false;
            };                      
        </script>
        <div>
    </body>
</html>

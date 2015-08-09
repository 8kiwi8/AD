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
<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, common.DB, java.util.*, CourseFileManagementSystem.Upload" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
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
            <div class="">
                <% String sectionID = request.getParameter("sectionID"); %>
            </div>        
            <table class="table">
                <thead>
                <th>No.</th>
                <th>Label</th>
                <th>Status</th>
                <th>Action</th>
                </thead>
            <tbody>
                <%
                    ResultSet rs = DB.query("SELECT * FROM upload_checklist");
                    while(rs.next()) {
                    ResultSet rs2 = DB.query("SELECT * FROM files AS f, section AS s WHERE f.sectionID = s.sectionID AND f.sectionID="+sectionID+
                        " AND f.checklistID="+rs.getString("id"));
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
                            <button class="btn btn-primary" type="button"><i class = "glyphicon glyphicon-download-alt"></i> Download </button>                     
                        </a>
                        </td>
                        <td>Accept</td>
                    <%} else { %>
                     
                    <td>No Upload yet</td>
                    <td>Remind</td>
            <%}%>
                </tr>
            <% } %>
            </tbody>
            </table>                   
        <div>
    </body>
</html>

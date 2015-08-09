<%-- 
    Document   : createSemester
    Created on : Jul 30, 2015, 4:30:28 PM
    Author     : Kiwi
--%>
<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Semester</title>
    </head>
    <body>
        <div class="container">
            <h1>Current Running Semester</h1>
            <table class="table" id="semesterList">
                <thead>
                    <tr>
                        <th>Year</th>
                        <th>Semester</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = DB.query("SELECT * FROM year_semester");
                        while(rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("year")%></td>
                        <td><%=rs.getString("semester")%></td>
                        <td>
                            <a href="<%=request.getContextPath()%>/DeleteSemesterServlet?semesterID=<%=rs.getString("semesterID")%>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newSemester">Add New Semester</button>
            <div id="newSemester" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            New Section
                        </div>
                        <form class='form-horizontal' action="<%=request.getContextPath()%>/CreateSemesterServlet">
                            <div class="modal-body">
                                <label>Year: </label>
                                <input class="form-control" name="year" placeholder="Year">
                                <label>Semester: </label>
                                <select class="form-control" name="semester">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>    
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class='btn btn-primary'>Submit</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>                        
                            </div>
                        </form>
                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>

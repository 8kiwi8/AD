<%-- 
    Document   : createSemester
    Created on : Jul 30, 2015, 4:30:28 PM
    Author     : Kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*, common.DB" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
        <title>Create Semester</title>
        <script type="text/javascript">
            function addNewSemester() {
                $("#newSemester").show();
                $("#semesterSubmit").show();
                $("#addSemester").hide();
            }
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../auth.jsp"/>
            <h1>Current Running Semester</h1>
            <form class='form-horizontal' action="<%=request.getContextPath()%>/createSemesterServlet">
                <table class="table" id="semesterList">
                    <thead>
                        <tr>
                            <th>Year</th>
                            <th>Semester</th>
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
                        </tr>
                        <% } %>
                        <tr id="newSemester" style="display:none">
                            <td><input class="form-control" name="year" placeholder="Year"></td>
                            <td>
                                <select class="form-control" name="semester">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            <input>
            <button type="submit" class='btn btn-primary' id="semesterSubmit" style="display:none">Submit</button>
            </form>
            <button class="btn btn-primary" id="addSemester" onclick="addNewSemester();">Add</button>
        </div>
    </body>
</html>

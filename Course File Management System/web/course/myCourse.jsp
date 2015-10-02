<%@page import="common.ResultList"%>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
    <script>
        function viewSuperviseCourse (semesterID, course) {
            dataSet = { 
                "semesterID": semesterID,
                "course": course
            };
            var uri = new URI("<%=request.getContextPath()%>/upload/uploadSearch.jsp");
            var query = new URI(uri.search());
            var query = query.setSearch(dataSet);
            window.location.href = uri + query;
        };
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="../component/semesterAutoComplete.jsp"/>
        <table class="table" id="resultTable"
            data-toggle="table" 
            data-search="true"
            data-pagination="true"
            data-show-toggle="true">
            <thead>
                <tr>
                    <th data-sortable="true">Course Code ID</th>
                    <th data-sortable="true">Course Name</th>
                    <th data-sortable="true">Penyelaras</th>
                    <th>Upload</th>
                    <th>Download</th>
                </tr>
            </thead>
            <tbody>
                <%
                String query = "";
                if(request.getParameter("semesterID") != null && !request.getParameter("semesterID").equals("")) {
                String semesterID = request.getParameter("semesterID");
                query = "SELECT * FROM (SELECT semesterID as sID, course_offered_ID AS co_id, username AS penyelaras_id " +
                        "from course_offered) AS co, " +
                        "(SELECT c.courseCode, c.courseID, c.courseName, s.sectionID, s.sectionNO, s.course_offered_id AS co_id " +
                        "FROM section AS s, course AS c, profile AS p WHERE s.courseCode = c.courseCode AND s.courseID = c.courseID " + 
                        "AND s.username = p.username AND s.semesterID = " + semesterID + " AND s.username = '" + session.getAttribute("User") + "') AS mine " +
                        "WHERE co.co_id = mine.co_id";
                } else {
                query = "SELECT * FROM (SELECT semesterID as sID, course_offered_ID AS co_id, username AS penyelaras_id " +
                        "from course_offered) AS co, " +
                        "(SELECT c.courseCode, c.courseID, c.courseName, s.sectionID, s.sectionNO, s.course_offered_id AS co_id " +
                        "FROM section AS s, course AS c, profile AS p WHERE s.courseCode = c.courseCode AND s.courseID = c.courseID " + 
                        "AND s.username = p.username AND s.username = '" + session.getAttribute("User") + "') AS mine " +
                        "WHERE co.co_id = mine.co_id";        
                }
                ResultList rs = DB.query(query);
                while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("courseCode")%> <%=rs.getString("courseID")%></td>
                    <td><%=rs.getString("courseName")%></td>
                    <td>
                        <% 
                        if(rs.getString("penyelaras_id") == null || rs.getString("penyelaras_id").equals("")) {
                        %>
                        <span class="label label-default">No Penyelaras</span>
                        <%
                        } else if(rs.getString("penyelaras_id").equals(session.getAttribute("User"))) {
                        %>
                        <button type="button" class="btn btn-default" onclick="viewSuperviseCourse(<%=rs.getString("sID")%>, '<%=rs.getString("courseCode")%>/<%=rs.getString("courseID")%>');">Manage Course</button>
                        <%
                        } else {
                            String query2 = "SELECT * FROM profile WHERE username = '" + rs.getString("co.penyelaras_id") + "'";
                            ResultList rs2 = DB.query(query2);
                            rs2.next();
                        %>
                        <%=rs2.getString("name")%>
                        <% } %>
                    </td>
                    <td> 
                        <a href = "<%=request.getContextPath()%>/upload/upload.jsp?sectionID=<%=rs.getString("sectionID")%>"> 
                            <button class="btn btn-info" type="button"><i class = "glyphicon glyphicon-upload"></i> View/Upload </button>
                        </a>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/DownloadAsZip?sectionID=<%=rs.getString("sectionID")%>&zipAs=course" target="_blank">
                            <button class="btn btn-primary" type="button"><i class = "glyphicon glyphicon-download-alt"></i> Download Course </button>
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
<jsp:include page="../footer.jsp"/>
</html>

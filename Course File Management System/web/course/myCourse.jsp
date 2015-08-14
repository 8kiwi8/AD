<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Course</title>
    <script>
        function viewSuperviseCourse (course) {
            dataSet = { 
                "semesterID": <%=request.getParameter("semesterID")%>,
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
                </tr>
            </thead>
            <tbody>
                <%
                String query = "";
                if(request.getParameter("semesterID") != null && !request.getParameter("semesterID").equals("")) {
                String semesterID = request.getParameter("semesterID");
                query = "SELECT * FROM (SELECT course_offered_ID AS co_id, username AS penyelaras_id " +
                        "from course_offered) AS co, " +
                        "(SELECT c.courseCode, c.courseID, c.courseName, s.sectionID, s.sectionNO, s.course_offered_id AS co_id " +
                        "FROM section AS s, course AS c, profile AS p WHERE s.courseCode = c.courseCode AND s.courseID = c.courseID " + 
                        "AND s.username = p.username AND s.semesterID = " + semesterID + " AND s.username = '" + session.getAttribute("User") + "') AS mine " +
                        "WHERE co.co_id = mine.co_id";
                } else {
                query = "SELECT * FROM (SELECT course_offered_ID AS co_id, username AS penyelaras_id " +
                        "from course_offered) AS co, " +
                        "(SELECT c.courseCode, c.courseID, c.courseName, s.sectionID, s.sectionNO, s.course_offered_id AS co_id " +
                        "FROM section AS s, course AS c, profile AS p WHERE s.courseCode = c.courseCode AND s.courseID = c.courseID " + 
                        "AND s.username = p.username AND s.username = '" + session.getAttribute("User") + "') AS mine " +
                        "WHERE co.co_id = mine.co_id";        
                }
                ResultSet rs = DB.query(query);
                while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("mine.courseCode")%> <%=rs.getString("mine.courseID")%></td>
                    <td><%=rs.getString("mine.courseName")%></td>
                    <td>
                        <% 
                        if(rs.getString("co.penyelaras_id") == null || rs.getString("co.penyelaras_id").equals("")) {
                        %>
                        <span class="label label-default">No Penyelaras</span>
                        <%
                        } else if(rs.getString("co.penyelaras_id").equals(session.getAttribute("User"))) {
                        %>
                        <button type="button" class="btn btn-default" onclick="viewSuperviseCourse('<%=rs.getString("mine.courseCode")%>/<%=rs.getString("mine.courseID")%>');">Manage Course</button>
                        <%
                        } else {
                            String query2 = "SELECT * FROM profile WHERE username = '" + rs.getString("co.penyelaras_id") + "'";
                            ResultSet rs2 = DB.query(query2);
                            rs2.next();
                        %>
                        <%=rs2.getString("name")%>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
</html>
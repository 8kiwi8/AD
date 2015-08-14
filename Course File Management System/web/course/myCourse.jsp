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
            var uri = new URI("<%=request.getContextPath()%>/report/uploadSearch.jsp");
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
                if(request.getParameter("semesterID") != null) {
                String semesterID = request.getParameter("semesterID");
                String query = "SELECT * FROM (SELECT co.course_offered_ID AS co_id, co.username AS penyelaras_id, " +
                        "p.name AS penyelaras from course_offered AS co, profile AS p WHERE co.username = p.username) AS co, " +
                        "(SELECT c.courseCode, c.courseID, c.courseName, s.sectionID, s.sectionNO, s.course_offered_id AS co_id " +
                        "FROM section AS s, course AS c, profile AS p WHERE s.courseCode = c.courseCode AND s.courseID = c.courseID " + 
                        "AND s.username = p.username AND s.semesterID = " + semesterID + " AND s.username = '" + session.getAttribute("User") + "') AS mine " +
                        "WHERE co.co_id = mine.co_id";
                ResultSet rs = DB.query(query);
                while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("mine.courseCode")%> <%=rs.getString("mine.courseID")%></td>
                    <td><%=rs.getString("mine.courseName")%></td>
                    <td>
                        <% 
                        if(rs.getString("co.penyelaras_id").equals(session.getAttribute("User"))) {
                        %>
                        <button type="button" class="btn btn-default" onclick="viewSuperviseCourse('<%=rs.getString("mine.courseCode")%>/<%=rs.getString("mine.courseID")%>');">Manage Course</button>
                        <%
                        } else {
                        %>
                        <%=rs.getString("penyelaras")%>
                        <% } %>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
</html>
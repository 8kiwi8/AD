<%@page import="common.Pair"%>
<%@page import="CourseFileManagementSystem.LecturerUploadValidator"%>
<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Course</title>
    <script>
        var semester = [];
        $.getJSON("<%=request.getContextPath()%>/ListSemesterServlet", {
            label: "[year] / [semester]",
            value: "[year] / [semester]"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                semester.push(json[key]);
            });
        });
        jQuery(function(){
            $("#semester").autocomplete( {
                source: semester,
                select: function( event, ui ) {
                    dataSet = { 
                        "semesterID":ui.item.semesterID, 
                        "semester":ui.item.label 
                    };
                    var uri = new URI(window.location.href);
                    var query = new URI(uri.search());
                    var query = query.setSearch(dataSet);
                    var uri = uri.pathname();
                    var newQueryUrl = uri + query;
                    window.location.href = uri + query;
                }
            });
        });
    </script>
    <script>
        <%if(request.getParameter("semesterID") != null) { %>
        $( document ).ready( function () {
            $("#semester").val("<%=request.getParameter("semester")%>");
            $(".semester-label").val("<%=request.getParameter("semester")%>");
            $("#filterCourse").prop("disabled", false);
            <% if (request.getParameter("courseLabel") != null) { %>
                $("#filterCourse").val("<%=request.getParameter("courseLabel")%>");
            <% } %>
        });
        var course = [];
        var count = 0;
        var NoResultsLabel = "No supervise course for this semester";
        $.getJSON("<%=request.getContextPath()%>/ListSuperviseCourseServlet", {
            label: "[courseCode] [courseID] [courseName]",
            value: "[courseCode] [courseID] [courseName]",
            semesterID: "<%=request.getParameter("semesterID")%>",
            username: "<%=session.getAttribute("User")%>"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                course.push(json[key]);
                count++;
            });
            if (count === 0) {
                $("#filterCourse").val(NoResultsLabel);
            };
        });
        jQuery(function(){
            $("#filterCourse").autocomplete( {
                source: course,
                select: function( event, ui ) {
                    if (ui.item.label === NoResultsLabel) {
                        event.preventDefault();
                    }
                    dataSet = { 
                        "course_offered_ID":ui.item.course_offered_ID,
                        "courseLabel":ui.item.label
                    };
                    var uri = new URI(window.location.href);
                    var query = new URI(uri.search());
                    var query = query.setSearch(dataSet);
                    var uri = uri.pathname();
                    var newQueryUrl = uri + query;
                    window.location.href = uri + query;
                },
                focus: function (event, ui) {
                    if (ui.item.label === NoResultsLabel) {
                        event.preventDefault();
                    }
                }
            });
        });
        <% } %>
    </script>
</head>
<body>
    <div class="container">
        <input class="form-control" id="semester" placeholder="Choose Semester">
        <input class="form-control" id="filterCourse" placeholder="Filter by Course" disabled>
        <table class="table" id="tblSemesters"
            data-toggle="table" 
            data-search="true"
            data-pagination="true"
            data-show-toggle="true">
            <thead>
                <tr>
                    <th data-sortable="true">Course Code ID</th>
                    <th data-sortable="true">Course Name</th>
                    <th data-sortable="true">Lecturer</th>
                    <th data-sortable="true">Section No</th>
                    <th data-sortable="true">Action</th>
                    <th data-sortable="true">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                if(request.getParameter("course_offered_ID") != null) {
                String semesterID = request.getParameter("semesterID");
                String co_id = request.getParameter("course_offered_ID");
                String query = "SELECT * FROM section as s, profile AS p, course AS c " +
                        "WHERE s.username = p.username AND s.courseCode = c.courseCode AND s.courseID = c.courseID AND s.course_offered_id = " + co_id;
                ResultSet rs = DB.query(query);
                while(rs.next()) {
                    LecturerUploadValidator upload = new LecturerUploadValidator(rs.getString("sectionID"));
                %>
                <tr>
                    <td><%=rs.getString("courseCode")%> <%=rs.getString("courseID")%></td>
                    <td><%=rs.getString("courseName")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("sectionNo")%></td>
                    <td><a href="manageUpload.jsp?sectionID=<%=rs.getString("sectionID")%>">View Upload</a></td>
                    <td>
                        <%
                        LecturerUploadValidator validate = new LecturerUploadValidator(rs.getString("sectionID"));
                        Pair<Integer, Integer> status = validate.complete(); 
                        out.print(status.getLeft() + " / " + status.getRight());
                        %>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
</html>
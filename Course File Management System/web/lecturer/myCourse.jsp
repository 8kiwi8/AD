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
        jQuery(function($) {
            $('form').bind('submit', function() {
                $(this).find(':input').removeAttr('disabled');
            });
        });
    </script>
    <script>
        <%if(request.getParameter("semesterID") != null) { %>
        $( document ).ready( function () {
            $("#semesterID").val("<%=request.getParameter("semesterID")%>");
            $("#semester").val("<%=request.getParameter("semester")%>");
            $(".semester-label").val("<%=request.getParameter("semester")%>");
        });
        <% } %>
    </script>
</head>
<body>
    <div class="container">
        <input class="form-control" id="semester" placeholder="Choose Semester">
        <table class="table" id="tblSemesters"
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
                        if(rs.getString("co.penyelaras_id").equals(session.getAttribute("User")))
                            out.print("View my selaras course");
                        else
                            out.print(rs.getString("co.penyelaras"));
                        %>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
</html>
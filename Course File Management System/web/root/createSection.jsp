<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Semesters - Add Semester</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery.URI.min.js"></script>
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
            $("#semesterID").val("<%=request.getParameter("semesterID")%>");
            $("#semester").val("<%=request.getParameter("semester")%>");
        });
        var course = [];
        var count = 0;
        var NoResultsLabel = "No Course available for this semester yet";
        $.getJSON("<%=request.getContextPath()%>/ListSemesterCourseServlet", {
            label: "[courseCode] [courseID] [courseName]",
            value: "[courseCode] [courseID] [courseName]",
            semesterID: "<%=request.getParameter("semesterID")%>"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                course.push(json[key]);
                count++;
            });
            if (count === 0) {
                $("#course").val(NoResultsLabel);
                $("#course").prop('disabled', true);
                $("#sectionSubmit").prop('disabled', true);
            };
        });
        jQuery(function(){
            $("#course").autocomplete( {
                source: course,
                select: function( event, ui ) {
                    if (ui.item.label === NoResultsLabel) {
                        event.preventDefault();
                    }
                    $("#courseCode").val(ui.item.courseCode);
                    $("#courseID").val(ui.item.courseID);
                    $("#course_offered_ID").val(ui.item.course_offered_ID);
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
    <script>
        var lecturer = [];
        $.getJSON("<%=request.getContextPath()%>/ListLecturerServlet", {
            label: "[name]",
            value: "[name]"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                lecturer.push(json[key]);
            });
        });
        jQuery(function(){
            $("#lecturerName").autocomplete( {
                source: lecturer,
                select: function( event, ui ) {
                $("#username").val(ui.item.username);
            }
            });
        });
    </script>
    <script type="text/javascript">
        function addNewSection() {
            $("#newSection").show();
            $("#sectionSubmit").show();
            $("#addSection").hide();
        }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="../auth.jsp"/>
        
        <input class="form-control" id="semester" placeholder="Choose Semester">
        <form class='form-horizontal' action="<%=request.getContextPath()%>/createSectionServlet">
        <input class="form-control" id="semester" placeholder="Choose Semester">
            <table class="table" id="tblSemesters">
                <thread>
                    <tr>
                        <th>Course</th>
                        <th>Lecturer</th>
                        <th>Section</th>
                    </tr>
                </thread>
                <tbody>
                    <%
                    if(request.getParameter("semesterID") != null) {
                    String semesterID = request.getParameter("semesterID");
                    String query = "SELECT * FROM section AS s, course AS c, profile AS p WHERE " +
                            "s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
                            "s.username = p.username AND s.semesterID = " + semesterID;
                    ResultSet rs = DB.query(query);
                    while(rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("courseCode") + " " + rs.getString("courseID") + " " + rs.getString("courseName")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("sectionID")%></td>
                    </tr>
                    <% } } %>
                    <tr id="newSection" style="display:none">
                        <td>
                            <input class="form-control" name="course" id="course">
                        </td>
                        <td>
                            <input class="form-control" name="lecturerName" id="lecturerName">
                        </td>
                        <td>
                            <select class="form-control" name="sectionID" id="sectionID">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        <div class="hidden">
            <input id="semesterID" name="semesterID">
            <input id="username" name="username">
            <input id="course_offered_ID" name="course_offered_ID">
            <input id="courseCode" name="courseCode">
            <input id="courseID" name="courseID">
        </div>               
        <button type="submit" class='btn btn-primary' id="sectionSubmit" style="display:none">Submit</button>
        </form>
        <% if(request.getParameter("semesterID") != null) {%>
        <button class="btn btn-primary" id="addSection" onclick="addNewSection();return false;">Add</button>
        <% } %>
    </div> <!-- /.container -->
</body>
</html>

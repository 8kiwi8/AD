<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quick Add</title>
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
            $('#courseName').prop('disabled', false);
        });
        var course = [];
        $.getJSON("<%=request.getContextPath()%>/ListCourseServlet", {
            label: "[courseCode] [courseID] [courseName]",
            value: "[courseName]",
            semesterID: "<%=request.getParameter("semesterID")%>"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                course.push(json[key]);
            });
        });
        jQuery(function(){
            $("#courseName").autocomplete( {
                source: course,
                select: function( event, ui ) {
                    dataSet = { 
                        "courseCode":ui.item.courseCode, 
                        "courseID":ui.item.courseID,
                        "courseName":ui.item.courseName
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
        <% } %>
    </script>
    <script>
        <%if(request.getParameter("courseName") != null && request.getParameter("courseID") != null && request.getParameter("courseCode") != null) { %>
        $( document ).ready( function () {
            $("#courseCode").val("<%=request.getParameter("courseCode")%>");
            $("#courseID").val("<%=request.getParameter("courseID")%>");
            $("#courseName").val("<%=request.getParameter("courseName")%>");
        });    
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
        <% } %>
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
        <form class='form-horizontal' action="<%=request.getContextPath()%>/createSectionServlet">
            <input class="form-control" id="semester" placeholder="Choose Semester">
        <div class="">
            <input id="semesterID" name="semesterID">
        </div>
        <input class="form-control" name="courseName" id="courseName" disabled>
        <div class="">
            <input class="form-control" name="courseID" id="courseID">
            <input class="form-control" name="courseCode" id="courseCode">
        </div>
        <div id="reuslt">
            <table class="table" id="table">
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
        </div>
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
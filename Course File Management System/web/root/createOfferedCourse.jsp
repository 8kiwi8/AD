<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Semesters - Add Semester</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
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
                $("#semesterID").val(ui.item.semesterID);
                window.location.href = "<%=request.getContextPath()%>\\root\\createOfferedCourse.jsp?semesterID=" + ui.item.semesterID+"&semester="+ui.item.label;
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
                $("#courseCode").val(ui.item.courseCode);
                $("#courseID").val(ui.item.courseID);
                $("#courseName").val(ui.item.courseName);
                $("#creditHours").val(ui.item.creditHours);
            }
            });
        });
        $( document ).ready( function() {
            $("select.penyelaras").change(function(){
                var course = $(this);
                var selected = course.find(":selected");
                var co_ID = selected.attr("co_ID");
                var inputField = $("#username\\["+co_ID+"\\]");
                inputField.val(selected.attr("username"));
            });
        });
        <% } %>
    </script>
    <script type="text/javascript">
        function addNewCourse() {
            $("#newCourse").show();
            $("#courseSubmit").show();
            $("#addCourse").hide();
        }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="../auth.jsp"/>
        
        <input class="form-control" id="semester" placeholder="Choose Semester">
        <form class='form-horizontal' action="<%=request.getContextPath()%>/CreateOfferedCourseServlet">
            <table class="table" id="tblSemesters">
                <thread>
                    <tr>
                        <th>Course Code</th>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Course Credit Hours</th>
                        <th>Penyelaras</th>
                    </tr>
                </thread>
                <tbody>
                    <%
                    if(request.getParameter("semesterID") != null) {
                    String semesterID = request.getParameter("semesterID");
                    String query = "SELECT c.courseCode, c.courseID, c.courseName, c.creditHours, p.name FROM course_offered AS co, course AS c, profile AS p WHERE " +
                            "co.courseCode = c.courseCode AND co.courseID = c.courseID AND " +
                            "co.username = p.username AND co.semesterID = " + semesterID;
                    ResultSet rs = DB.query(query);
                    while(rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("courseCode")%></td>
                        <td><%=rs.getString("courseID")%></td>
                        <td><%=rs.getString("courseName")%></td>
                        <td><%=rs.getString("creditHours")%></td>
                        <td><%=rs.getString("name")%></td>
                    </tr>
                    <% } } %>
                    <%
                    if(request.getParameter("semesterID") != null) {
                    String semesterID = request.getParameter("semesterID");
                    String query = "SELECT co.course_offered_ID, c.courseCode, c.courseID, c.courseName, c.creditHours FROM course_offered AS co, course AS c WHERE " +
                            "co.courseCode = c.courseCode AND co.courseID = c.courseID AND " +
                            "co.username IS NULL AND co.semesterID = " + semesterID;
                    ResultSet rs = DB.query(query);
                    while(rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("courseCode")%></td>
                        <td><%=rs.getString("courseID")%></td>
                        <td><%=rs.getString("courseName")%></td>
                        <td><%=rs.getString("creditHours")%></td>
                        <td>
                            <!--
                            <input courseID="<%=rs.getString("courseID")%>" courseCode="<%=rs.getString("courseCode")%>" class="form-control penyelaras" co_ID="<%=rs.getString("co.course_offered_ID")%>" name="penyelaras[<%=rs.getString("co.course_offered_ID")%>]">
                            <input class="" id="username[<%=rs.getString("co.course_offered_ID")%>]" name="username[<%=rs.getString("co.course_offered_ID")%>]">
                            -->
                            <%
                                String query2 = "SELECT * FROM profile AS p, user AS u, section AS s WHERE " +
                                    "u.username=p.username AND u.username=s.username AND "+
                                    "s.course_offered_ID = \'"+rs.getString("co.course_offered_ID")+"\' AND s.semesterID="+semesterID;
                                ResultSet rs2 = DB.query(query2);
                            %>
                            <select class="form-control penyelaras">
                                <option value='' disabled selected style='display:none;'>No Penyelaras Yet</option>
                                <% while(rs2.next()) { %>
                                <option id="selected" co_ID="<%=rs.getString("co.course_offered_ID")%>" username="<%=rs2.getString("username")%>"><%=rs2.getString("name")%></option>
                                <% } %>
                            </select>
                            <input class="" id="username[<%=rs.getString("co.course_offered_ID")%>]" name="username[<%=rs.getString("co.course_offered_ID")%>]">
                        </td>
                    </tr>
                    <% } } %>
                    <tr id="newCourse" style="display:none">
                        <td>
                            <input class="form-control" name="courseCode" id="courseCode" disabled>
                        </td>
                        <td>
                            <input class="form-control" name="courseID" id="courseID" disabled>
                        </td>
                        <td>
                            <input class="form-control" name="courseName" id="courseName">
                        </td>
                        <td>
                            <input class="form-control" name="creditHours" id="creditHours" disabled>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        <div class="hidden">
            <input id="semesterID" name="semesterID">
        </div>  
        <% if(request.getParameter("semesterID") != null) {%>
        <button class="btn btn-primary" id="addCourse" onclick="addNewCourse();return false;">Add New Course</button>
        <% } %>
        <button type="submit" class='btn btn-primary' id="courseSubmit">Submit</button>
        </form>
    </div> <!-- /.container -->
</body>
</html>
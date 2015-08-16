<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Section - <%=session.getAttribute("User").toString()%></title>
    <script>
        <%if(request.getParameter("semesterID") != null) { %>
        $( document ).ready( function () {
            $(".semester-label").val($("#semester :selected").text());
            $(".semesterID").val($("#semester").val());
            <% if (request.getParameter("course") != null) { %>
            $(".courseCode").val($("#offeredCourse :selected").attr("courseCode"));
            $(".courseID").val($("#offeredCourse :selected").attr("courseID"));
            $(".course_offered_ID").val($("#offeredCourse").val());
            $(".course-label").val($("#offeredCourse :selected").text());
            <% } %>
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
                $(".course-label").val(NoResultsLabel);
                $(".course-label").prop('disabled', true);
                $("#filterCourse").val(NoResultsLabel);
                $("#filterCourse").prop('disabled', true);
                $("#newSectionBtn").prop('disabled', true);
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
                        "courseCode":ui.item.courseCode,
                        "courseID":ui.item.courseID, 
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
        jQuery(function(){
            $(".course-label").autocomplete( {
                source: course,
                select: function( event, ui ) {
                    if (ui.item.label === NoResultsLabel) {
                        event.preventDefault();
                    }
                    co_ID = $(this).attr('co_ID');
                    $("#course_offered_ID-"+co_ID).val(ui.item.course_offered_ID);
                    $("#courseCode-"+co_ID).val(ui.item.courseCode);
                    $("#courseID-"+co_ID).val(ui.item.courseID);
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
            $(".lecturerName").autocomplete( {
                source: lecturer,
                select: function( event, ui ) {
                co_ID = $(this).attr('co_ID');
                $("#username-"+co_ID).val(ui.item.username);
            }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="col-xs-5">
            <jsp:include page="../component/semesterAutoComplete.jsp"/>
        </div>
        <div class="col-xs-offset-1 col-xs-6">
            <jsp:include page="../component/offeredCourseAutoComplete.jsp">
                <jsp:param name="semesterID" value="<%=request.getParameter("semesterID")%>"/>
            </jsp:include>
        </div>
        <table class="table" id="resultTable"
            data-toggle="table" 
            data-search="true"
            data-pagination="true"
            data-show-toggle="true">
            <thead>
                <tr>
                    <th data-sortable="true">Course</th>
                    <th data-sortable="true">Lecturer</th>
                    <th data-sortable="true">Section</th>
                    <th data-sortable="true">Major</th>
                    <th data-sortable="true">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                if(request.getParameter("semesterID") != null) {
                    String semesterID = request.getParameter("semesterID");
                    String query = "";
                    if(request.getParameter("course_offered_ID") != null && !request.getParameter("course_offered_ID").equals("")) {
                        String co_ID = request.getParameter("course_offered_ID");
                        query = "SELECT * FROM course_offered AS co, section AS s, course AS c, profile AS p WHERE " +
                                "s.course_offered_ID = co.course_offered_ID AND s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
                                "s.username = p.username AND s.semesterID = " + semesterID + " " +
                                "AND s.course_offered_ID = " + co_ID; 
                    }
                    else {
                        query = "SELECT * FROM course_offered AS co, section AS s, course AS c, profile AS p WHERE " +
                                "s.course_offered_ID = co.course_offered_ID AND s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
                                "s.username = p.username AND s.semesterID = " + semesterID;
                    }
                    ResultSet rs = DB.query(query);
                    while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("courseCode") + " " + rs.getString("courseID") + " " + rs.getString("courseName")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("sectionNo")%></td>
                    <td><%=rs.getString("sectionMajor")%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateSection-<%=rs.getString("sectionID")%>">Update</button>
                        <div id="updateSection-<%=rs.getString("sectionID")%>" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        Update Section
                                    </div>
                                    <form class='form-horizontal' action="<%=request.getContextPath()%>/UpdateSectionServlet">
                                        <div class="modal-body">
                                            <label>Semester: </label>
                                            <input class="form-control semester-label" disabled>
                                            <label>Course:</label>
                                            <input class="form-control course-label" co_ID=<%=rs.getString("s.course_offered_ID")%> name="course" value="<%=rs.getString("courseCode")%> <%=rs.getString("courseID")%>" disabled>
                                            <label>Lecturer Name:</label>
                                            <input class="form-control lecturerName" co_ID=<%=rs.getString("s.course_offered_ID")%> name="lecturerName" value="<%=rs.getString("name")%>">
                                            <label>Section Number:</label>
                                            <select class="form-control" name="sectionNo" id="sectionNo">
                                                <% 
                                                for(int i = 1; i <= 10; ++i) {
                                                    if(i == Integer.parseInt((rs.getString("s.sectionNo")))) 
                                                        out.print("<option selected>");
                                                    else
                                                        out.print("<option>");
                                                    out.print(i);
                                                    out.print("</option>");
                                                }
                                                %>
                                            </select>
                                            <label>Section Major:</label>
                                            <select class="form-control" name="sectionMajor" id="sectionMajor">
                                                <%
                                                String[] majors = {"SCSJ", "SCSR", "SCSV", "SCSB"};
                                                for(String major: majors) {
                                                    if(major.equals(rs.getString("s.sectionMajor"))) 
                                                        out.print("<option selected>");
                                                    else
                                                        out.print("<option>");
                                                    out.print(major);
                                                    out.print("</option>");
                                                }
                                                %>
                                            </select>
                                            <div class= "">
                                                <input class="semesterID" name="semesterID">
                                                <input id="username-<%=rs.getString("s.course_offered_ID")%>" name="username" value="<%=rs.getString("s.username")%>">
                                                <input class="course_offered_ID" id="course_offered_ID-<%=rs.getString("s.course_offered_ID")%>" name="course_offered_ID" value="<%=rs.getString("s.course_offered_ID")%>">
                                                <input class="courseCode" id="courseCode-<%=rs.getString("s.course_offered_ID")%>" name="courseCode" value="<%=rs.getString("courseCode")%>">
                                                <input class="courseID" id="courseID-<%=rs.getString("s.course_offered_ID")%>" name="courseID" value="<%=rs.getString("courseID")%>">
                                                <input class="sectionID" name="sectionID" value="<%=rs.getString("sectionID")%>">
                                            </div> 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class='btn btn-primary'>Update Section</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>                        
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/DeleteSectionServlet?sectionID=<%=rs.getString("sectionID")%>" class="btn btn-danger">Delete</a>
                        <%
                        if(rs.getString("co.username") != null && !rs.getString("co.username").equals("") && rs.getString("co.username").equals(rs.getString("s.username"))) {
                        %>
                        <span class="label label-primary">Penyelaras</span>
                        <% } else { %>
                        <a href="<%=request.getContextPath()%>/UpdatePenyelarasServlet?course_offered_ID=<%=rs.getString("s.course_offered_ID")%>&username=<%=rs.getString("s.username")%>" class="btn btn-default">Set Penyelaras</a>
                        <% } %>
                    </td>
                </tr>
                <% } } %>
                </tbody>
        </table>
        <a href="<%=request.getContextPath()%>/root/addSection.jsp?semesterID=<%=request.getParameter("semesterID")%>" class="btn btn-primary">Add New Section</a>
    </div> <!-- /.container -->
</body>
</html>

<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Semesters - Add Semester</title>
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
            $(".semester-label").autocomplete( {
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
            $(".semesterID").val("<%=request.getParameter("semesterID")%>");
            $(".semester-label").val("<%=request.getParameter("semester")%>");
            $("#filterCourse").prop("disabled", false);
            <% if (request.getParameter("courseLabel") != null) { %>
            $(".courseCode").val("<%=request.getParameter("courseCode")%>");
            $(".courseID").val("<%=request.getParameter("courseID")%>");
            $(".course_offered_ID").val("<%=request.getParameter("course_offered_ID")%>");
            $(".course-label").val("<%=request.getParameter("courseLabel")%>");
            $("#filterCourse").val("<%=request.getParameter("courseLabel")%>");
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
        <input class="form-control semester-label" placeholder="Choose Semester">
        <input class="form-control" id="filterCourse" placeholder="Filter by Course" disabled>
        <table class="table" id="tblSemesters">
            <thread>
                <tr>
                    <th>Course</th>
                    <th>Lecturer</th>
                    <th>Section</th>
                    <th>Major</th>
                    <th>Action</th>
                </tr>
            </thread>
            <tbody>
                <%
                if(request.getParameter("semesterID") != null) {
                    String semesterID = request.getParameter("semesterID");
                    String query = "";
                    if(request.getParameter("courseCode") != null && request.getParameter("courseID") != null) {
                        String courseCode = request.getParameter("courseCode");
                        String courseID = request.getParameter("courseID");
                        query = "SELECT * FROM section AS s, course AS c, profile AS p WHERE " +
                                "s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
                                "s.username = p.username AND s.semesterID = " + semesterID + " " +
                                "AND s.courseCode = '" + courseCode + "' AND s.courseID = '" + courseID + "'";
                    }
                    else {
                        query = "SELECT * FROM section AS s, course AS c, profile AS p WHERE " +
                                "s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
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
                                            <div class= "">
                                                <input class="semesterID" name="semesterID">
                                                <input id="username-<%=rs.getString("s.course_offered_ID")%>" name="username" value="<%=rs.getString("username")%>">
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
                    </td>
                </tr>
                <% } } %>
                </tbody>
        </table>
        <% if(request.getParameter("semesterID") != null) {%>
        <button type="button" class="btn btn-primary" id="newSectionBtn" data-toggle="modal" data-target="#newSection">Add New Section</button>
        <div id="newSection" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        New Section
                    </div>
                    <form class='form-horizontal' action="<%=request.getContextPath()%>/CreateSectionServlet">
                        <div class="modal-body">
                            <label>Semester: </label>
                            <input class="form-control semester-label" disabled>
                            <label>Course:</label>
                            <input class="form-control course-label" co_ID="-1" name="course">
                            <label>Lecturer Name:</label>
                            <input class="form-control lecturerName" co_ID="-1" name="lecturerName">
                            <label>Section Number:</label>
                            <select class="form-control" name="sectionNo" id="sectionNo">
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
                            <label>Section Number:</label>
                            <select class="form-control" name="sectionMajor" id="sectionMajor">
                                <option>SCSJ</option>
                                <option>SCSR</option>
                                <option>SCSV</option>
                                <option>SCSB</option>
                            </select>
                            <div class= "">
                                <input class="semesterID" name="semesterID">
                                <input id="username--1" name="username">
                                <input class="course_offered_ID" id="course_offered_ID--1" name="course_offered_ID">
                                <input class="courseCode" id="courseCode--1" name="courseCode">
                                <input class="courseID" id="courseID--1" name="courseID">
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class='btn btn-primary'>New Section</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>                        
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>            
    </div> <!-- /.container -->
</body>
</html>

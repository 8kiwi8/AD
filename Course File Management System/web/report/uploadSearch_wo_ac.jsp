<%@page import="common.Pair"%>
<%@page import="CourseFileManagementSystem.LecturerUploadValidator"%>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Management View</title>
    <!-- SEMESTER AUTO-COMPLETE -->
    <script>
        $(document).ready(function(){
            $("#semester").focus(function(){
                $("#semester").val("");
                $("#semesterID").val("");
            });
        });
        jQuery(function(){
            $("#semester").autocomplete( {
                source: function(request, response) {
                    $.getJSON("<%=request.getContextPath()%>/ListSectionSearchServlet", {
                        label: "[year] / [semester]",
                        value: "[year] / [semester]",
                        term: request.term,
                        col: ["y.year", "y.semester"],
                        semesterID: $("#semesterID").val(),
                        username: $("#username").val(),
                        courseCode: $("#courseCode").val(),
                        courseID: $("#courseID").val(),
                        departmentID: $("#departmentID").val(),
                        viewPermission: "<%=session.getAttribute("viewPermission")%>"
                    }, function( data ) {  
                        console.log(data);
                        response( data );
                    });
                },
                select: function( event, ui ) {
                    $("#semesterID").val(ui.item.semesterID);
                    /*
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
                    */
                }
            });
        });
    </script>
    <!-- DEPARTMENT AUTO-COMPLETE -->
    <script>
        $(document).ready(function(){
            $("#department").focus(function(){
                $("#department").val("");
                $("#departmentID").val("");
            });
        });
        jQuery(function(){
            $("#department").autocomplete( {
                source: function(request, response) {
                    $.getJSON("<%=request.getContextPath()%>/ListSectionSearchServlet", {
                        label: "[department]",
                        value: "[department]",
                        term: request.term,
                        col: ["d.department", "d.departmentID"],
                        semesterID: $("#semesterID").val(),
                        username: $("#username").val(),
                        courseCode: $("#courseCode").val(),
                        courseID: $("#courseID").val(),
                        departmentID: $("#departmentID").val(),
                        viewPermission: "<%=session.getAttribute("viewPermission")%>"
                    }, function( data ) {  
                        console.log(data);
                        response( data );
                    });
                },
                select: function( event, ui ) {
                    $("#departmentID").val(ui.item.departmentID); 
                }
            });
        });
    </script>
    <!-- COURSE AUTO-COMPLETE -->
    <script>
        $(document).ready(function(){
            $("#course").focus(function(){
                $("#course").val("");
                $("#courseCode").val("");
                $("#courseID").val("");
            });
        });
        jQuery(function(){
            $("#course").autocomplete( {
                source: function(request, response) {
                    $.getJSON("<%=request.getContextPath()%>/ListSectionSearchServlet", {
                        label: "[courseCode] [courseID] - [courseName]",
                        value: "[courseCode] [courseID] - [courseName]",
                        term: request.term,
                        col: ["c.courseCode", "c.courseID", "c.courseName"],
                        semesterID: $("#semesterID").val(),
                        username: $("#username").val(),
                        courseCode: $("#courseCode").val(),
                        courseID: $("#courseID").val(),
                        departmentID: $("#departmentID").val(),
                        viewPermission: "<%=session.getAttribute("viewPermission")%>"
                    }, function( data ) {  
                        console.log(data);
                        response( data );
                    });
                },
                select: function( event, ui ) {
                    $("#courseCode").val(ui.item.courseCode); 
                    $("#courseID").val(ui.item.courseID); 
                }
            });
        });
    </script>
    <!-- LECTURER AUTO-COMPLETE -->
    <script>
        $(document).ready(function(){
            $("#lecturer").focus(function(){
                $("#lecturer").val("");
                $("#username").val("");
            });
        });
        jQuery(function(){
            $("#lecturer").autocomplete( {
                source: function(request, response) {
                    $.getJSON("<%=request.getContextPath()%>/ListSectionSearchServlet", {
                        label: "[name]",
                        value: "[name]",
                        term: request.term,
                        col: ["p.username", "p.name"],
                        semesterID: $("#semesterID").val(),
                        username: $("#username").val(),
                        courseCode: $("#courseCode").val(),
                        courseID: $("#courseID").val(),
                        departmentID: $("#departmentID").val(),
                        viewPermission: "<%=session.getAttribute("viewPermission")%>"
                    }, function( data ) {  
                        console.log(data);
                        response( data );
                    });
                },
                select: function( event, ui ) {
                    $("#username").val(ui.item.username); 
                }
            });
        });
    </script>
    <script>
        $(document).ready(function() {
           $("#viewPermission").val("<%=session.getAttribute("viewPermission")%>"); 
        });
    </script>
</head>
<body>
    <div class="container">
        <form class='form-horizontal' action="<%=request.getContextPath()%>/SectionSearch">
            <input class="form-control" id="semester" placeholder="Choose Semester">
            <input class="form-control" id="semesterID" name="semesterID" placeholder="SemesterID here">
            <input class="form-control" id="department" placeholder="Filter by Department">
            <input class="form-control" id="departmentID" name="departmentID" placeholder="DepartmentID here">
            <input class="form-control" id="course" placeholder="Filter by Course">
            <input class="form-control" id="courseCode" name="courseCode" placeholder="CourseCode here">
            <input class="form-control" id="courseID" name="courseID" placeholder="CourseID here">
            <input class="form-control" id="lecturer" placeholder="Filter by Lecturer">
            <input class="form-control" id="username" name="username" placeholder="username here">
            <input class="form-control" id="viewPermission" name="viewPermission" placeholder="View Permission">
            <button class="btn btn-primary" id="addCourse" >Search</button>
        </form>
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
            </tbody>
        </table>
    </div> <!-- /.container -->
</body>
</html>
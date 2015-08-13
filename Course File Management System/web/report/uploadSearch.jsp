<%@page import="common.Pair"%>
<%@page import="CourseFileManagementSystem.LecturerUploadValidator"%>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Management View</title>
    <script>
        $(document).ready(function() {
           $("#viewPermission").val("<%=session.getAttribute("viewPermission")%>"); 
           $('#sectionResult').bootstrapTable({
                url: "<%=request.getContextPath()%>/SectionSearch",
                search: "true",
                pagination: "true",
                queryParams: function (p) {
                    return {
                        semesterID:$("#semester").val(),
                        departmentID:$("#departmentName").val(),
                        course:$("#courseName").val(),
                        username:$("#lecturerName").val(),
                        viewPermission:$("#viewPermission").val()
                    };
                },
                columns: [{
                    field: 'course',
                    title: 'Course',
                    sortable: 'true'
                }, {
                    field: 'name',
                    title: 'Lecture',
                    sortable: 'true'
                }, {
                    field: 'sectionNo',
                    title: 'Section No',
                    sortable: 'true'
                }, {
                    field: 'sectionID',
                    title: 'Section ID',
                    sortable: 'true'
                }, {
                    field: 'operate',
                    title: 'Item Operate',
                    align: 'center',
                    valign: 'middle',
                    clickToSelect: false,
                    events: "operateEvents",
                    formatter: operateFormatter
                }]
            });
            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like action, row: ' + JSON.stringify(row));
                },
                'click .remove': function (e, value, row, index) {
                    $('#sectionResult').bootstrapTable('remove', {
                        field: 'sectionID',
                        values: [row.sectionID]
                    });
                }
            };
            function operateFormatter(value, row, index) {
                return [
                    '<a class="like" href="javascript:void(0)" title="Like">',
                    '<i class="glyphicon glyphicon-heart"></i>',
                    '</a>  ',
                    '<a class="remove" href="javascript:void(0)" title="Remove">',
                    '<i class="glyphicon glyphicon-remove"></i>',
                    '</a>'
                ].join('');
            }
        });
    </script>
</head>
<body>
    <div class="container">
        <form class='form-horizontal' action="<%=request.getContextPath()%>/SectionSearch">
            <jsp:include page="../component/semesterAutoComplete.jsp"/>
            <jsp:include page="../component/departmentAutoComplete.jsp"/>
            <jsp:include page="../component/courseAutoComplete.jsp"/>
            <jsp:include page="../component/lecturerAutoComplete.jsp"/>
            <input id="viewPermission">
            <button class="btn btn-primary" id="addCourse" >Search</button>
        </form>
        <table class="table" id="sectionResult">
        </table>
    </div> <!-- /.container -->
</body>
</html>
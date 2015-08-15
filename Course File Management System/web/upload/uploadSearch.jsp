<%@page import="common.ViewPermission"%>
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
                    sortable: true
                }, {
                    field: 'name',
                    title: 'Lecture',
                    sortable: true
                }, {
                    field: 'sectionNo',
                    title: 'Section No',
                    sortable: true
                }, {
                    field: 'stat',
                    title: 'Upload Status',
                }, {
                    field: 'sectionID',
                    title: 'Section ID',
                    visible: false
                }, {
                    field: 'operate',
                    title: 'Manage',
                    align: 'center',
                    valign: 'middle',
                    clickToSelect: false,
                    events: "operateEvents",
                    formatter: operateFormatter
                }]
            });
            window.operateEvents = {
                'click .stats': function (e, value, row, index) {
                    dataSet = { 
                        "sectionID": [row.sectionID]
                    };
                    var uri = new URI("<%=request.getContextPath()%>/upload/upload.jsp");
                    var query = new URI(uri.search());
                    var query = query.setSearch(dataSet);
                    window.location.href = uri + query;
                }
            };
            function operateFormatter(value, row, index) {
                return [
                    '<a class="stats" href="javascript:void(0)" title="Stats">',
                    '<i class="glyphicon glyphicon-stats"></i>',
                    '</a>  '
                ].join('');
            }
        });
    </script>
</head>
<body>
    
    <div class="container">
        <form class='form-horizontal' action="<%=request.getContextPath()%>/SectionSearch">
            <jsp:include page="../component/semesterAutoComplete.jsp"/>
            <jsp:include page="../component/departmentAutoComplete.jsp">
                <jsp:param name="permission" value="<%=session.getAttribute("viewPermission")%>"/>
            </jsp:include>
            <jsp:include page="../component/courseAutoComplete.jsp">
                <jsp:param name="permission" value="<%=session.getAttribute("viewPermission")%>"/>
            </jsp:include>
            <jsp:include page="../component/lecturerAutoComplete.jsp">
                <jsp:param name="permission" value="<%=session.getAttribute("viewPermission")%>"/>
            </jsp:include>
            <button class="btn btn-primary" id="addCourse" >Search</button>
        </form>
        <table class="table" id="sectionResult">
        </table>
    </div> <!-- /.container -->
</body>
</html>
<%-- 
    Document   : Offered Course Auto Complete
    Created on : Aug 13, 2015, 12:23:47 AM
    Author     : Kiwi
--%>
<%@page import="AutoComplete.Select2OptionGenerator"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<select class="form-control offeredCourse" style="width:100%" disabled="">
<%
    if(request.getParameter("semesterID") != null) { 
        String semesterID = request.getParameter("semesterID");
        String query = "Select co.course_offered_ID, c.courseName, c.courseCode, c.courseID FROM " +
                            "course_offered AS co, course AS c WHERE " +
                            "co.courseCode = c.courseCode AND co.courseID = c.courseID AND " +
                            "co.semesterID = " + semesterID;
        HashMap<String,String> extra = new HashMap();
        extra.put("value", "[course_offered_ID]");
        extra.put("text", "[courseCode] [courseID] [courseName]");
        out.print(Select2OptionGenerator.generate(query, "text", extra));
    }
%>
</select>
<script>
    <% if(request.getParameter("semesterID") != null) { %>
        $(".offeredCourse").prop("disabled", false);
    <% } %>
    $(".offeredCourse").select2({
        placeholder: "Find Offered Course"
    });
    <% if(request.getParameter("course_offered_ID") != null) { %>
    $(".offeredCourse").select2("val", <%=request.getParameter("course_offered_ID")%>);
    buildWithSemester();
    <% } else { %>
    $(".offeredCourse").select2("val", "");    
    <% } %>
    $(".offeredCourse").change(function() {
        <% if(request.getParameter("clickAction") != null) {
                out.print(request.getParameter("clickAction"));
        } else { %>
        select = $(this).find("selected");
        dataSet = { 
            "course_offered_ID":select.val()
        };
        var uri = new URI(window.location.href);
        var query = new URI(uri.search());
        var query = query.setSearch(dataSet);
        var uri = uri.pathname();
        var newQueryUrl = uri + query;
        window.location.href = newQueryUrl; 
        <% } %>
    });
</script>
<div class= "hidden">
    <input id="username--1" name="username">
    <input class="course_offered_ID" id="course_offered_ID--1" name="course_offered_ID">
    <input class="courseCode" id="courseCode--1" name="courseCode">
    <input class="courseID" id="courseID--1" name="courseID">
</div> 
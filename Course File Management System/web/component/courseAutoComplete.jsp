<%-- 
    Document   : courseAutoComplete
    Created on : Aug 13, 2015, 12:23:47 AM
    Author     : Kiwi
--%>
<%@page import="AutoComplete.Select2OptionGenerator"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<select class="form-control" id="courseName" style="width:100%">
<%
    String query = "Select * FROM course ORDER BY courseCode, courseID";
    HashMap<String,String> extra = new HashMap();
    extra.put("value", "[courseCode]/[courseID]");
    extra.put("text", "[courseCode] [courseID] [courseName]");
    out.print(Select2OptionGenerator.generate(query, "text", extra));
%>
</select>
<div class="">
<input class="form-control" name="courseCode" id="courseCode" disabled>
<input class="form-control" name="courseID" id="courseID" disabled>
<input class="form-control" name="creditHours" id="creditHours" disabled>
</div>
<script>
    $("#courseName").select2({
        placeholder: "Select A Course"
    });
    <% if(request.getParameter("course") != null) { %>
    $("#courseName").select2("val", <%=request.getParameter("course")%>);
    buildWithSemester();
    <% } else { %>
    $("#courseName").select2("val", "");    
    <% } %>
    $("#courseName").change(function() {
        select = $("#courseName :selected");
        $("#courseCode").val(select.attr("courseCode"));
        $("#courseID").val(select.attr("courseID"));
        $("#creditHours").val(select.attr("creditHours"));
    });
</script>
<%-- 
    Document   : updateSection
    Created on : Sep 26, 2015, 11:16:03 AM
    Author     : Kiwi
--%>
<jsp:include page="../header.jsp"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sectionID = request.getParameter("sectionID");
        String query = "SELECT * FROM course_offered AS co, section AS s, course AS c, profile AS p WHERE " +
                                "s.course_offered_ID = co.course_offered_ID AND s.courseCode = c.courseCode AND s.courseID = c.courseID AND " +
                                "s.username = p.username AND s.sectionID = " + sectionID;
	ResultSet rs = DB.query(query);
        rs.next();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Section</title>
    </head>
    <body>
        <div class="container">
            <form class='form-horizontal' action="<%=request.getContextPath()%>/UpdateSectionServlet">
                <div class="modal-body">
                    <label>Course:</label>
                    <input class="form-control" name="course" value="<%=rs.getString("courseCode")%> <%=rs.getString("courseID")%> - <%=rs.getString("courseName")%>" disabled>
                    <label>Lecturer Name:</label>
                    <jsp:include page="../component/lecturerAutoComplete.jsp">
                        <jsp:param name="username" value='<%=rs.getString("s.username")%>'/>
                        <jsp:param name="prebuild" value='yes'/>
                        <jsp:param name="selectAction" value='none'/>
                    </jsp:include>
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
                        String[] majors = {"SCSJ", "SCSR", "SCSV", "SCSB", "Mixed", "UNSRI"};
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
                    <div class= "hidden">
                        <input class="sectionID" name="sectionID" value="<%=rs.getString("sectionID")%>">
                    </div> 
                    <button type="submit" class='btn btn-primary'>Update Section</button>
            </form>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>

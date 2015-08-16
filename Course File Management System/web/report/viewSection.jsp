<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB, java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String courseID = request.getParameter("courseID");
        String username = request.getParameter("username");
        
        // Get the sectionID for the said course for the said lecturer
        String sql = "SELECT * FROM section WHERE courseID="+courseID+" AND username='"+username+"'";
        ResultSet section_rs = DB.query(sql);
        section_rs.next();
        String sectionID = section_rs.getString(3);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= section_rs.getString(5) %> <%= courseID %></title>
        <script type="text/javascript">
            // Test
            var semester = [];
            $.getJSON("<%=request.getContextPath()%>/ListSemesterServlet", {
                label: "[year] / [semester]",
                value: "[year] / [semester]"               
            },
            function( json ) {
                var keys = Object.keys(json);
                console.table(keys);
                keys.forEach(function(key){
                    semester.push(json[key]);
                });
            });
        </script>
    </head>
    <body>
        <h1><%= section_rs.getString(5) %> <%= courseID %></h1>
        Section:<%= section_rs.getString(7) %>
        
        <%
            ResultSet rs4;
            ResultSet rs5;
            ResultSet rs6;
            String checklistID;
            String label;
            String fileID;
            String fileDirectory;
            ArrayList cl_arr = new ArrayList();
            
            // Get the list of files for the section
            sql = "SELECT * FROM lecturer_upload WHERE sectionID="+sectionID+" ORDER BY checklistID";
            ResultSet lectup_rs = DB.query(sql);
            
            // Get the information for each files
            while(lectup_rs.next()) {
                // Get the checklistID based on the fileID
                fileID = lectup_rs.getString(1);
                sql = "SELECT * FROM lecturer_upload WHERE fileID="+fileID;
                rs4 = DB.query(sql);
                rs4.next();
                checklistID = rs4.getString(3);
                
                // Get the fileDirectory based on the fileID
                sql = "SELECT * FROM files WHERE fileID="+fileID;
                rs5 = DB.query(sql);
                rs5.next();
                fileDirectory = rs5.getString(2);
                
                // Get the label for the file based on the checklistID
                /*sql = "SELECT * FROM upload_checklist WHERE checklistID="+checklistID;
                rs6 = DB.query(sql);
                rs6.next();
                label = rs6.getString(2);*/
                
                sql = "SELECT * FROM upload_checklist";
                rs6 = DB.query(sql);
                
                while (rs6.next()) {
                    cl_arr.add(rs6.getString(2));
                }
        %>
        <a href="<%= fileDirectory %>"><p><%= cl_arr.get(Integer.parseInt(checklistID)-1) %></p></a>
        <% } %>
    </body>
</html>

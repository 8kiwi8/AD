<%-- 
    Document   : section
    Created on : Aug 4, 2015, 1:55:40 PM
    Author     : zavie_000
--%>
<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
        <title>Section</title> 
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
            }           
            });
        });        
        </script>
        <script>              
        var section = [];
        $.getJSON("<%=request.getContextPath()%>/ListCourseSectionServlet", 
        {
            label: "[courseCode] [courseID] ([courseName]) - [sectionNo]",
            value: "[sectionID]",
            semesterID: "<%=request.getParameter("semesterID")%>"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                section.push(json[key]);
            });
        });
        jQuery(function(){
            $("#section").autocomplete( {
                source: section,
                select: function( event, ui ) {
                $("#sectionID").val(ui.item.sectionID);      
                $("#semesterID").val(ui.item.semesterID);
                window.location.href = "<%=request.getContextPath()%>\\upload.jsp?semesterID=" + ui.item.semesterID + "&sectionID="+ui.item.value; 
            }
            });          
        });
        </script>
        <script type="text/javascript">
        function show() {
            $("#hide").show();           
        }
        </script>
        <style type="text/css">
        #container, #hide {
          max-width: 340px;
          margin: 0 auto;
          padding: 20px;
          border-radius: 8px;
        }   
        #hide {
            display: none;
        }
        #hide:target {
            display: block;
        }
        </style>
    </head>
    <body>                          
        <div id = "container" class = "form-group">
            <label for="semester" style = "color:Coral;"> Semester: </label>
            <input class="form-control" name="semesterID" placeholder = "Choose Semester" id = "semester"> 
            <br>               
            <input class="btn btn-primary" type="submit" value="Submit" onclick = "show()">
            <br>
        </div>
        <form method = "get" action = "<%=request.getContextPath()%>/upload.jsp">
        <div id="hide" class="form-group">
             <label for="sectionID" style = "color:Coral;"> Section: </label>
             <input class = "form-control" id="semesterID" name = "semesterID"/> <br>
             <input class="form-control" name="sectionID" placeholder = "Choose Section" id = "section">
             <br>
             <input type = "submit" value = "Submit" class = "btn btn-primary">
        </div>
        </form>
    </body>
</html>

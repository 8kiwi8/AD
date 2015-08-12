<%-- 
    Document   : section
    Created on : Aug 4, 2015, 1:55:40 PM
    Author     : zavie_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">               
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
                dataSet = {
                        "semester":ui.item.label, 
                        "semesterID":ui.item.semesterID                                               
                    };
            }           
            });
        });        
        </script>
        <script>       
        var section = [];
        jQuery(function(){
            $("#section").autocomplete( {
            source: function(request, response) {$.getJSON("<%=request.getContextPath()%>/ListCourseSectionServlet", 
                {
                    term: request.term,
                    label: "[courseCode] [courseID] [courseName] - [sectionNo]",
                    value: "[sectionID]",
                    semesterID: $("#semesterID").val(),
                    username: "<%=session.getAttribute("User")%>"
                }, function( data ) {  
                    console.log(data);
                    response( data );
                });},                   
                select: function( event, ui ) {
                    $("#username").val(ui.item.username);
                    dataSet = 
                    {                        
                        "courseID": ui.item.courseID,
                        "username": ui.item.username,
                        "sectionID": ui.item.value,
                        "sectionNo": ui.item.sectionNo,
                        "courseCode": ui.item.courseCode,                        
                        "courseName": ui.item.courseName,
                        "semesterID": ui.item.semesterID                     
                    };                                       
                }
            });          
        });
        </script>
        <script type="text/javascript">
        function show() 
        {
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
        <form method = "get" action = "<%=request.getContextPath()%>/upload/upload.jsp" name = "section">
        <div id="hide" class="form-group">
             <label for="sectionID" style = "color:Coral;"> Section: </label>           
             <input class = "form-control" id="semesterID" name = "semesterID" type = "hidden"/> 
             <input class="form-control" name="username" id = "username" type="hidden">
             <input class="form-control" name="sectionID" placeholder = "Choose Section" id = "section"> <br>
             <input type = "submit" value = "Submit" class = "btn btn-primary">
        </div>
        </form>
    </body>
</html>

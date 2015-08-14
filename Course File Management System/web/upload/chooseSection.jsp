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
                    value: "[courseCode] [courseID] [courseName] - [sectionNo]",
                    sectionID: "[sectionID]",
                    semesterID: "<%=request.getParameter("semesterID")%>",
                    username: "<%=session.getAttribute("User")%>"
                }, function( data ) {  
                    console.log(data);
                    response( data );
                });},                   
                select: function( event, ui ) {
                    $("#sectionID").val(ui.item.sectionID);                                
                }
            });          
        });       
        </script>
        <script type="text/javascript">
        function show() 
        {
            $("#hide").show();           
        }  
        
        function submit ()
        {
            var sec = $("#sectionID").val();
            document.course.sectionID.value = sec;
            return true;
        }
        
        setTimeout(function(){$("#container1").fadeOut();}, 3000);
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
            <jsp:include page = "../component/semesterAutoComplete.jsp"/> 
            <br>               
            <input class="btn btn-primary" type="submit" value="Submit" onclick = "show()">
            <% String access_error = "Access Error";
            if (session.getAttribute(access_error) != null) { 
            %>
                <div class="alert alert-danger" role="alert" id = "container1">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" style="padding-right: 10px"></span>
                    <strong><%=session.getAttribute(access_error) %></strong>
                </div>
            <%
            session.removeAttribute(access_error);
            }%>
        </div>
        <form method = "get" action = "<%=request.getContextPath()%>/upload/upload.jsp" name = "course">
        <div id="hide" class="form-group">
             <label style = "color:Coral;"> Course: </label>           
             <input class = "form-control" id="semester"  name = "semesterID" value="<%=request.getParameter("semesterID")%>" type = "hidden"/> 
             <input class="form-control" name="username" id = "username" type="hidden">
             <input class="form-control" name="section" placeholder = "Choose Course" id = "section" value = "" onchange = "submit();"> 
             <input class="form-control" id="sectionID" name="sectionID" value = "" type = "hidden"><br>            
             <input type = "submit" value = "Submit" class = "btn btn-primary"> 
        </div>
        </form>
    </body>
</html>

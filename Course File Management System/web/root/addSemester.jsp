<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%
    ResultSet rs = DB.query("SELECT * FROM course");
    ResultSet rs2 = DB.query("SELECT * FROM profile, user WHERE user.username = profile.username AND user.usertype = 'lecturer' AND profile.status = 'Active'");
    int courseCount = 0; // Count for courses
    int lecturerCount = 0;
    int sectionCount = 0;
    
%>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Semesters - Add Semester</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript">
        function addRowToTable()
        {
            var tbl = document.getElementById('tblSemesters');
            var lastRow = tbl.rows.length;
            
            // if there's no header row in the table, then iteration = lastRow + 1
            var iteration = lastRow;
            var row = tbl.insertRow(lastRow);

            // left cell
            var cellLeft = row.insertCell(0);
            var courseSel = document.createElement('select');
            courseSel.name = 'courseNameForRow' + iteration;
            courseSel.className = "form-control"; // Bootstrapify
            
            <% while (rs.next() && rs.getString(3) != null) { %>
                courseSel.options[<%= courseCount %>] = new Option('<%= rs.getString(3) %>', 'SCSJ0001');;
            <%  courseCount += 1;  %>
                cellLeft.appendChild(courseSel);
            <% } %>
            
            // middle cell
            var cellMiddle = row.insertCell(1);
            var lecturerSel = document.createElement('select');
            lecturerSel.name = 'lecturerNameForRow' + iteration;
            lecturerSel.className = "form-control"; // Bootstrapify
            
            <% while (rs2.next() && rs2.getString(1) != null) { %>
                lecturerSel.options[<%= lecturerCount %>] = new Option('<%= rs2.getString(1) %>', 'SCSJ0001');;
            <%  lecturerCount += 1;  %>
                cellMiddle.appendChild(lecturerSel);
            <% } %>
            
            // right cell
            var cellRight = row.insertCell(2);
            var sectionSel = document.createElement('select');
            sectionSel.name = 'sectionForRow' + iteration;
            sectionSel.className = "form-control"; // Bootstrapify
            for (var numOfSections = 1; numOfSections <= 10; numOfSections++) {
                sectionSel.options[numOfSections-1] = new Option(("0" + numOfSections).slice(-2), "section" + numOfSections);
            }
            
            // ("0" + myNumber).slice(-2); = display number in 2 digit format (i.e 1 -> 01)
            cellRight.appendChild(sectionSel);
        }
        
        function removeRowFromTable()
        {
            var tbl = document.getElementById('tblSemesters');
            var lastRow = tbl.rows.length;
            if (lastRow > 2) tbl.deleteRow(lastRow - 1);
        }
    </script>
    <script>
        var items = [];
        $.getJSON("<%=request.getContextPath()%>/AutoCompleteServlet", {
            table: "course",
            label: "[courseCode] [courseID] [courseName]",
            value: "[courseName]"
        },
        function( json ) {
            var keys = Object.keys(json);
            keys.forEach(function(key){
                items.push(json[key]);
            });
        });
        jQuery(function(){
            $("#course").autocomplete( {
                source: items
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="panel">
            <form>
                <div class="form-group">
                    <label for="inputYear">Year</label>
                    <input type="number" class="form-control" id="inputYear" placeholder="Year">
                </div>
                
                <div class="form-group">
                    <label for="inputSemester">Semester</label>
                    <input type="number" class="form-control" id="inputSemester" placeholder="Semester">
                </div>
                
            </form>
        </div>
        
        
        
        <table class="table" id="tblSemesters">
            <thread>
                <tr>
                    <th>Course</th>
                    <th>Lecturer</th>
                    <th>Section</th>
                </tr>
            </thread>
            <tbody>
                <tr>
                    <td>
                        <input class="form-control" id="course">
                    </td>
                    <td>
                        <select class="form-control" id="lecturer">
                            <% 
                                rs2.beforeFirst(); // move cursor back to 0 = 1st row
                                while (rs2.next() && rs2.getString(1) != null) { 
                            %>
                                    <option><%=rs2.getString(1) %></option>
                            <%  }  %>
                        </select>
                    </td>
                    <td>
                        <select class="form-control" id="section">
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <button type="submit" class="btn btn-success" onclick="addRowToTable();">Add</button>
        <button type="submit" class="btn btn-danger" onclick="removeRowFromTable();">Remove</button>
        <button type="submit" class="btn btn-primary" onclick="removeRowFromTable();">Submit</button>
        
    </div> <!-- /.container -->
</body>
</html>
<%@ page import ="java.sql.*, common.DB" %>
<%
    ResultSet rs = DB.query("SELECT * FROM userlogin");
    int courseCount = 0; // Count for courses
    int lecturerCount = 0;
    
%>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Semesters</title>
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
            courseSel.options[0] = new Option('Object Oriented Programming', 'SCSJ0001');
            courseSel.options[1] = new Option('Software Engineering', 'SCSJ0002');
            courseSel.options[2] = new Option('Requirement Engineering', 'SCSJ0003');
            courseSel.options[3] = new Option('Application Development', 'SCSJ0004');
            cellLeft.appendChild(courseSel);

            // middle cell
            var cellMiddle = row.insertCell(1);
            var lecturerSel = document.createElement('select');
            lecturerSel.name = 'lecturerNameForRow' + iteration;
            lecturerSel.className = "form-control"; // Bootstrapify
            lecturerSel.options[0] = new Option('Dr. Hishamuddin Asmuni', 'value0');
            lecturerSel.options[1] = new Option('Ng Yan Xin', 'value1');
            lecturerSel.options[2] = new Option('Toh Chin Eng', 'value1');
            lecturerSel.options[3] = new Option('Ahmad Rafiuddin', 'value1');
            lecturerSel.options[4] = new Option('Akmal Irfan', 'value1');
            cellMiddle.appendChild(lecturerSel);
            
            // right cell
            var cellRight = row.insertCell(2);
            var sectionSel = document.createElement('select');
            sectionSel.name = 'sectionForRow' + iteration;
            sectionSel.className = "form-control"; // Bootstrapify
            sectionSel.options[0] = new Option('01', 'value0');
            sectionSel.options[1] = new Option('02', 'value1');
            sectionSel.options[2] = new Option('03', 'value1');
            sectionSel.options[3] = new Option('04', 'value1');
            sectionSel.options[4] = new Option('05', 'value1');
            cellRight.appendChild(lecturerSel);
        }
        
        function removeRowFromTable()
        {
            var tbl = document.getElementById('tblSemesters');
            var lastRow = tbl.rows.length;
            if (lastRow > 2) tbl.deleteRow(lastRow - 1);
        }
    </script>
</head>
<body>
    <div class="container">
    
        <div class="jumbotron">
            <h1>Course File Management System</h1>
            <p>Upload all your course-related documents here for the usage of students and administrators.</p>
        </div>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="rootHome.jsp">Home</a></li>
                    <li><a href="viewLecturers.jsp">Lecturers</a></li>
                    <li><a href="viewCourses.jsp">Courses</a></li>
                    <li class="active"><a href="#">Semesters</a></li>
                    
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="logOut.html">Log Out</a></li>
                </ul>
            </div> <!-- /.container-fluid -->
        </nav>
        
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
                        <select class="form-control" id="course">
                            <option>Object Oriented Programming</option>
                            <option>Software Quality Assurance</option>
                            <option>Probability</option>
                            <option>Academic English</option>
                            <option>Application Development</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-control" id="lecturer">
                            <option>Dr. Hishamuddin Asmuni</option>
                            <option>Ahmad Rafiuddin</option>
                            <option>Ng Yan Xin</option>
                            <option>Toh Chin Eng</option>
                            <option>Akmal Irfan</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-control" id="section">
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
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
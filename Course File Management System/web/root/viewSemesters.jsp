<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Login</title>
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
        
        
        
        <table class="table">
            <caption>List of Semesters</caption>
            <thread>
                <tr>
                    <th>Year</th>
                    <th>Semester</th>
                    <th><a href="addSemester.jsp"><button type="submit" class="btn btn-primary btn-xs">Add Semester</button></a></th>
                </tr>
            </thread>
            <tbody>
                <tr>
                    <td>20142015</td>
                    <td>3</td>
                    <td>
                        <button type="submit" class="btn btn-info btn-xs">Details</button>
                        <button type="submit" class="btn btn-danger btn-xs">Remove</button>
                    </td>
                </tr>
                <tr>
                    <td>20152016</td>
                    <td>1</td>
                    <td>
                        <button type="submit" class="btn btn-info btn-xs">Details</button>
                        <button type="submit" class="btn btn-danger btn-xs">Remove</button>
                    </td>
                </tr>
                <tr>
                    <td>20152016</td>
                    <td>2</td>
                    <td>
                        <button type="submit" class="btn btn-info btn-xs">Details</button>
                        <button type="submit" class="btn btn-danger btn-xs">Remove</button>
                    </td>
                </tr>
            </tbody>
        </table>
           
        
      
        
    </div> <!-- /.container -->
</body>
</html>
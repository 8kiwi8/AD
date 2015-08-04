<%@ page import ="java.sql.*, common.DB" %>
<jsp:include page="../auth.jsp"/>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Lecuter - Add lecturer</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
 
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
                     <li class="active"><a href="#">Lecturers</a></li>
                    <li><a href="viewCourses.jsp">Courses</a></li>
                    <li><a href="viewSemesters.jsp">Semesters</a></li>
                    
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="logOut.html">Log Out</a></li>
                </ul>
            </div> <!-- /.container-fluid -->
        </nav>
        
        <div class="panel">
            
        </div>
        
  


		<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/addCourseDB">
            <div class="form-group">
                            <label for="courseCode" class="control-label col-xs-4">Course Code</label>
                            <div class="radio col-xs-8">
                            <label class="radio-inline"><input type="radio" name="courseCode" value="SCSJ">SCSJ</label>
                            <label class="radio-inline"><input type="radio" name="courseCode" value="SCSV">SCSV</label>
                            <label class="radio-inline"><input type="radio" name="courseCode" value="SCSR">SCSR</label>
                            <label class="radio-inline"><input type="radio" name="courseCode" value="SCSB">SCSB</label>

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="courseID" class="control-label col-xs-4">Course ID</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="courseID" placeholder="Course ID">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="courseName" class="control-label col-xs-4">Course Name</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="courseName" placeholder="Course Name">
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="creditHours" class="control-label col-xs-4">Credit Hours</label>
                            <div class="radio col-xs-8">
                            <label class="radio-inline"><input type="radio" name="creditHours" value="1">1</label>
                            <label class="radio-inline"><input type="radio" name="creditHours" value="2">2</label>
                            <label class="radio-inline"><input type="radio" name="creditHours" value="3">3</label>
                            <label class="radio-inline"><input type="radio" name="creditHours" value="4">4</label>
                            <label class="radio-inline"><input type="radio" name="creditHours" value="5">5</label>
                            <label class="radio-inline"><input type="radio" name="creditHours" value="8">8</label>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-xs-offset-4 col-xs-8">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </form>


    </div> <!-- /.container -->
</body>
</html>
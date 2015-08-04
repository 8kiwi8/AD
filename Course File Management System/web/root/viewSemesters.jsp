<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Semesters - View Semesters</title>
</head>
<body>
    <div class="container">
    
        <jsp:include page="../auth.jsp"/>
        
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
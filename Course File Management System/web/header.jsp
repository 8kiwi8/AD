<%
    // HEADER PAGE TO BE INCLUDED IN ALL PAGES
    // FOR AUTHENTICATION CHECK, USE auth.jsp
    //
    // Sample Usage:
    // In a page where you want to include this file, add
    // <jsp:include page="../header.jsp"/> if inside one folder in and
    // <jsp:include page="header.jsp"/> if in the same directory as this file
    
    boolean isLecturer = false;
    boolean isAdmin = false;
    boolean isRoot = false;
    boolean isLoggedIn = true;
    
    // Example output: index.jsp
    String currentPageNameWithSlash = request.getServletPath();
    String currentPageName = currentPageNameWithSlash.substring(currentPageNameWithSlash.lastIndexOf("/")+1); 
    
    // If userType session has value...
    if (session.getAttribute("userType") != null) { 
        // Determine the usertype
        if (session.getAttribute("userType").equals("lecturer")) {
            isLecturer = true;
        } else if (session.getAttribute("userType").equals("admin")) {
            isAdmin = true;
        } else if (session.getAttribute("userType").equals("root")) {
            isRoot = true;
        }
    } else {
        isLoggedIn = false; // User is not logged in
    }
    
    /* BELOW IS FOR TESTING PURPOSES
    out.println(request.getServletPath());
    out.println(isLecturer);
    out.println(isAdmin);
    out.println(isRoot);
    out.println(session.getAttribute("usertype")); */
%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<div class="container">
    <div class="jumbotron">
        <h1>Course File Management System</h1>
        <p>Upload all your course-related documents here for the usage of students and administrators.</p>
    </div>

    <nav class="navbar navbar-default"> 
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li class="<% if (currentPageName.equals("home.jsp")) out.println("active"); %>">
                    <a href="<% if (!currentPageName.equals("home.jsp")) out.println("home.jsp"); %>">Home</a>
                </li>
                <% if (isLoggedIn) { %>
                    <li class="<% if (currentPageName.equals("viewCourses.jsp")) out.println("active"); %>">
                        <a href="<% if (!currentPageName.equals("viewCourses.jsp")) out.println(session.getAttribute("userType") + "/viewCourses.jsp"); %>">Courses</a>
                    </li>
                <% } %>
                <%
                    if (isRoot) { 
                %>
                        <li class="<% if (currentPageName.equals("addSemester.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("addSemester.jsp")) out.println(session.getAttribute("userType") + "/addSemester.jsp"); %>">New Semester</a>
                        </li>
                        <li class="<% if (currentPageName.equals("viewLecturers.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewLecturers.jsp")) out.println(session.getAttribute("userType") + "/viewLecturers.jsp"); %>">Lecturers</a>
                        </li>
                        <li class="<% if (currentPageName.equals("viewSemesters.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewSemesters.jsp")) out.println(session.getAttribute("userType") + "/viewSemesters.jsp"); %>">Semesters</a>
                        </li>
                <%
                    } else if (isAdmin) {
                %>
                        <li class="<% if (currentPageName.equals("viewLecturers.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewLecturers.jsp")) out.println(session.getAttribute("userType") + "/viewLecturers.jsp"); %>">Lecturers</a>
                        </li>
                        <li class="<% if (currentPageName.equals("viewUploads.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewUploads.jsp")) out.println(session.getAttribute("userType") + "/viewUploads.jsp"); %>">Uploads</a>
                        </li>
                <%
                    } else if (isLecturer) {
                %>
                        <li class="<% if (currentPageName.equals("viewUploads.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewUploads.jsp")) out.println(session.getAttribute("userType") + "/viewUploads.jsp"); %>">Upload</a>
                        </li>
                <%
                    }
                %>
            </ul>
            
            <% if (isLoggedIn) { %>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<%=request.getContextPath()%>/logoutAction.jsp">Log Out</a></li>
                </ul>
            <% } %>
        </div> <!-- /.container-fluid -->

    </nav>
</div>
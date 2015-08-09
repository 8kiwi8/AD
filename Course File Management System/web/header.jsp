<%
    // HEADER PAGE TO BE INCLUDED IN ALL PAGES
    // FOR AUTHENTICATION CHECK, USE auth.jsp
    //
    // Sample Usage:
    // In a page where you want to include this file, add
    // <jsp:include page="../header.jsp"/> if inside one folder in and
    // <jsp:include page="header.jsp"/> if in the same directory as this file
    
    boolean isPentadbir = false;
    boolean isLecturer = false;
    boolean isAdmin = false;
    boolean isRoot = false;
    boolean isSuper = false;
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
        } else if (session.getAttribute("userType").equals("pentadbir")) {
            isPentadbir = true;
        }
    } else {
        isLoggedIn = false; // User is not logged in
    }
    if (session.getAttribute("isSuper") != null) { 
        if (session.getAttribute("isSuper").equals("true"))
            isSuper = true;
    }
    
    /* BELOW IS FOR TESTING PURPOSES
    out.println(request.getServletPath());
    out.println(isLecturer);
    out.println(isAdmin);
    out.println(isRoot);
    out.println(session.getAttribute("usertype")); */
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/auto-complete.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/jquery.URI.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/bootstrap-table.js"></script>
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
                        <a href="<% if (!currentPageName.equals("viewCourses.jsp")) out.println("viewCourses.jsp"); %>">Courses</a>
                    </li>
                <% } %>
                <%
                    if (isRoot) { 
                %>
                        <li class="<% if (currentPageName.equals("viewLecturers.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewLecturers.jsp")) out.println("viewLecturers.jsp"); %>">Lecturers</a>
                        </li>
                        <li class="<% if (currentPageName.equals("createSemester.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("createSemester.jsp")) out.println("createSemester.jsp"); %>">Semesters</a>
                        </li>
                        <li class="<% if (currentPageName.equals("createOfferedCourse.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("createOfferedCourse.jsp")) out.println("createOfferedCourse.jsp"); %>">Offered Courses</a>
                        </li>
                        <li class="<% if (currentPageName.equals("createSection.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("createSection.jsp")) out.println("createSection.jsp"); %>">Sections</a>
                        </li>
                <%
                    } else if (isAdmin) {
                %>
                        <li class="<% if (currentPageName.equals("viewLecturers.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewLecturers.jsp")) out.println("viewLecturers.jsp"); %>">Lecturers</a>
                        </li>
                        <!--
                        <li class="<% if (currentPageName.equals("viewUploads.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewUploads.jsp")) out.println("viewUploads.jsp"); %>">Uploads</a>
                        </li>
                        -->
                <%
                    } else if (isLecturer) {
                %>
                        <li class="<% if (currentPageName.equals("section.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("section.jsp")) out.println("section.jsp"); %>">Upload</a>
                        </li>
                        <li class="<% if (currentPageName.equals("lecturerProfile.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("lecturerProfile.jsp")) out.println("lecturerProfile.jsp"); %>">Profile</a>
                        </li>
                <%
                    } else if (isPentadbir) {
                %>
                        <li class="<% if (currentPageName.equals("pentadbir.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("pentadbir.jsp")) out.println("pentadbir.jsp"); %>">Reports</a>
                        </li>
                        <li class="<% if (currentPageName.equals("viewLecturers.jsp")) out.println("active"); %>">
                            <a href="<% if (!currentPageName.equals("viewLecturers.jsp")) out.println("viewLecturers.jsp"); %>">Lecturers</a>
                        </li>
                <%
                    }
                %>
            </ul>
            
            <% if (isLoggedIn) { %>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<%=request.getContextPath()%>/logoutAction.jsp">
                            <span class="glyphicon glyphicon-off" aria-hidden="true" style="padding-right: 10px"></span>Log Out
                        </a>
                    </li>
                    <% if (isSuper) { %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> Change User <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=request.getContextPath()%>/ChangeUserRole?userType=root">Admin</a></li>
                            <li><a href="<%=request.getContextPath()%>/ChangeUserRole?userType=admin">Pentadbir</a></li>
                            <li><a href="<%=request.getContextPath()%>/ChangeUserRole?userType=lecturer">Lecturer</a></li>
                        </ul>
                    </li>
                    <% } %>
                </ul>
            <% } %>
            
        </div> <!-- /.container-fluid -->

    </nav>
</div>

<!-- SEPARATOR -->

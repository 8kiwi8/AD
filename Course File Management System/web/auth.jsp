<%
    // AUTHENTICATION CHECK TO BE INCLUDED IN PAGES WHICH REQUIRE USER LOGIN
    // FOR HEADER TEMPLATE, USE header.jsp
    //
    // Sample Usage:
    // In a page where you want to include this file, add
    // <jsp:include page="../auth.jsp"/> if inside one folder in and
    // <jsp:include page="auth.jsp"/> if in the same directory as this file
    
    
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    
    String username = (String) session.getAttribute("User");
    
    if (username == null) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
        //response.sendRedirect("../login.jsp");
    }
%>
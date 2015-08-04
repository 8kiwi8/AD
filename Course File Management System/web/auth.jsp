<%
    // AUTHENTICATION CHECK TO BE INCLUDED IN PAGES WHICH REQUIRE USER LOGIN
    // FOR HEADER TEMPLATE, USE header.jsp
    //
    // Sample Usage:
    // In a page where you want to include this file, add
    // <jsp:include page="../auth.jsp"/> if inside one folder in and
    // <jsp:include page="auth.jsp"/> if in the same directory as this file
    
    String username = (String) session.getAttribute("User");
    if (username == null) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
%>
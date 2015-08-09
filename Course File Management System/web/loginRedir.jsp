<%
    String loggedInUserType = (String) session.getAttribute("userType");
    
    if (loggedInUserType != null) {
        if (loggedInUserType.equals("root")) {
            response.sendRedirect(request.getContextPath() + "/root/home.jsp");
        } else if (loggedInUserType.equals("admin")) {
            response.sendRedirect(request.getContextPath() + "/pentadbir/home.jsp");
        } else if (loggedInUserType.equals("lecturer")) {
            response.sendRedirect(request.getContextPath() + "/lecturer/home.jsp");
        } else if (loggedInUserType.equals("pentadbir")) {
            response.sendRedirect(request.getContextPath() + "/pentadbir/home.jsp");
        }
    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
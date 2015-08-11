<%
    String loggedInUserType = (String) session.getAttribute("userType");
    
    if (loggedInUserType != null) {
        if (loggedInUserType.equals("root")) {
            response.sendRedirect(request.getContextPath() + "/root/home.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } 
    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>

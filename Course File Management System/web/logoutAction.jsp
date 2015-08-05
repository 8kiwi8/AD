<%
    session.removeAttribute("User");
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
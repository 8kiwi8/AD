<%
    session.removeAttribute("User");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
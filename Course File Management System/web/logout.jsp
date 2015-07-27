<%
session.setAttribute("username", null);
session.removeAttribute("password");
session.invalidate();
response.sendRedirect("index.jsp");
%>
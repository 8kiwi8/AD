<%
    String referringURL = request.getHeader("referer");
    
    out.println(referringURL);
    out.println(request.getRequestURL());
    
%>
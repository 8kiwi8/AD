<%-- 
    Document   : listCourse
    Created on : Jul 29, 2015, 4:51:38 PM
    Author     : Kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.DB"%>
<%@page import="java.util.*"%>
<%@page import="com.google.gson.Gson" %>
 
   <%
    try {
        String outside = request.getParameter("term");
        List li = DB.queryLike("course", "courseName", outside);
        String json = new Gson().toJson(li);
        out.println(json);
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

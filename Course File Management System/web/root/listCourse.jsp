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
        String term = request.getParameter("term");
        String col = request.getParameter("col");
        String table = request.getParameter("table");
        List li = DB.query("SELECT * " + " FROM " + table + " WHERE ");
        String json = new Gson().toJson(li);
        out.println(json);
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

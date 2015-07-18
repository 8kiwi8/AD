<%-- 
    Document   : mark_converter
    Created on : Jul 8, 2015, 10:15:14 AM
    Author     : Aidan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.annotation.WebServlet" %>
<%@ page import = "javax.servlet.http.HttpServlet" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>
<%@ page import = "java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/Assignment_2/bootstrap.min.css" rel="stylesheet">
        <title>MARK CONVERTER</title>
        <style type="text/css">
        body {
            background: blanchedalmond;
            margin: auto;
        }
        #container, h1 {
            max-width: 350px;
            margin: 0 auto;
        }
        
        h1 {
            padding-bottom: 20px;
            text-decoration-color: blueviolet;
           }
        body
        {
            margin: 0 auto;   
        }     
        
        .btn-primary {
            background: #0099cc;
            color: #ffffff;
        }
 
        .btn-primary:hover, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary 
        {
            background: blue;
        }
        
        .btn-primary:focus
        {
            background: cyan;
        }
 
        .btn-primary:active, .btn-primary.active {
            background: cornflowerblue;
            box-shadow: none;
        }
        
        .btn-primary.outline
        {
            border: 8px solid darkturquoise;
            color: darkturquoise;
        }
        
        btn-primary.round 
        {
            border-radius: 8px;
        }
    </style>
    </head>
    <body>
        <div id = "container"> 
            <h1 style="color: blueviolet;">MARK CONVERTER</h1>
            <form action = "" role = "form">
                <div class = "form-group">
                    <label for="mark" style = "color:Coral;"> Mark in percent (%): </label>
                    <input class="form-control" name="markTextBox" id="mark">
                </div>
                <div class = "form-group">               
                    <input id="grade" name="gradeCheckBox" type="checkbox" value="Grade"/> 
                    <label for = "Grade" style = "color:Crimson;"> Grade </label>                       

                    <input id = "point" name = "pointCheckBox" type = "checkbox" value = "Point">
                    <label for = "Point" style = "color:Crimson;"> Point </label>
                </div>
                <input value="Convert" name="convert" type="submit" class="btn-primary">
            </form>
            <br>
            <a href = "mark_converter.jsp"> RESET </a>   
            <% if (request.getParameter("convert") != null)
            {
                double marks;   
                marks = Double.parseDouble(request.getParameter("markTextBox"));
                double mark = marks;               
                int point = 0;
                String grade = "<p>Your result is ";
                String grade1 = "";
                out.println (grade); 
                out.println("<br>");

                 if (mark >= 90 && mark <= 100)
                 {
                    grade1 += "A";
                    point = 4;                                 
                 }
                 else if (mark >= 80 && mark <= 89)
                 {
                    grade1 += "B";
                    point = 3;                                 
                 }
                 else if (mark >= 70 && mark <= 79)
                 {
                        grade1 += "C";
                        point = 2;                       
                 }
                 else if (mark >= 60 && mark <= 69)
                 {
                         grade1 += "D";
                         point = 1;                        
                 }
                 else if (mark >= 0 && mark <= 59)
                 {
                         grade1 += "F";
                         point = 0;                 
                 }
                 else
                 {
                         grade1 = "ERROR";
                         out.println (grade1);
                 }          
            %>
            <br>
                <div class = "form-group">
                    <label for="grade1" style = "color:Coral;">Grade: </label>
                    <p><%= grade1 %></p>                    
                </div>
                <div class = "form-group">
                    <label for="point" style = "color:Coral;">Point: </label>
                    <p><%= point %></p> 
                </div>
            <% } %>
        </div>    
    </body>
</html>

<%-- 
    Document   : BMI Calculator
    Created on : Jul 8, 2015, 10:10:48 AM
    Author     : Aidan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/Assignment_2/bootstrap.min.css" rel="stylesheet">
    <title>BMI Calculator</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type = "text/javascript">
        function calc ()
        {
            var result;
            var weight = document.getElementById("weight").value;
            var height = document.getElementById("height").value;
            var bmi = weight / (height*height);
            
            answer.value = bmi;
        }
    </script>
    <style type="text/css">
        body {
            background: blanchedalmond;
            margin: auto;
        }
        #container, h1 {
            max-width: 300px;
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
            <img src = "/Assignment_2/music.gif" alt="null">
            <h1 style="color: blueviolet;"> BMI Calculator </h1>
        <form action="" role = "form">                   
           <div class = "form-group">
               <label for="height" style = "color:Coral;">Height (m):</label>
               <input class="form-control" name="height" id="height" onkeyup="calc()" > 
           </div>
           <div class = "form-group">
               <label for="weight" style = "color:Coral;">Weight (kg):</label>
               <input class="form-control" name="weight" id="weight" onkeyup="calc()" > 
           </div>  
            <input value="Calculate" name="calculate" type="submit" class="btn-primary">
            <input id = "answer" type="text" disabled class = "btn btn-default"/> 
            </form>
            <a href = "BMI Calculator.jsp"> RESET </a>   
            <% if (request.getParameter("calculate") != null)
            {
                double height = Double.parseDouble(request.getParameter("height"));
                double weight = Double.parseDouble(request.getParameter("weight"));
                double bmi = weight/(height*height);                
               
                String result = "";
                result += String.format("%.2f", bmi);            
                double kg = bmi;
                String mass = "<p> You are ";
                if (kg < 18.5)   
                    mass += " Underweight";
                else if (kg >= 18.5 && kg <= 24.9)
                    mass += " Normal";
                else if (kg >= 25.0 && kg <= 29.9)
                    mass += " Overweight";
                else
                    mass += "Obese"; 
            %>                            
                <br>
                <div class = "form-group">
                    <label for="result" style = "color:Coral;">Your BMI are :</label>
                    <p><%= result %></p>                    
                </div>
                <div class = "form-group">
                    <label for="result" style = "color:Coral;">Your are :</label>
                    <p><%= mass %></p> 
                </div>
            <% } %>
           </div>  
        </div>          
    </body>
</html>
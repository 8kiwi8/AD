<%-- 
    Document   : tuitionCalculator
    Created on : Jul 8, 2015, 9:56:30 AM
    Author     : Ahmad Rafiuddin
--%>

<%@page import="java.io.IOException" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.annotation.WebServlet" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tuition Calculator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href ="/Assignment_2/css/bootstrap.min.css" rel="stylesheet" type="text.css"></link>
        <style type="text/css">
            #container, h1 {
                max-width: 400px;
                margin: 0 auto;
            }
            
            h1 {
                padding-bottom: 20px;
            }
            
            body {
                
            }
        </style>
        
    </head>
    <body>
        <h1>TUITION CALCULATOR</h1>
        <div id="container">
            <form action="" role="form">
                <div class="form-group">
                    <label for="numAAS">Number of AAS course(s):</label>
                    <input class="form-control" name="numAAS" id="numAAS"> ($120)
                </div>
                
                <div class="form-group">
                    <label for="numAAS">Number of ESL course(s):</label>
                    <input class="form-control "name="numESL" id="numESL"> ($75)                    
                </div>
                
                <div class="form-group">
                    <label for="studentType">Type of Student:</label>
                    <select class="form-control" id="studentType "name="studentType">
                        <option selected="selected" value="normal">Normal</option>
                        <option value="tenDollarDiscount">$10 Discount</option>
                        <option value="twentyPercentDiscount">20% Discount</option>
                        <option value="fiftyPercentDiscount">50% Discount</option>
                    </select>
                </div>
                
                <input value="Calculate" name="calculate" type="submit" class="btn btn-default">
                <a href = "tuitionCalculator.jsp" class="btn btn-default">Reset</a>
                
                <%
                    double totalCost = 0;
                    
                    if (request.getParameter("calculate") != null) {
                        String studentSel = request.getParameter("studentType");

                        int numOfAASCourses = Integer.parseInt(request.getParameter("numAAS")); // $120 each
                        int numOfESLCourses = Integer.parseInt(request.getParameter("numESL")); // $75 each

                        totalCost = (120 * numOfAASCourses) + (75 * numOfESLCourses);

                        if (studentSel.equals("normal")) {
                            //asd
                        } else if (studentSel.equals("tenDollarDiscount")) {
                            totalCost = totalCost - 10;
                        } else if (studentSel.equals("twentyPercentDiscount")) {
                            totalCost = totalCost * 0.8;
                        } else if (studentSel.equals("fiftyPercentDiscount")) {
                            totalCost = totalCost * 0.5;
                        } else {
                            out.println("Error: Invalid selection!");
                        }
                    }
                %>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="numAAS">Total cost:</label>
                            <input class="form-control" name="numAAS" id="numAAS" disabled value="<% if (request.getParameter("calculate") != null) out.println(totalCost); %>">
                        </div>

            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : tuitionCalculator
    Created on : Jul 8, 2015, 9:56:30 AM
    Author     : Ahmad Rafiuddin
--%>

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
            <form action="/Assignment_2/TuitionCalculator" role="form">
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
            </form>
        </div>
    </body>
</html>

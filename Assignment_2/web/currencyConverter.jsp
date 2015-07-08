<%-- 
    Document   : currencyConverter
    Created on : Jul 8, 2015, 10:22:56 AM
    Author     : Akmal Irfan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Currency converter</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
        
        <style type="text/css">
            body {
                background: #f0f0f0;
                margin: auto;
            }
            form {
                margin-bottom: 30px;
            }
            #container {
                max-width: 340px;
                margin: 50px auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
            }
            table {
                width: 200px;
                margin: 0 auto;
            }
            tr:nth-child(odd) {
                background: #dfdfdf;
            }
            tr:nth-child(1) {
                background: darkgray;
                font-weight: bold;
            }
            p {
                padding: 10px 0;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <form method="POST">
                <label for="vnd">VND:</label>
                <input class="form-control" type="text" name="vnd" id="vnd" autofocus require
                <div class="radio">
                    <label>
                        <input type="radio" name="currency" value="usd" id="currency_0" required>
                        USD
                    </label>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="currency" value="eur" id="currency_1" required>
                        EUR
                    </label>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="currency" value="jpy" id="currency_2" required>
                        JPY
                    </label>
                </div>

                <input type="submit" name="exchange" id="exchange" value="Exchange">
            </form>
            
            <b>Exchange Rate</b>
            
            <table>
                <tr>
                    <td>Currency</td>
                    <td>Rate</td>
                </tr>
                <tr>
                    <td>USD</td>
                    <td>16,452</td>
                </tr>
                <tr>
                    <td>EUR</td>
                    <td>25,170.38</td>
                </tr>
                <tr>
                    <td>JPY</td>
                    <td>151.23</td>
                </tr>
            </table>
            
            <%! private double vnd;
                private double converted;
                private String type;
                private double rate;
            %>
            <%  if (request.getParameter("exchange") != null) {
                    vnd = Double.parseDouble(request.getParameter("vnd"));
                    type = request.getParameter("currency");
                    
                    if (type.equals("usd")) {
                        rate = 16452;
                    } else if (type.equals("eur")) {
                        rate = 25170.38;
                    } else if (type.equals("jpy")) {
                        rate = 151.23;
                    }
                    
                    // Convert it
                    converted = vnd / rate;
                    
                    // Display the output
                    out.println("<p>" + vnd + "VND is equivalent to " + converted + "" + type.toUpperCase() + "</p>");
                }
            %>
        </div>
    </body>
</html>

<%-- 
    Document   : pentadbir
    Created on : Jul 29, 2015, 10:46:19 AM
    Author     : Akmal Irfan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../auth.jsp"/>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reports</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <style type="text/css">
    #container {
      max-width: 340px;
      margin: 0 auto;
      padding: 20px;
      border-radius: 8px;
    }
    .category {
      margin-top: 15px;
    }
    input[type="submit"] {
      margin-top: 15px;
    }
    .logout {
      float: right;
    }
    .panel {
        margin: 0 auto;
        max-width: 800px;
    }
    #sorok {
        display: none;
    }
    #sorok:target {
        display: block;
    }
  </style>
</head>
<body>
  <div id="container">
    <div class="category">
      <select id="sesi" class="form-control" name="sesi">
        <option value="Invalid selection">Tahun/Sesi</option>
        <option value="1213">2012/2013</option>
        <option value="1314">2013/2014</option>
        <option value="1415">2014/2015</option>
        <option value="1516">2015/2016</option>
      </select>
    </div>
    
    <div class="category">
      <select id="sem" class="form-control" name="sem">
        <option value="Invalid selection">Semester</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
      </select>
    </div>
    
    <!--<input class="btn btn-primary" type="submit" value="Submit">-->
    <a href="#sorok"><input class="btn btn-primary" type="submit" value="Submit"></a>
    
  </div>
  
  <div id="sorok" class="panel panel-default">
    <table class="table">
      <thead>
        <tr class="pertama">
          <th>Course</th>
          <th>Reports</th>
          <th>Sectional reports</th>
        </tr>
      </thead>

      <tbody>
        <tr>
          <td>Database</td>
          <td><a href="#">View report</a></td>
          <td>
            <select id="OOPsec" class="form-control" name="OOPsec">
              <option value="Invalid selection">Choose section</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
           </td>
        </tr>
        <tr>
          <td>Computational Math</td>
          <td><a href="#">View report</a></td>
          <td>
            <select id="DBsec" class="form-control" name="DBsec">
              <option value="Invalid selection">Choose section</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Network</td>
          <td><a href="#">View report</a></td>
          <td>
            <select id="COAsec" class="form-control" name="COAsec">
              <option value="Invalid selection">Choose section</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Graphic Design</td>
          <td><a href="#">View report</a></td>
          <td>
            <select id="COAsec" class="form-control" name="COAsec">
              <option value="Invalid selection">Choose section</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
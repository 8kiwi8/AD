<%-- 
    Document   : AdShowTTable
    Created on : Jun 4, 2009, 4:59:54 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String flag ="";


 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query("select flag from flag_lec_ev_schedule ");
     flag = objDB.getDataAt(0, "flag");
     objDB.close();
     
%>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/AdTimeTable.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
    <body>
         <div id="Wrapper">
         
         <%@ include file="headeradmin.jsp" %>
         
    <div class="container">
    <div style="height:auto" id="WrapperBody">
        <br>

        <center>
            <form>
                <span>
                    <div style="width:50%" class="panel panel-default">
  <div class="panel-heading">
      <h2 style="color:#000" class="panel-title"><b>Show Evaluation Schedule</h2>
  </div>
  <div class="panel-body alert-warning">
                    <table style="font-weight:bold">
                        <tr>
                            <td>Show Evaluation Schedule of lecturer / student :</td>
                            <td><select class="form-control" name="showEv" onchange="showSchedule(this.value)">
                                    <option value="Yes"<%if(flag.equals("Yes")){%>selected <%}%>>Yes</option>
                                    <option value="No" <%if(flag.equals("No")){%> selected<%}%>>No</option>
                            </select></td>
                        </tr>
                        
                        
                    </table>
  </div>
                    </div>
                </span>
              </form>
           
           
     
        <br><br>  <br><br>  <br><br>  <br><br>  <br><br>  
        


                
        <div id="Left">
        
         <br>
         <!--Main Menu-->
    
         <br>
         </div>
</div>
</div>
         <br><br><br>
         <%@ include file="Footer.jsp" %>
        
</div>
     
     
    </body>
</html>

<% 
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }

%>
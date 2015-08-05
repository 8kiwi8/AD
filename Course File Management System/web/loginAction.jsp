<%@page import="java.sql.*, common.DB" %>
<%
    //initialize RequestDispatcher object; set forward to home page by default
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    // Get form value for username
    String username = request.getParameter("inputUsername");
    String password = request.getParameter("inputPassword");
    
    String query = "SELECT password, usertype FROM user WHERE username='" + username + "'";
    
    ResultSet rs = DB.query(query);
    

    // Query only returns 1 record in the result set; only 1
    // password per userName which is also the primary key
    if (rs.next()) {  
        String userTypeFromDB = rs.getString("usertype");
        if (rs.getString("password").equals(password)) { // If valid password
            session.setAttribute("User", username); // Saves username string in the session object
            if(userTypeFromDB.equals("super")) {
                System.out.println("Logged User:" + userTypeFromDB);
                session.setAttribute("userType", "root");
                session.setAttribute("isSuper", "true");
            }
            else {
                session.setAttribute("userType", userTypeFromDB);
            }
            //out.println("password inputted = password in DB = username & pwd found in system");
            rd = request.getRequestDispatcher("loginRedir.jsp");
        }
        else { // Password does not match, i.e., invalid user password
            request.setAttribute("Error", "Invalid password.");
            //out.println("password inputted != password in DB BUT username found in system");
            
            rd = request.getRequestDispatcher("login.jsp");
        }
    } else { // No record in the result set, i.e., invalid username
        request.setAttribute("Error", "User not found.");
        out.println("no username found in system");
        rd = request.getRequestDispatcher("login.jsp");
    }
    
    
    //As a controller, loginAction.jsp finally either forwards to "login.jsp" or "home.jsp"
    rd.forward(request, response);
%>

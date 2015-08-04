/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiwi
 */
@WebServlet(name = "CreateOfferedCourseServlet", urlPatterns = {"/CreateOfferedCourseServlet"})
public class CreateOfferedCourseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String courseID = request.getParameter("courseID");
            String courseCode = request.getParameter("courseCode");
            int semesterID = Integer.parseInt(request.getParameter("semesterID"));
            String query = "";
            if(!courseID.equals("") && !courseCode.equals("")) {
                if(username.equals(""))
                    query = "INSERT INTO course_offered(semesterID, courseCode, courseID) VALUES("+semesterID+", '"+courseCode+"', '"+courseID+"')";
                else
                    query = "INSERT INTO course_offered(semesterID, courseCode, courseID, username) VALUES("+semesterID+", '"+courseCode+"', '"+courseID+"', '"+username+"')";
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet createCourseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+query+"</h1>");
            out.println("<p>");
            final String REGEX = "username\\[(.*?)\\]";
            Pattern p = Pattern.compile(REGEX);
            String URLquery = URLDecoder.decode(request.getQueryString(), "UTF-8");
            Matcher m = p.matcher(URLquery);
            out.println(URLquery+"<br>");
            while(m.find()) {
                String co_ID = m.group(1);
                out.println("Found!"+co_ID+"<br>");
                String user = request.getParameter("username["+co_ID+"]");
                if(user.equals("")) {
                    out.println("username["+co_ID+"] No Update Needed<br>");
                }
                else {
                    String updateQuery = "UPDATE course_offered SET username='" + user + "' WHERE course_offered_ID="+co_ID;
                    out.println(updateQuery+"<br>");
                }
            }
            out.println("</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

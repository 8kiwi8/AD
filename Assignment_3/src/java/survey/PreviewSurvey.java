/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiwi
 */
@WebServlet(name = "PreviewSurvey", urlPatterns = {"/PreviewSurvey"})
public class PreviewSurvey extends HttpServlet {

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
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String telNo = request.getParameter("telno");
            
            String musicPreference[] = { "None" };
            
            if (request.getParameterValues("pref") != null) {
                musicPreference = request.getParameterValues("pref");
            }
            
            String favouriteMusicDecade = request.getParameter("decade");
            String favouriteDayToListen = request.getParameter("day");
            String iListenToWARNA = request.getParameter("freq");
            String additionalComments = request.getParameter("comments");
            String subscribedToNewsletter = request.getParameter("subscribe");
            
            String preferredListeningLoc[] = { "None" };
            
            if (request.getParameterValues("placepref") != null) {
                preferredListeningLoc = request.getParameterValues("placepref");
            }
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PreviewSurvey</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("Name: " + name + "<br>");
            out.println("Email: " + email + "<br>");
            
            out.println("<br>");
            out.println("Telephone Number: " + telNo + "<br>");
            out.println("Music Preference: " + "<br>");
            
            for (String s2: musicPreference) {
                out.println(s2 + "<br>");
            }
            
            out.println("<br>");
            out.println("Favourite Music Decade: " + favouriteMusicDecade + "<br>");
            out.println("Favourite Day to Listen: " + favouriteDayToListen + "<br>");
            out.println("I Listen to WARNA: " + iListenToWARNA + "<br>");
            out.println("<br>");
            
            out.println("Preferred Listening Location: " + "<br>");
            
            for (String s: preferredListeningLoc) {
                out.println(s + "<br>");
            }
            
            out.println("<br>");
            out.println("Additional Comments: <br>" + additionalComments + "<br>");
            out.println("<br>");
            
            if (subscribedToNewsletter != null) {
                subscribedToNewsletter = "Yes";
            } else {
                subscribedToNewsletter = "No";
            }
            
            out.println("Subscribed to Newsletter: " + subscribedToNewsletter + "<br>");
            
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

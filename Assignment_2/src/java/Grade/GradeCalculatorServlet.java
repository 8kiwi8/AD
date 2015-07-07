/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Grade;

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
@WebServlet(name = "GradeCalculatorServlet", urlPatterns = {"/GradeCalculatorServlet"})
public class GradeCalculatorServlet extends HttpServlet {

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
            double midtermMark, finalMark, projectMark;
            midtermMark = Double.parseDouble(request.getParameter("midterm"));
            finalMark = Double.parseDouble(request.getParameter("final"));
            projectMark = Double.parseDouble(request.getParameter("project"));
            
            double avgMark = midtermMark/100*30 + finalMark/100*30 + projectMark*40/100;
            
            String grade = "N/A";
            int point = 0;
            String pass = "Passed!";
            
            if(avgMark >= 0 && avgMark < 60 ) {
                grade = "F";
                pass = "Failed!";
            }
            else if(avgMark >= 60 && avgMark < 70) {
                grade = "D";
                point = 1;
            }
            else if (avgMark >= 70 && avgMark < 80) {
                grade = "C";
                point = 2;
            }
            else if (avgMark >= 80 && avgMark < 90) {
                grade = "B";
                point = 3;
            }
            else if (avgMark >= 90 && avgMark <=100) {
                grade = "A";
                point = 4;
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GradeCalculatorServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<p>Average: " + String.format("%.2f", avgMark) + "</p>");
            out.println("<p>Grade: " + grade + "</p>");
            out.println("<p>Point: " + point + "</p>");
            out.println("<p> Result: " + pass + "<p>");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark_Converter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author zavie_000
 */
@WebServlet(name = "Mark_converter", urlPatterns = {"/Mark_converter"})
public class Mark_converter extends HttpServlet
{
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
            double marks;   
            marks = Double.parseDouble(request.getParameter("markTextBox"));
            double mark = marks;
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mark_Converter Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            int point;
            String grade = "<p>Your result is ";
            String grade1 = "";
            out.println (grade); 
            out.println("<br>");
            
             if (mark >= 90 && mark <= 100)
             {
                grade1 += "A";
                point = 4; 
                out.println ("- Grade: " + grade1);
                out.println("<br>");
                out.println ("- Point: " + point);               
             }
             else if (mark >= 80 && mark <= 89)
             {
                grade1 += "B";
                point = 3;             
                out.println ("- Grade: " + grade1);
                out.println("<br>");
                out.println ("- Point: " + point);
             }
             else if (mark >= 70 && mark <= 79)
             {
                    grade1 += "C";
                    point = 2;
                    out.println ("- Grade: " + grade1);
                    out.println("<br>");
                    out.println ("- Point: " + point);
             }
             else if (mark >= 60 && mark <= 69)
             {
                     grade1 += "D";
                     point = 1;
                     out.println ("- Grade: " + grade1);
                     out.println("<br>");
                     out.println ("- Point: " + point);
             }
             else if (mark >= 0 && mark <= 59)
             {
                     grade1 += "F";
                     point = 0;
                     out.println ("- Grade: " + grade1);
                     out.println("<br>");
                     out.println ("- Point: " + point);
             }
             else
             {
                     grade1 += "ERROR";
                     out.println (grade);
             }
                                        
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root;

import common.DB;
import java.io.IOException;
import java.io.PrintWriter;
import common.ResultList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiwi
 */
@WebServlet(name = "CreateSectionServlet", urlPatterns = {"/CreateSectionServlet"})
public class CreateSectionServlet extends HttpServlet {

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
            if(request.getParameter("semesterID") == null ||
                    request.getParameter("course_offered_ID") == null ||
                    request.getParameter("username") == null ||
                    request.getParameter("sectionNo") == null ||
                    request.getParameterValues("sectionMajor") == null
                    ) {
                HttpSession session = request.getSession();
                session.setAttribute("Form Error", "You missed some field.");
                response.sendRedirect(request.getHeader("Referer"));
            }
            String semesterID = request.getParameter("semesterID");
            String co_ID[] = request.getParameterValues("course_offered_ID");
            String username[] = request.getParameterValues("username");
            String sectionNo[] = request.getParameterValues("sectionNo");
            String sectionMajor[] = request.getParameterValues("sectionMajor");
            String courseCode = "", courseID = "", lastco_ID = "";
            for(int i = 0; i < co_ID.length; ++ i) {
                if(!lastco_ID.equals(co_ID[i])) {
                    lastco_ID = co_ID[i];
                    String query1 = "SELECT * FROM course_offered WHERE course_offered_ID = "+co_ID[i];
                    ResultList rs1 = DB.query(query1);
                    rs1.next();
                    courseCode = rs1.getString("courseCode");
                    courseID = rs1.getString("courseID");
                }
                String query2 = "INSERT INTO section(username, semesterID, sectionNo, course_offered_ID, courseCode, courseID, sectionMajor) " +
                        "VALUES('"+username[i]+"', "+semesterID+
                        ", "+sectionNo[i]+", "+co_ID[i]+", '"+courseCode+"', '"+courseID+"', '" + sectionMajor[i]+"')";
                out.print(query2);
                int rs2 = DB.update(query2);
            }
            response.sendRedirect(request.getContextPath() + "/root/sections.jsp?semesterID="+semesterID);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet createCourseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1></h1>");
            out.println("</body>");
            out.println("</html>");
        }    }

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

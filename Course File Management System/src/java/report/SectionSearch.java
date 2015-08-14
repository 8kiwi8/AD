/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import common.ViewPermission;
import common.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
@WebServlet(name = "SectionSearch", urlPatterns = {"/SectionSearch"})
public class SectionSearch extends HttpServlet {

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
            
            HttpSession session = ((HttpServletRequest) request).getSession();
            ViewPermission userPermission = ViewPermission.valueOf((String)session.getAttribute("viewPermission"));
            String loggedUser = (String)session.getAttribute("User");
            String query = "";

            String semesterID = request.getParameter("semesterID");
            String username = request.getParameter("username");
            String course = request.getParameter("course");
            String departmentID = request.getParameter("departmentID");
            HashMap<String,String> extra = new HashMap();
            extra.put("course", "[courseCode] [courseID] [courseName]");

            query = "SELECT c.courseCode, c.courseID, c.courseName, p.name, s.sectionID, s.sectionNo " +
                    "FROM year_semester AS y, department AS d, section AS s, profile AS p, course AS c , course_offered AS co WHERE " +
                    "y.semesterID = s.semesterID AND s.username = p.username AND s.courseCode = c.courseCode AND " +
                    "co.course_offered_ID = s.course_offered_ID AND .s.courseID = c.courseID AND d.departmentID = p.departmentID ";
            if(departmentID!=null && !departmentID.equals("")) {
                query += "AND d.departmentID = '" + departmentID + "' ";
            }
            if(course != null && !course.equals("")) {
                String[] tokens = course.split("/");
                String courseCode = tokens[0];
                String courseID = tokens[1];
                query += "AND c.courseID = " + courseID + " AND c.courseCode = '" + courseCode + "' ";
            }
            if(username != null && !username.equals("")) {
                query += "AND s.username ='" + username + "' ";
            }
            if(semesterID != null && !semesterID.equals("")) {
                query += "AND s.semesterID = " + semesterID + " ";
            }

            if(userPermission == ViewPermission.LECTURER) {
                query += " AND s.username = '" + loggedUser + "'";
            } else if(userPermission == ViewPermission.PENYELARAS) {
                query += " AND co.username = '" + loggedUser + "'"; 
            } else if(userPermission == ViewPermission.KETUA_JABATAN) {
                String query2 = "SELECT * FROM profile where username = '" + loggedUser + "'";
                String department = DB.getDataAt(query2, 0, "departmentID");
                query += " AND d.departmentID = " + department;
            }

            out.print(DB.createJson(query, extra));
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;

import static CourseFileManagementSystem.Upload.sectionID;
import common.DB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.zeroturnaround.zip.ZipUtil;

/**
 *
 * @author Kiwi
 */
@WebServlet(name = "DownloadAsZip", urlPatterns = {"/DownloadAsZip"})
public class DownloadAsZip extends HttpServlet {

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
            String sectionID = request.getParameter("sectionID");
            ResultSet rs = DB.query("SELECT * FROM course AS c, section AS s, year_semester AS ys, upload_checklist AS uc WHERE s.courseCode = c.courseCode "
                           + "AND s.semesterID = ys.semesterID AND s.courseID = c.courseID AND s.sectionID=" + sectionID);                                
            rs.next(); 
            
            String semester = rs.getString("year") + "-" + rs.getString("semester");
            String course = rs.getString("courseCode") + rs.getString("courseID") + "-" + rs.getString("courseName");
            String section = "section-" + rs.getString("sectionNo");
            
            String folderPath = getServletContext().getRealPath("") + File.separator + "data" + File.separator + semester + File.separator;
            String zipRealPath = getServletContext().getContextPath() + File.separator + "data" + File.separator + semester + File.separator;
            String zipAs = request.getParameter("zipAs");
            String zipPath = "";
            String name = "";

            if(zipAs.equals("course")) {
                zipPath = folderPath+File.separator+course+".zip";
                zipRealPath = zipRealPath+File.separator+course+".zip";
                ZipUtil.pack(new File(folderPath+course), new File(zipPath));
                name = course;
            }
            else if(zipAs.equals("section")) {
                folderPath += course +File.separator;
                zipRealPath += course +File.separator;
                zipPath = folderPath+section+".zip";
                zipRealPath = zipRealPath+section+".zip";
                ZipUtil.pack(new File(folderPath+section), new File(zipPath));
                name = section;
            }
            else if(zipAs.equals("checklist")) {
                
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DownloadAsZip</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<a href = \""+zipRealPath+"\" download =\""+name+"\">" +
                        "<button class=\"btn btn-primary\" type=\"button\">" +
                        "<i class = \"glyphicon glyphicon-download-alt\"></i> Download </button></a>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(DownloadAsZip.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zavie_000
 */
@WebServlet(name = "Download", urlPatterns = {"/Download"})
public class Download extends HttpServlet {
    
    String fileName = " ";
    static String sectionID = " ";
    static String semesterID = " ";
    static String username = " ";
    
    public static void setID(String semID, String secID, String user_name)
    {
        semesterID = semID;
        sectionID = secID;
        username = user_name;
    }

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
            String sectionID = request.getParameter("sectionID");
            String username = request.getParameter("username");
            String query = "SELECT * FROM files AS f, section AS s WHERE f.sectionID = s.sectionID";
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Download</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Download at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String filePath = request.getParameter("fileName");

        if(filePath == null || filePath.equals(""))
        {
            throw new ServletException("File Name can't be null or empty");
        }

        File file = new File(filePath);

        if(!file.exists())
        {
            throw new ServletException("File doesn't exists on server.");
        }

        ServletContext ctx = getServletContext();

        try (InputStream fis = new FileInputStream(file))
        {
            String mimeType = ctx.getMimeType(file.getAbsolutePath());
            
            response.setContentType(mimeType != null? mimeType:"application/octet-stream");
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            
            try (ServletOutputStream os = response.getOutputStream()) 
            {
                byte[] bufferData = new byte[1024];
                int read = 0;
                
                while((read = fis.read(bufferData))!= -1)
                {
                    os.write(bufferData, 0, read);
                }
                os.flush();
                os.close();
                fis.close();
            }
        }
        response.sendRedirect("upload.jsp?semesterID=" + semesterID + "&sectionID=" + sectionID + "&username=" + username);
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

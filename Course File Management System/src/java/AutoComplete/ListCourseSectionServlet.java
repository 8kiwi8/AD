/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AutoComplete;

import common.DB;
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
@WebServlet(name = "ListCourseSectionServlet", urlPatterns = {"/ListCourseSectionServlet"})
public class ListCourseSectionServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            String value = request.getParameter("value");
            String label = request.getParameter("label");
            String semesterID = request.getParameter("semesterID");         
            
            String query = "SELECT * FROM section AS s, profile AS p, course AS c WHERE " +                              
                           "s.username = p.username AND s.courseCode = c.courseCode AND s.courseID=c.courseID AND sectionID AND semesterID="+ semesterID;
            out.print(query);
            out.print(DB.createJson(query, label, value));
        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }
}

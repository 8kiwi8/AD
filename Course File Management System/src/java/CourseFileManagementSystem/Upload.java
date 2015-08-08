/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;
import java.sql.*; 
import common.DB;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import java.util.Scanner;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author zavie_000
 */
@WebServlet(name = "Upload", urlPatterns = {"/Upload"})
public class Upload extends HttpServlet 
{       
    private static final long serialVersionUID = 1L;
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 5; //5MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; //50MB
    
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write("<html><head></head><body>");
        // Check that we have a file upload request
        if (!ServletFileUpload.isMultipartContent(request)) 
        {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
       
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String dataFolder  = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY;
        File uploadD = new File(dataFolder);
        if (!uploadD.exists()) 
        {
            uploadD.mkdir();
        }     
        String uploadFolder = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY + File.separator + semesterID + " - " + sectionID;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        // Sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
        
        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // creates the directory if it does not exist
        File uploadDir = new File(uploadFolder);
        if (!uploadDir.exists()) 
        {
            uploadDir.mkdir();
        }      
        
        try 
        {
            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            if (items != null && items.size() > 0) 
            {
                // iterates over form's fields
                for (FileItem item : items) 
                {
                    // processes only fields that are not form fields
                    if (!item.isFormField() && !item.getName().equals("")) 
                    {
                        System.out.println(item.getName()+" file is for checklist " + item.getFieldName());
                        Scanner field_name = new Scanner(item.getFieldName()).useDelimiter("[^0-9]+");
                        int id = field_name.nextInt();
                        fileName = new File(item.getName()).getName();
                        /*ResultSet rs1 = DB.query ("SELECT * FROM files WHERE sectionID = " + sectionID + " AND checklistID="+ id);
                        if (rs1.next())
                        {
                            String path1 = rs1.getString("fileDirectory");                            
                            Path path2 = Paths.get(path1);
                            Path file_name = Paths.get(fileName);
                            if (file_name.getFileName().equals(path2.getFileName()))
                            {
                                
                            } else {
                                fileName = file_name.getFileName().toString();
                            }
                        }  */                     
                        String path = request.getContextPath() + "/" + DATA_DIRECTORY + "/" + semesterID + " - " + sectionID + "/" + fileName;
                        String filePath = uploadFolder + File.separator + fileName;
                        File uploadedFile = new File(filePath);
                        System.out.println(filePath); 
                          
                        // saves the file to upload directory
                        item.write(uploadedFile); 
                        String query = "INSERT INTO files (fileDirectory, sectionID, checklistID) values('"+path+"', "+sectionID+", "+id+")";
                        DB.update(query);
                        ResultSet rs = DB.query("SELECT label FROM upload_checklist WHERE id=" + id);
                        while(rs.next()) 
                        { 
                            String label = rs.getString("label");
                            out.write("<a href=\"Upload?fileName=" + filePath + "\">Download "+ label+"</a>");
                            out.write("<br><br>");                            
                        }                                                                   
                    }
                }    
            }           
        } 
        catch (FileUploadException ex) 
        {
            throw new ServletException(ex);
        } 
        catch (Exception ex) 
        {
            throw new ServletException(ex);
        }
        response.sendRedirect("lecturer/upload.jsp?semesterID=" + semesterID + "&sectionID=" + sectionID + "&username=" + username);
    }
    
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
    }
}
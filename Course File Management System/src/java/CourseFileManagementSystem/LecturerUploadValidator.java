/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;

import common.DB;
import common.Pair;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Kiwi
 */
public class LecturerUploadValidator {
    private HashMap<Integer, Boolean> checklist;
    private Pair<Integer, Integer> complete;
    public LecturerUploadValidator(String sectionID) throws SQLException {
        checklist = new HashMap();
        complete = new Pair(0, 0);
        String query1 = "SELECT * FROM upload_checklist";
        ResultSet rs1 = DB.query(query1);
        while(rs1.next()) {
            checklist.put(Integer.parseInt(rs1.getString("checklistID")), false);
            complete.setRight(complete.getRight() + 1);
        }
        
        String query2 = "SELECT * FROM lecturer_upload WHERE sectionID=" + sectionID;
        ResultSet rs2 = DB.query(query2);
        while(rs2.next()) {
            int toCheck = Integer.parseInt(rs2.getString("checklistID"));
            if(checklist.get(toCheck) == false) {
                checklist.put(toCheck, true);
                complete.setLeft(complete.getLeft() + 1);
            }
        }
    }
    
    public Pair<Integer, Integer> complete() {
        return complete;
    }
}

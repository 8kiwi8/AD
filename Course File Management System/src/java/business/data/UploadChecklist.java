/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.data;

/**
 *
 * @author zavie_000
 */
public class UploadChecklist 
{
    long checklistID;
    String label;
    String description;
    String status;

    public UploadChecklist(long checklistID, String label, String description, String status) {
        this.checklistID = checklistID;
        this.label = label;
        this.description = description;
        this.status = status;
    }

    public long getChecklistID() {
        return checklistID;
    }

    public void setChecklistID(long checklistID) {
        this.checklistID = checklistID;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

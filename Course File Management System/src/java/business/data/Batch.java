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
public class Batch 
{
    String intake;
    long batchID;

    public Batch(String intake, long batchID) {
        this.intake = intake;
        this.batchID = batchID;
    }
    
    public String getIntake() {
        return intake;
    }

    public void setIntake(String intake) {
        this.intake = intake;
    }

    public long getBatchID() {
        return batchID;
    }

    public void setBatchID(long batchID) {
        this.batchID = batchID;
    }
}

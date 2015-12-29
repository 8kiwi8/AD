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
public class YearSemester 
{
    long semesterID;
    String year;
    int semester;

    public YearSemester(long semesterID, String year, int semester) {
        this.semesterID = semesterID;
        this.year = year;
        this.semester = semester;
    }

    public long getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(long semesterID) {
        this.semesterID = semesterID;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
}

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
public class Section 
{
    String username;
    long semesterID;
    long sectionID;
    long CourseOfferedID;
    String courseCode;
    long courseID;
    int sectionNo;
    String sectionMajor;

    public Section(String username, long semesterID, long sectionID, long CourseOfferedID, String courseCode, long courseID, int sectionNo, String sectionMajor) {
        this.username = username;
        this.semesterID = semesterID;
        this.sectionID = sectionID;
        this.CourseOfferedID = CourseOfferedID;
        this.courseCode = courseCode;
        this.courseID = courseID;
        this.sectionNo = sectionNo;
        this.sectionMajor = sectionMajor;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(long semesterID) {
        this.semesterID = semesterID;
    }

    public long getSectionID() {
        return sectionID;
    }

    public void setSectionID(long sectionID) {
        this.sectionID = sectionID;
    }

    public long getCourseOfferedID() {
        return CourseOfferedID;
    }

    public void setCourseOfferedID(long CourseOfferedID) {
        this.CourseOfferedID = CourseOfferedID;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public long getCourseID() {
        return courseID;
    }

    public void setCourseID(long courseID) {
        this.courseID = courseID;
    }

    public int getSectionNo() {
        return sectionNo;
    }

    public void setSectionNo(int sectionNo) {
        this.sectionNo = sectionNo;
    }

    public String getSectionMajor() {
        return sectionMajor;
    }

    public void setSectionMajor(String sectionMajor) {
        this.sectionMajor = sectionMajor;
    }
}

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
public class CourseOffered 
{
    long semesterID;
    String courseCode;
    long courseID;
    String username;
    long CourseOfferedID;

    public CourseOffered(long semesterID, String courseCode, long courseID, String username, long CourseOfferedID) {
        this.semesterID = semesterID;
        this.courseCode = courseCode;
        this.courseID = courseID;
        this.username = username;
        this.CourseOfferedID = CourseOfferedID;
    }

    public long getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(long semesterID) {
        this.semesterID = semesterID;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getCourse_offered_ID() {
        return CourseOfferedID;
    }

    public void setCourse_offered_ID(long course_offered_ID) {
        this.CourseOfferedID = course_offered_ID;
    }
}

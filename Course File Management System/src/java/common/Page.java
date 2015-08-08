/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

/**
 *
 * @author Ahmad Rafiuddin
 */
public class Page {
    private String allowedUser;
    private String fileName;
    private String pageTitle;

    public Page(String userType, String fileName, String pageTitle) {
        this.allowedUser = userType;
        this.fileName = fileName;
        this.pageTitle = pageTitle;
    }

    public String getAllowedUser() {
        return allowedUser;
    }

    public void setAllowedUser(String userType) {
        this.allowedUser = userType;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }
    
}

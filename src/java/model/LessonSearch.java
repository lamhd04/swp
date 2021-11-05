/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author User
 */
public class LessonSearch {
    private String status;
    private int subject;
    private String searchcontent;

    public LessonSearch() {
    }

    public LessonSearch(String status, int subject, String searchcontent) {
        this.status = status;
        this.subject = subject;
        this.searchcontent = searchcontent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSubject() {
        return subject;
    }

    public void setSubject(int subject) {
        this.subject = subject;
    }

    public String getSearchcontent() {
        return searchcontent;
    }

    public void setSearchcontent(String searchcontent) {
        this.searchcontent = searchcontent;
    }
    
    
}

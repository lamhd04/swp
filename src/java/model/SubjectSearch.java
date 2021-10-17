/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author lhquan1
 */
public class SubjectSearch {

    private String title;
    private String author;
    private String status;
    private Integer pageIndex;
    private Integer pageSize;

    public SubjectSearch() {
    }

    public SubjectSearch(String title, String author, String status, Integer pageIndex, Integer pageSize) {
        this.title = title;
        this.author = author;
        this.status = status;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "SubjectSearch{" + "title=" + title + ", author=" + author + ", status=" + status + ", pageIndex=" + pageIndex + ", pageSize=" + pageSize + '}';
    }

   

    

}

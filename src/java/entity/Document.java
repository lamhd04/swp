/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author hungl
 */
public class Document {
    private int docID;
    private String thumbnail;
    private String title;
    private String author;
    private Date update_date;
    private String brief;
    private String content;
    private String doc_cate;

    public Document() {
    }

    public Document(int docID, String thumbnail, String title, String author, Date update_date, String brief, String content, String doc_cate) {
        this.docID = docID;
        this.thumbnail = thumbnail;
        this.title = title;
        this.author = author;
        this.update_date = update_date;
        this.brief = brief;
        this.content = content;
        this.doc_cate = doc_cate;
    }
    
    

    public int getDocID() {
        return docID;
    }

    public void setDocID(int docID) {
        this.docID = docID;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDoc_cate() {
        return doc_cate;
    }

    public void setDoc_cate(String doc_cate) {
        this.doc_cate = doc_cate;
    }

    
    

    
    
    
}

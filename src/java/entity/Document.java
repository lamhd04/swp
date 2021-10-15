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
    private int id;
    private String thumbnail;
    private String title;
    private String author;
    private Date update_date;
    private String brief_info;
    private String post_content;

    public Document() {
    }

    public Document(int id, String thumbnail, String title, String author, Date update_date, String brief_info, String post_content) {
        this.id = id;
        this.thumbnail = thumbnail;
        this.title = title;
        this.author = author;
        this.update_date = update_date;
        this.brief_info = brief_info;
        this.post_content = post_content;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getBrief_info() {
        return brief_info;
    }

    public void setBrief_info(String brief_info) {
        this.brief_info = brief_info;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    @Override
    public String toString() {
        return "Document{" + "id=" + id + ", thumbnail=" + thumbnail + ", title=" + title + ", author=" + author + ", update_date=" + update_date + ", brief_info=" + brief_info + ", post_content=" + post_content + '}';
    }

    
    
    
}

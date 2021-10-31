/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author HaGau
 */
public class Post {

    public int postid;
    public String thumbnail;
    public String title;
    public String brief;
    public String detail;
    public int cId;
    public int author;
    public String featured;
    public String time;
    public String status;
    public String postCate;

    public Post() {
    }

    public Post(int postid, String thumbnail, String title, String brief, String detail, int cId, int author, String featured, String time, String status) {
        this.postid = postid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.brief = brief;
        this.detail = detail;
        this.cId = cId;
        this.author = author;
        this.featured = featured;
        this.time = time;
        this.status = status;
    }

    public String getPostCate() {
        return postCate;
    }

    public void setPostCate(String postCate) {
        this.postCate = postCate;
    }

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
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

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public String getFeatured() {
        return featured;
    }

    public void setFeatured(String featured) {
        this.featured = featured;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Post{" + "postid=" + postid + ", thumbnail=" + thumbnail + ", title=" + title + ", brief=" + brief + ", detail=" + detail + ", cId=" + cId + ", author=" + author + ", featured=" + featured + ", time=" + time + ", status=" + status + '}';
    }

}

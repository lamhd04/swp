/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Exam {
    public int examID;
    public String title;
    public String thumbnail;
    public String exam_cate;
    public String brief;
    public String content;
    public String type;
    public Date date;

    public Exam() {
    }

    public Exam(int examID, String title, String thumbnail, String exam_cate, String brief, String content, String type, Date date) {
        this.examID = examID;
        this.title = title;
        this.thumbnail = thumbnail;
        this.exam_cate = exam_cate;
        this.brief = brief;
        this.content = content;
        this.type = type;
        this.date = date;
    }

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getExam_cate() {
        return exam_cate;
    }

    public void setExam_cate(String exam_cate) {
        this.exam_cate = exam_cate;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Exam{" + "examID=" + examID + ", title=" + title + ", thumbnail=" + thumbnail + ", exam_cate=" + exam_cate + ", brief=" + brief + ", content=" + content + ", type=" + type + ", date=" + date + '}';
    }
    
}

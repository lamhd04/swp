/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Question {
    private int qId;
    private String subject;
    private String category;
    private String subcategory;
    private String level;
    private String status;
    private String quiz;
    private String content;
    private String media;
    private String explanation;
    private ArrayList<Answer> list = new ArrayList<Answer>();

    public Question() {
    }

    public Question(int qId, String subject, String category, String subcategory, String level, String status, String quiz, String content, String media, String explanation) {
        this.qId = qId;
        this.subject = subject;
        this.category = category;
        this.subcategory = subcategory;
        this.level = level;
        this.status = status;
        this.quiz = quiz;
        this.content = content;
        this.media = media;
        this.explanation = explanation;
    }

    public int getqId() {
        return qId;
    }

    public void setqId(int qId) {
        this.qId = qId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(String subcategory) {
        this.subcategory = subcategory;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQuiz() {
        return quiz;
    }

    public void setQuiz(String quiz) {
        this.quiz = quiz;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public ArrayList<Answer> getList() {
        return list;
    }

    public void setList(ArrayList<Answer> list) {
        this.list = list;
    }


    
    
}

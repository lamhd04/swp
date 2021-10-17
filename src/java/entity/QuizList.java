/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Nhat Anh PC
 */
public class QuizList {
    private int quizId;
    private String title;
    private String subject;
    private String category;
    private String level;
    private String type;
    private String passRate;
    private String expert;

    public QuizList() {
    }

    public QuizList(int quizId, String title, String subject, String category, String level, String type, String passRate, String expert) {
        this.quizId = quizId;
        this.title = title;
        this.subject = subject;
        this.category = category;
        this.level = level;
        this.type = type;
        this.passRate = passRate;
        this.expert = expert;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPassRate() {
        return passRate;
    }

    public void setPassRate(String passRate) {
        this.passRate = passRate;
    }

    public String getExpert() {
        return expert;
    }

    public void setExpert(String expert) {
        this.expert = expert;
    }

    @Override
    public String toString() {
        return "QuizList{" + "quizId=" + quizId + ", title=" + title + ", subject=" + subject + ", category=" + category + ", level=" + level + ", type=" + type + ", passRate=" + passRate + ", expert=" + expert + '}';
    }
    
    
    
   

        

   
    
}

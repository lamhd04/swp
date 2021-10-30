/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

/**
 *
 * @author User
 */
public class Test {
    private int testId;
    private String subject;
    private String type;
    private String starttime;
    private int duration;
    private double result;
    private String tag;
    private int ques_numb;
    private String ques_cate;
    private String ques_subcate;

    public Test() {
    }

    public Test(int testId, String subject, String type, String starttime, int duration, double result, String tag, int ques_numb, String ques_cate, String ques_subcate) {
        this.testId = testId;
        this.subject = subject;
        this.type = type;
        this.starttime = starttime;
        this.duration = duration;
        this.result = result;
        this.tag = tag;
        this.ques_numb = ques_numb;
        this.ques_cate = ques_cate;
        this.ques_subcate = ques_subcate;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getQues_numb() {
        return ques_numb;
    }

    public void setQues_numb(int ques_numb) {
        this.ques_numb = ques_numb;
    }

    public String getQues_cate() {
        return ques_cate;
    }

    public void setQues_cate(String ques_cate) {
        this.ques_cate = ques_cate;
    }

    public String getQues_subcate() {
        return ques_subcate;
    }

    public void setQues_subcate(String ques_subcate) {
        this.ques_subcate = ques_subcate;
    }

    

    
    
}

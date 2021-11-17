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
public class Result {
    private int resultId;
    private int userId;
    private String questionId;
    private String answers;
    private String user_ans;

    public Result() {
    }

    public Result(int resultId, int userId, String questionId, String answers, String user_ans) {
        this.resultId = resultId;
        this.userId = userId;
        this.questionId = questionId;
        this.answers = answers;
        this.user_ans = user_ans;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public String getUser_ans() {
        return user_ans;
    }

    public void setUser_ans(String user_ans) {
        this.user_ans = user_ans;
    }

    @Override
    public String toString() {
        return "Result{" + "resultId=" + resultId + ", userId=" + userId + ", questionId=" + questionId + ", answers=" + answers + ", user_ans=" + user_ans + '}';
    }
    
   

    
}

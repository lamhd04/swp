/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Result;
import entity.Setting;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat Anh PC
 */
public class ResultDAO {
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;
    
    public void insertResult(int rId, int userId,String quesId,String answer,String user_ans){
        String sql="insert into Result values(?,?,?,?,?)";
        try{
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, rId);
            ps.setInt(2, userId);
            ps.setString(3, quesId);
            ps.setString(4, answer);
            ps.setString(5, user_ans);
            ps.executeUpdate();
        }catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

    }
    
    public int ResultId(){
        int count=0;
        try {
            String query = "SELECT resultId FROM result ORDER BY resultId DESC LIMIT 1; ";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
        return count;
    }
    
    public List<Result> ViewResult(){
        List<Result> list=new ArrayList<>();
        int rId=ResultId();
        try {
            conn = DBConnection.open();
            String sql = "select resultId,userId,Question.content,user_answer,true_answer from result join Question on result.quesId = Question.qID where resultId="+rId;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Result(rs.getInt("resultId"),
                        rs.getInt("userId"),
                        rs.getString("content"),
                        rs.getString("user_answer"),
                        rs.getString("true_answer")));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

        return list;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Answer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class QuestionDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public Question getQuestion(int qId) {
        Question q = null;
        try {
            conn = DBConnection.open();
            ArrayList<Answer> a = getAnswer(qId);
            String sql = "select * from Question where qId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, qId);
            rs = ps.executeQuery();
            while (rs.next()) {
                q = new Question(rs.getInt("qId"), rs.getString("subject"), rs.getString("category"), rs.getString("subcategory"),
                        rs.getString("level"), rs.getString("status"), rs.getString("quiz"), rs.getString("content"), rs.getString("media"), rs.getString("explanation"));
                q.setList(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return q;
    }

    public ArrayList<Answer> getAnswer(int qId) {
        ArrayList<Answer> a = new ArrayList<Answer>();
        try {
            String sql = "select * from AnswerOption where qId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, qId);
            rs = ps.executeQuery();
            while (rs.next()) {
                a.add(new Answer(rs.getInt("qId"), rs.getString("answer"), rs.getInt("key")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return a;
    }

    public void editQuestion(Question q) {
        try {
            conn = DBConnection.open();
            String sql = "update Question set [subject] = ?, category= ?,subcategory=?,[level]=?,[status]=?, quiz=?,content=?,media=?,explanation=? where qId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, q.getSubject());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getSubcategory());
            ps.setString(4, q.getLevel());
            ps.setString(5, q.getStatus());
            ps.setString(6, q.getQuiz());
            ps.setString(7, q.getContent());
            ps.setString(8, q.getMedia());
            ps.setString(9, q.getExplanation());
            ps.setInt(10, q.getqId());
            ps.executeUpdate();
            deleteAllAnswer(q.getqId());
            for (int i = 0; i < q.getList().size(); i++) {
                addAnswer(q.getList().get(i));
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public void deleteAllAnswer(int qId) {
        try {
            String sql = "delete from AnswerOption where qId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, qId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
    }

    public void addQuestion(Question q) {
        try {
            String sql = "insert into Question values (?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, q.getSubject());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getSubcategory());
            ps.setString(4, q.getLevel());
            ps.setString(5, q.getStatus());
            ps.setString(6, q.getQuiz());
            ps.setString(7, q.getContent());
            ps.setString(8, q.getMedia());
            ps.setString(9, q.getExplanation());
            ps.executeUpdate();
            for (int i = 0; i < q.getList().size(); i++) {
                addAnswer(q.getList().get(i));
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
    }

    public int getMaxId() {
        int count = 0;
        try {
            String query = "select MAX(qId) from Question";
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

    public void addAnswer(Answer q) {
        try {
            conn = DBConnection.open();
            String sql = "insert into AnswerOption values (?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, q.getqId());
            ps.setString(2, q.getAnswer());
            ps.setInt(3, q.getKey());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public void deleteAnAnswer(String answer, int qId) {
        try {
            conn = DBConnection.open();
            String sql = "delete from AnswerOption where answer = ? and qId=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, answer);
            ps.setInt(2, qId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public List<Question> search(String type, String name, int pageIndex, int pageSize, String order, String condition, String condition2) {
        List<Question> list = new ArrayList<Question>();
        try {

            String query = "select * from (select ROW_NUMBER() over (order by " + type + " " + order + ") as STT,* from Question \n"
                    + "where content like ? " + condition + condition2 + ") as x where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageIndex);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question q = null;
                q = new Question(rs.getInt("qId"), rs.getString("subject"), rs.getString("category"), rs.getString("subcategory"),
                        rs.getString("level"), rs.getString("status"), rs.getString("quiz"), rs.getString("content"), rs.getString("media"), rs.getString("explanation"));
                list.add(q);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int questionCount(String username, String condition, String condition2) {
        int count = 0;
        try {
            String query = "select count(*) from Question where content like ? " + condition + " " + condition2;
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + username + "%");
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

    public List<String> getAllCategory() {
        List<String> a = new ArrayList<String>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Setting where type = 'quiz_category'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                a.add(rs.getString("settingValue"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return a;
    }

    public List<String> getAllSubcategory(String type) {
        List<String> a = new ArrayList<String>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Setting where type = ? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                a.add(rs.getString("settingValue"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return a;
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        String a ="https://www.youtube.com/watch?v=vpRi8S6uXAg";
        String abc = "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]";
        if(a.matches(abc))
            System.out.println(true);
    }
}

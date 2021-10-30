/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class TestDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public Test getTest(int testId) {
        Test t = new Test();
        try {
            String sql = "select * from Test where testId=?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, testId);
            rs = ps.executeQuery();
            SubjectDAO dao = new SubjectDAO();
            while (rs.next()) {
                t.setTestId(rs.getInt("testId"));
                t.setDuration(rs.getInt("duration"));
                t.setStarttime(rs.getDate(sql).toString());
                t.setType(rs.getString("type"));
                t.setSubject(dao.getById(rs.getInt("subId")).getTitle());
                t.setTag(rs.getString("tag"));
                t.setQues_numb(rs.getInt("ques_numb"));
                t.setQues_cate(rs.getString("ques_cate"));
                t.setQues_subcate(rs.getString("ques_subcate"));
                t.setResult(rs.getDouble("result"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return t;
    }

    public void addTest(Test t) {
        try {
            String sql = "insert into Test values (?,?,'"+t.getStarttime()+"',?,?,?,?,?,?)";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(t.getSubject()));
            ps.setString(2, t.getType());
            ps.setInt(3, t.getDuration());
            ps.setDouble(4, t.getResult());
            ps.setString(5, t.getTag());
            ps.setInt(6, t.getQues_numb());
            ps.setString(7, t.getQues_cate());
            ps.setString(8, t.getQues_subcate());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

}

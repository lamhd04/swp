/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.TestDTO;
import dbconnection.DBConnection;
import entity.Test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
                t.setStarttime(rs.getString("starttime"));
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
            String sql = "insert into Test values (?,?,'"+t.getStarttime()+"',?,?,?,?,?,?,?)";
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
            ps.setFloat(9, t.getPass_rate());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public List<TestDTO> getTest(int pageIndex, int pageNum, int userId) {
        List<TestDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM\n"
                + "(SELECT ROW_NUMBER() OVER(ORDER BY testID) rowNum,t.testID,t.type, s.name as subjectName, t.start_time, t.duration,t.result, t.pass_rate  FROM [dbo].[Test] t\n"
                + "JOIN [dbo].[Subject] s ON s.subID =  t.subID\n"
                + ") temp\n"
                + "where temp.rowNum >= ? AND temp.rowNum < ?";

        Connection conn = dbconnection.DBConnection.open();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            int index = 0;
            int start = (pageIndex - 1) * pageNum;
            int end = start + pageNum;
            stm.setInt(++index, start);
            stm.setInt(++index, end);
            rs = stm.executeQuery();
            System.out.println(start);
            while (rs.next()) {
                TestDTO test = new TestDTO();
                test.setId(rs.getInt("testID"));
                test.setType(rs.getString("type"));
                test.setSubjectName(rs.getString("subjectName"));
                test.setStartTime(rs.getString("start_time"));
                test.setDuration(rs.getInt("duration"));
                test.setResult(rs.getFloat("result"));
                test.setPassRate(rs.getFloat("pass_rate"));
                result.add(test);
            }
        } catch (SQLException ex) {

        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

            }

        }
        return result;
    }

    public int count() {
        String sql = "SELECT COUNT(*) as total FROM [dbo].[Test]";

        Connection conn = dbconnection.DBConnection.open();

        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {

        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

            }
        }
        return 0;
    }
}

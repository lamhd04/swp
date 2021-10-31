/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.TestDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class TestDAO {

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

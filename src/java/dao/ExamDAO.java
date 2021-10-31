/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Exam;
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
public class ExamDAO {

    public List<Exam> getExam(int number) {
        String sql = "SELECT * FROM [dbo].[Exam]";
        List<Exam> result = new ArrayList<>();
        Connection con = dbconnection.DBConnection.open();
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Exam ex = new Exam();
                ex.setId(rs.getInt("examID"));
                ex.setThumbnail(rs.getString("thumbnail"));
                result.add(ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Account;
import entity.Dimension;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class DimensionDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Dimension> getAllBySubjectId(int subjectId) {
        List<Dimension> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from [Dimension] where subject_id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, subjectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Dimension(rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("dimension"),
                        rs.getInt("subject_id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

}

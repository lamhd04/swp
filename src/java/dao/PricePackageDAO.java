/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.PricePackage;
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
public class PricePackageDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<PricePackage> getAllBySubjectId(int subjectId) {
        List<PricePackage> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from [Price_Package] where subject_id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, subjectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PricePackage(rs.getInt("id"),
                        rs.getString("package"),
                        rs.getInt("duration"),
                        rs.getInt("list_price"),
                        rs.getInt("sale_price"),
                        rs.getString("status"),
                        rs.getInt("subject_id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PricePackageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
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
 * @author admin
 */
public class CategoryDao {

    public List<Category> getByType(String type) {
        String sql = "SELECT * FROM Categories"
                + " WHERE type = ?";

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        conn = dbconnection.DBConnection.open();
        List<Category> result = new ArrayList<>();
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, type);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category data = new Category();
                data.setId(rs.getInt("category_id"));
                data.setName(rs.getString("skin_type"));
                result.add(data);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return result;
    }
}

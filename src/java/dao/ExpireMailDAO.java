/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Account;
import entity.EmailExpire;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDate;
import java.util.Calendar;

/**
 *
 * @author hungl
 */
public class ExpireMailDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public  void addEmail(int id, Date dueDate) {
        try {
            conn = DBConnection.open();
            String sql = "insert into ExpireMail values (?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setDate(2, dueDate);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }
    
    public Date getdueDate(int id){
        Date dt = null;
        try {
            String sql = "select dueDate from ExpireMail where id = ? order by dueDate desc limit 1";
            conn = DBConnection.open();            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);            
            rs = ps.executeQuery();
            while (rs.next()) {                
                  dt = rs.getDate(1);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ExpireMailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return dt;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Setting;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
 * @author Nhat Anh PC
 */
public class SettingDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Setting> getSetting() {
        List<Setting> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Setting";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

        return list;
    }

    public Setting getSettingById(String sid) {
        Setting set = new Setting();
        try {
            conn = DBConnection.open();
            String sql = "select * from Setting where settingId=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, sid);
            rs = ps.executeQuery();
            while (rs.next()) {
                set.setSettingId(rs.getInt(1));
                set.setType(rs.getString(2));
                set.setSettingValue(rs.getString(3));
                set.setSettingOrder(rs.getInt(4));
                set.setStatus(rs.getString(5));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

        return set;
    }

    public void addSetting(String type, String value,
            String order, String status) {
        String sql = "insert into Setting(type,settingValue,settingOrder,status) values (?,?,?,?)";
        try {
            conn = DBConnection.open();

            ps = conn.prepareStatement(sql);
            ps.setString(1, type);
            ps.setString(2, value);
            ps.setString(3, order);
            ps.setString(4, status);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

    }

    public void editSetting(String type, String value,
            String order, String status, String sid) {
        String query = "Update Setting set type=?,settingValue=? , settingOrder=? , status=? Where settingId = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, type);
            ps.setString(2, value);
            ps.setString(3, order);
            ps.setString(4, status);
            ps.setString(5, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

    }

    public int settingCount() {
        int count = 0;
        try {
            String query = "select count(*) from Setting";
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

    public List<Setting> paging(int index) {
        List<Setting> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select* from Setting order by settingId offset ? rows fetch next 6 rows only ";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

        return list;
    }

    public void deleteSetting(int sid) {
        try {
            conn = DBConnection.open();
            String sql = "delete from setting where settingId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public List<Setting> getSettingByType(String type) {
        List<Setting> list = new ArrayList<Setting>();
        try {
            String sql = "select * from Setting where type= ?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("settingId"),
                        rs.getString("type"),
                        rs.getString("settingValue"),
                        rs.getInt("settingOrder"),
                        rs.getString("status")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return list;
    }

    public List<Setting> paging(String col, int pageIndex, int pageSize, String order) {
        List<Setting> list = new ArrayList<Setting>();
        try {
            String query = "select * from (select ROW_NUMBER() over (order by " + col + " " + order + ") as STT,* from Setting \n"
                    + ") as x where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageIndex);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("settingId"),
                        rs.getString("type"),
                        rs.getString("settingValue"),
                        rs.getInt("settingOrder"),
                        rs.getString("status")));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }


}

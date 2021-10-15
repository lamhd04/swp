/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Account;
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
public class AccountDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Account> getAccounts() {
        List<Account> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "Select * from [Project].[dbo].[Account]";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account user = new Account();
                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(getSetting(rs.getInt("permission")));
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int getMaxId() {
        int count = 0;
        try {
            String query = "select MAX(userId) from Account";
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

    public Account getAccount(int userId) {
        Account user = new Account();
        try {
            conn = DBConnection.open();
            String sql = "select * from Account where userId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(getSetting(rs.getInt("permission")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return user;
    }

    public Account getAccount(String email) {
        Account user = new Account();
        try {
            conn = DBConnection.open();
            String sql = "select * from Account where email = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {

                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(getSetting(rs.getInt("permission")));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }

    public void addAcc(Account account) {
        try {
            conn = DBConnection.open();
            String sql = "insert into Account values (?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, account.getUserId());
            ps.setString(2, account.getFullname());
            ps.setString(3, account.getUserTitle());
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getPassword());
            ps.setString(6, account.getPhone());
            ps.setString(7, account.getAddress());
            ps.setInt(8, 0);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public String getSetting(int permission) {
        String role = null;
        try {
            String sql1 = "select * from Setting where [type]='user_role' and settingOrder=?";
            ps = conn.prepareStatement(sql1);
            ps.setInt(1, permission);
            rs = ps.executeQuery();
            while (rs.next()) {
                role = rs.getString("settingValue");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return role;
    }
    public int getSetting(String settingValue) {
        int i = 0;
        try {
            String sql = "select * from Setting where [type]='user_role' and settingValue=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, settingValue);
            rs = ps.executeQuery();
            while (rs.next()) {
                i = rs.getInt("settingOrder");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
           
        }
        return i;
    }
    public void editAccount(Account user) {
        try {
            conn = DBConnection.open();
            int i = getSetting(user.getPermission());
            String sql = "update Account set fullname = ?, userTitle= ?,phone=?,address=?,permission=?,status=? where userId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getUserTitle());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setInt(5, i);
            ps.setString(6, user.getStatus());
            ps.setInt(7, user.getUserId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public List<Account> search(String type, String name, int pageIndex, int pageSize, String order, String condition) {
        List<Account> list = new ArrayList<Account>();
        try {
            
            String query = "select * from (select ROW_NUMBER() over (order by " + type + " " + order + ") as STT,* from Account \n"
                    + "where fullname like ? " + condition + ") as x where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageIndex);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account user = new Account();
                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(rs.getString("permission"));
                user.setStatus(rs.getString("status"));
                list.add(user);
            }
            for(int i=0;i<list.size();i++){
                list.get(i).setPermission(getSetting(Integer.parseInt(list.get(i).getPermission())));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int accountCount(String username,String condition) {
        int count = 0;
        try {
            String query = "select count(*) from dbo.Account where fullname like ? "+condition+"";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%"+username+"%");
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

}

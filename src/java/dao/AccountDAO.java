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
            String sql = "Select * from Account";
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
                user.setStatus(rs.getString("status"));
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
            String sql = "select * from Account where email=?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setStatus(rs.getString("status"));               
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
            String sql = "INSERT INTO Account( fullname, userTitle, email, password, phone, address, permission,status)"
                    + " VALUES(?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            int index = 0;
            ps.setString(++index, account.getFullname());
            ps.setString(++index, account.getUserTitle());
            ps.setString(++index, account.getEmail());
            ps.setString(++index, account.getPassword());
            ps.setString(++index, account.getPhone());
            ps.setString(++index, account.getAddress());
            ps.setInt(++index, 0);
            ps.setString(++index, account.getStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }
public boolean getAuthorization(String url, Account acc) {
        List<Integer> i=new ArrayList<Integer>();
        try {
            conn = DBConnection.open();
            String sql = "Select * from Authorization where url = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, url);
            rs = ps.executeQuery();
            while (rs.next()) {
                i.add(rs.getInt("permission"));
            }
            if (i.contains(getSetting(acc.getPermission()))) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return false;
    }
    public String getSetting(int permission) {
        String role = null;
        try {
            String sql1 = "select * from Setting where type='user_role' and settingOrder=?";
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
            String sql = "select * from Setting where type='user_role' and settingValue=?";
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
    
    public void editUserPass(Account user) {
        try {
            conn = DBConnection.open();
           
            String sql = "update Account set password=? where userId = ?;";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, user.getPassword());
            ps.setInt(2, user.getUserId());
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

            String query = "select * from (select ROW_NUMBER() over (order by " + type + " " + order + ") as STT,userId,fullname,userTitle,email,password,phone,address,permission,status from Account \n"
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
                user.setStatus(rs.getString("status"));
                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(rs.getString("permission"));                
                list.add(user);
            }
            for (int i = 0; i < list.size(); i++) {
                list.get(i).setPermission(getSetting(Integer.parseInt(list.get(i).getPermission())));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int accountCount(String username, String condition) {
        int count = 0;
        try {
            String query = "select count(*) from Account where fullname like ? " + condition + "";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + username + "%");
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

    public List<Account> getStudentByClassId(int classId) {
        String sql = "				select * from Account\n"
                + "				join class_student\n"
                + "				on class_student.userID = Account.userID\n"
                + "				join Class\n"
                + "				on Class.classID = class_student.class_id\n"
                + "				where Class.classID = ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        List<Account> result = new ArrayList<>();
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, classId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account user = new Account();
                user.setStatus(rs.getString("status"));
                user.setUserId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                user.setUserTitle(rs.getString("userTitle"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPermission(rs.getString("permission"));
                result.add(user);

            }
        } catch (Exception e) {
        }
        return result;
    }
}

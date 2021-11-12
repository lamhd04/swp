/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Class;

/**
 *
 * @author admin
 */
public class ClassDao {

    public List<Class> getByClassName(int pageIndex, int pageSize, String className) {
        String sql = "SELECT * FROM ( SELECT ROW_NUMBER() OVER(ORDER BY classID) AS rowNum,c.classID,c.createdDate,c.endDate,c.status,c.className ,a.fullname FROM [dbo].[Class] c\n"
                + "JOIN [dbo].[Account] a ON c.userID = a.userID) temp\n"
                + "WHERE temp.className LIKE ? AND temp.rowNum >= ? AND temp.rowNum < ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        List<Class> result = new ArrayList<>();
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            System.out.println("- pageIndex = " + pageIndex + "    pageSize = " + pageSize + "    keyword = " + className);
            int start = pageSize * (pageIndex - 1) + 1;
            int end = start + pageSize;
            System.out.println("- start = " + start + "    end = " + end);
            stm.setString(1, "%" + className.toUpperCase() + "%");
            stm.setInt(2, start);
            stm.setInt(3, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                Class item = new Class();
                item.setId(rs.getInt("classID"));
                item.setClassName(rs.getString("className"));
                item.setStatus("status");
                item.setOwner(rs.getString("fullname"));
                result.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        System.out.println("data size = " + result.size());

        return result;
    }

    public int countByClassName(String keyword) {
        String sql = "SELECT COUNT(*) as total FROM [dbo].[Class]"
                + " WHERE className LIKE ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return 0;
    }

    public Class getById(int id) {
        String sql = " SELECT c.classID,c.createdDate,c.endDate,c.status,c.className ,a.fullname, a.userID, s.total_student,sj.total_subject FROM [dbo].[Class] c\n"
                + "             LEFT  JOIN [dbo].[Account] a ON c.userID = a.userID\n"
                + "				LEFT JOIN (\n"
                + "				SELECT  count(*) as total_student, class_id from class_student\n"
                + "				GROUP by class_id) s\n"
                + "				ON s.class_id = c.classID\n"
                + "				LEFT JOIN (	SELECT  count(*) as total_subject, class_id from class_subject\n"
                + "				GROUP by class_id) sj\n"
                + "				ON sj.class_id = c.classID\n"
                + "                WHERE c.classID = ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                Class result = new Class();
                result.setId(rs.getInt("classID"));
                result.setClassName(rs.getString("className"));
                result.setStatus(rs.getString("status"));
                result.setOwner(rs.getString("fullname"));
                result.setNumberOfUser(rs.getInt("total_student"));
                result.setNumberOfSubject(rs.getInt("total_subject"));
                result.setOwnerId(rs.getInt("userID"));
                return result;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return null;
    }

    public boolean checkExist(int studentId, int classId) {
        String sql = "SELECT COUNT(*) as total FROM class_student "
                + "WHERE userID = ?  AND class_id = ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, studentId);
            stm.setInt(2, classId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (rs.getInt("total") == 1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return false;
    }

    public void insertStudent(int studentId, int classId) {
        String sql = "INSERT INTO class_student(id, userID, class_id) VALUES(?,?,?)";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setString(1, System.currentTimeMillis() + "");
            stm.setInt(2, studentId);
            stm.setInt(3, classId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
    }

    public List<Account> getAllTeacher() {
        String sql = "SELECT * FROM Account "
                + " WHERE permission = 5";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        conn = dbconnection.DBConnection.open();
        List<Account> result = new ArrayList<>();
        try {
            stm = conn.prepareStatement(sql);
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
                result.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return result;
    }

    public void update(String className, int owner, String status, int classId) {
        String sql = "UPDATE Class"
                + " SET userID = ?,"
                + " status = ?,"
                + "className = ?"
                + " WHERE classID = ?";
        Connection conn = null;
        PreparedStatement stm = null;
        conn = dbconnection.DBConnection.open();
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, owner);
            stm.setString(2, status);
            stm.setString(3, className);
            stm.setInt(4, classId);
            stm.executeUpdate();
        } catch (Exception e) {

        } finally {
            dbconnection.DBConnection.close(conn, stm);

        }
    }

    public int removeStudent(int id, int classId) {
        String sql = "DELETE FROM class_student"
                + " WHERE userID = ? AND class_id = ?";
        Connection conn = null;
        PreparedStatement stm = null;;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, classId);
            return stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return -1;
    }

    public int removeSubject(int id, int classId) {
        String sql = "DELETE FROM class_subject"
                + " WHERE subID = ? AND class_id = ?";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, classId);
            return stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return -1;
    }

    public void insertClass(Class data) {
        String sql = "INSERT INTO Class(classID,userID,status,createdDate,startDate, endDate, className, createdBy) VALUES (?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement stm = null;;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setInt(1, data.getId());
            stm.setInt(2, data.getOwnerId());
            stm.setString(3, data.getStatus());
            stm.setString(4, data.getCreatedDate());
            stm.setString(5, data.getStartDate());
            stm.setString(6, data.getEndDate());
            stm.setString(7, data.getClassName());
            stm.setInt(8, data.getCreatedBy());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
    }

    public int countClass() {
        String sql = "SELECT COUNT(*) AS total FROM class";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return 0;

    }

    public boolean checkExistClassName(String className) {
        String sql = "SELECT COUNT(*) AS total FROM class"
                + " WHERE className = ?";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = dbconnection.DBConnection.open();
            stm = conn.prepareStatement(sql);
            stm.setString(1, className);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (rs.getInt("total") >= 1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClassDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbconnection.DBConnection.close(conn, stm);
        }
        return false;
    }
}

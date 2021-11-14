/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Lesson;
import entity.Question;
import entity.Test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LessonSearch;
import model.QuestionSearch;

/**
 *
 * @author User
 */
public class LessonDAO {

    public List<Lesson> search(int pageIndex, int pageSize, LessonSearch qs) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        PreparedStatement ps;
        List<Lesson> list = new ArrayList<Lesson>();
        try {

            String subject = "";
            String status = "";
            String content = "";

            if (qs.getSearchcontent() != null) {
                content = qs.getSearchcontent();
            }
            if (qs.getStatus() != null&&!qs.getStatus().equals("")) {
                status = " and status='" + qs.getStatus() + "'";
            }
            if (qs.getSubject() != 0) {
                subject = " and subID='" + qs.getSubject() + "'";
            }
            String query = "select * from (select ROW_NUMBER() over (order by lessonId asc) as STT,lessonId,subID,title,status,brief,content from Lesson \n"
                    + "where (content like ? or brief like ?)" + status + subject + ") as x where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + content + "%");
            ps.setString(2, "%" + content + "%");
            ps.setInt(3, pageIndex);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageIndex);
            ps.setInt(6, pageSize);
            rs = ps.executeQuery();
            SubjectDAO dao = new SubjectDAO();
            while (rs.next()) {
                Lesson l = new Lesson(rs.getInt("lessonId"), dao.getById(rs.getInt("subID")).getTitle(), rs.getString("title"),
                        rs.getString("status"), rs.getString("brief"), rs.getString("content"));
                list.add(l);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public Lesson getLesson(int testId) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        PreparedStatement ps;
        Lesson t = new Lesson();
        try {
            String sql = "select * from Lesson where lessonId=?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, testId);
            rs = ps.executeQuery();
            SubjectDAO dao = new SubjectDAO();
            while (rs.next()) {
                t.setLessonId(rs.getInt("lessonId"));
                t.setSubject(dao.getById(rs.getInt("subID")).getTitle());
                t.setBrief(rs.getString("brief"));
                t.setStatus(rs.getString("status"));
                t.setContent(rs.getString("content"));
                t.setTitle(rs.getString("title"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return t;
    }

    public void addLesson(Lesson l) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        PreparedStatement ps;
        try {
            String sql = "insert into Lesson (subID,title,status,brief,content) values (?,?,?,?,?)";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(l.getSubject()));
            ps.setString(2, l.getTitle());
            ps.setString(3, l.getStatus());
            ps.setString(4, l.getBrief());
            ps.setString(5, l.getContent());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public void updateLesson(Lesson l) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        PreparedStatement ps;
        try {
            String sql = "update Lesson set subId=?,title=?,status=?,brief=?,content=? where lessonId=?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(l.getSubject()));
            ps.setString(2, l.getTitle());
            ps.setString(3, l.getStatus());
            ps.setString(4, l.getBrief());
            ps.setString(5, l.getContent());
            ps.setInt(6, l.getLessonId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public int lessonCount(LessonSearch qs) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        PreparedStatement ps;
        int count = 0;
        try {

            String subject = "";
            String status = "";
            String content = "";

            if (qs.getSearchcontent() != null) {
                content = qs.getSearchcontent();
            }
            if (qs.getStatus() != null&&!qs.getStatus().equals("")) {
                status = " and status='" + qs.getStatus() + "'";
            }
            if (qs.getSubject() != 0) {
                subject = " and subID='" + qs.getSubject() + "'";
            }
            String query = "select count(*) from Lesson where (content like ? or brief like ?) "+ status + subject;
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + content + "%");
            ps.setString(2, "%" + content + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
             Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return count;
    }
}

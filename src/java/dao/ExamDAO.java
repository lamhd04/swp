package dao;

import dbconnection.DBConnection;
import entity.Exam;
import entity.Exam;
import entity.Setting;
import entity.Setting;
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
 * @author HaGau
 */
public class ExamDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Exam> getExams() {
        List<Exam> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Exam ex = new Exam();
                ex.setExamID(rs.getInt("examID"));
                ex.setTitle(rs.getString("title"));
                ex.setThumbnail(rs.getString("thumbnail"));
                ex.setExam_cate(rs.getString("settingValue"));
                ex.setBrief(rs.getString("brief"));
                ex.setContent(rs.getString("content"));
                ex.setType(rs.getString("type"));
                ex.setDate(rs.getDate("date"));
                list.add(ex);
            }
        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Exam> getFreeExams() {
        List<Exam> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID where Exam.type = 'Free'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Exam ex = new Exam();
                ex.setExamID(rs.getInt("examID"));
                ex.setTitle(rs.getString("title"));
                ex.setThumbnail(rs.getString("thumbnail"));
                ex.setExam_cate(rs.getString("settingValue"));
                ex.setBrief(rs.getString("brief"));
                ex.setContent(rs.getString("content"));
                ex.setType(rs.getString("type"));
                ex.setDate(rs.getDate("date"));
                list.add(ex);
            }
        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Setting> getExamCategories() {
        List<Setting> list = new ArrayList<>();
        String query = "Select * from Setting where type = 'exam_category'";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Exam> getPostbyCID(String id) {
        List<Exam> list = new ArrayList<>();
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID where exam_cate = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public Exam getExambyID(String id) {
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID where examID = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }

    public int getTotalExam() {
        String query = "select count(*) from Exam";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return 0;
    }

    public List<Exam> pagingExam(int index) {
        List<Exam> list = new ArrayList<>();
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID order by examID limit 4 offset ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Exam> SearchExambyTitle(String searchTitle) {
        List<Exam> list = new ArrayList<>();
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID where title like ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchTitle + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Exam> getRecentExam() {
        List<Exam> list = new ArrayList<>();
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID order by date desc limit 2";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            System.out.println(query);
            while (rs.next()) {
                list.add(new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public void addExam(String title, String thumbnail, int exam_cate, String brief, String content, String type) {
        String query = "insert into Post(title,thumbnail,exam_cate,brief,detail,type) values (?,?,?,?,?,?)";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, thumbnail);
            ps.setInt(3, exam_cate);
            ps.setString(4, brief);
            ps.setString(5, content);
            ps.setString(6, type);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public void deleteExam(String id) {
        String query = "delete from Exam where examID = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }
    
    public List<Exam> getTop3Exam() {
        List<Exam> list = new ArrayList<>();
        String query = "select examID,title,thumbnail,settingValue,brief,content,Exam.type,date from Exam join Setting on Exam.exam_cate = Setting.settingID order by date desc limit 3";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }
    
    
}

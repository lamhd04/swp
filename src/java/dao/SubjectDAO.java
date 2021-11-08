/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SubjectSearch;

/**
 *
 * @author User
 */
public class SubjectDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Subject> search(SubjectSearch param) {
        List<Subject> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from [Subject]\n"
                    + "where 1=1 @@@\n"
                    + "order by id\n"
                    + "offset (?-1)*? row fetch next ? row only";
            List<Object> params = new ArrayList<>();
            StringBuilder condition = new StringBuilder();
            if (param.getTitle() != null) {
                params.add("%" + param.getTitle() + "%");
                condition.append("and title like ? ");
            }
            if (param.getAuthor() != null) {
                params.add("%" + param.getAuthor() + "%");
                condition.append("and author like ? ");
            }
            if (param.getStatus() != null) {
                params.add("%" + param.getStatus() + "%");
                condition.append("and status like ? ");
            }
            int pageIndex = param.getPageIndex() != null ? param.getPageIndex() : 1;
            int pageSize = param.getPageSize() != null ? param.getPageSize() : 10;
            params.add(pageIndex);
            params.add(pageSize);
            params.add(pageSize);
            sql = sql.replace("@@@", condition);
            ps = conn.prepareStatement(sql);

            //set param
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt("subID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getBoolean("featured"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Subject> getAll() {
        List<Subject> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Subject";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                list.add(new Subject(rs.getInt("subID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getBoolean("featured"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }
        public List<Subject> getByStatus() {
        List<Subject> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Subject where status='published'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();           
            while (rs.next()) {
                list.add(new Subject(rs.getInt("subID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getBoolean("featured"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int totalSubjects(SubjectSearch param) {

        try {
            conn = DBConnection.open();
            String sql = "select count(*) from [Subject]\n"
                    + "where 1=1 @@@";
            List<Object> params = new ArrayList<>();
            StringBuilder condition = new StringBuilder();
            if (param.getTitle() != null) {
                params.add("%" + param.getTitle() + "%");
                condition.append("and title like ? ");
            }
            if (param.getAuthor() != null) {
                params.add("%" + param.getAuthor() + "%");
                condition.append("and author like ? ");
            }
            if (param.getStatus() != null) {
                params.add("%" + param.getStatus() + "%");
                condition.append("and status like ? ");
            }
            sql = sql.replace("@@@", condition);
            ps = conn.prepareStatement(sql);

            //set param
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return 0;
    }

    public Subject getById(int subjectId) {
        try {
            conn = DBConnection.open();
            String sql = "select * from [Subject] where subID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, subjectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Subject(rs.getInt("subID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getBoolean("featured"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }
        public Subject getByTitle(String title) {
        try {
            conn = DBConnection.open();
            String sql = "select * from [Subject] where title = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Subject(rs.getInt("subID"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("status"),
                        rs.getBoolean("featured"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }

    public boolean insert(Subject subject) {
        int count = 0;
        try {
            conn = DBConnection.open();
            String sql = "INSERT INTO [dbo].[Subject]\n"
                    + "           ([title]\n"
                    + "           ,[author]\n"
                    + "           ,[status]\n"
                    + "           ,[featured]\n"
                    + "           ,[category]\n"
                    + "           ,[name]\n"
                    + "           ,[description])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, subject.getTitle());
            ps.setString(2, subject.getAuthor());
            ps.setString(3, subject.getStatus());
            ps.setBoolean(4, subject.isFeatured());
            ps.setString(5, subject.getCategory());
            ps.setString(6, subject.getName());
            ps.setString(7, subject.getDescription());
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return count > 0;
    }

    public boolean update(Subject subject) {
        int count = 0;
        try {
            conn = DBConnection.open();
            String sql = "UPDATE [dbo].[Subject]\n"
                    + "   SET [status] = ?\n"
                    + "      ,[featured] = ?\n"
                    + "      ,[category] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[description] = ?\n"
                    + " WHERE id=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, subject.getStatus());
            ps.setBoolean(2, subject.isFeatured());
            ps.setString(3, subject.getCategory());
            ps.setString(4, subject.getName());
            ps.setString(5, subject.getDescription());
            ps.setInt(6, subject.getId());
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return count > 0;
    }

}

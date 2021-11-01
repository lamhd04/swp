/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Post;
import entity.PostCategory;
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
public class PostDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Post> getPosts() {
        List<Post> list = new ArrayList<>();
        String query = "Select * from Post";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post pt = new Post();
                pt.setPostid(rs.getInt("postid"));
                pt.setThumbnail(rs.getString("thumbnail"));
                pt.setTitle(rs.getString("title"));
                pt.setBrief(rs.getString("brief"));
                pt.setDetail(rs.getString("detail"));
                pt.setPostCate(rs.getString("post_cate"));
                pt.setAuthor(rs.getInt("author"));
                pt.setFeatured(rs.getString("featured"));
                pt.setTime(rs.getString("time"));
                pt.setStatus(rs.getString("status"));
                list.add(pt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<PostCategory> getPostCategories() {
        List<PostCategory> list = new ArrayList<>();
        String query = "Select * from PostCategory";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PostCategory(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Post> getPostbyCID(String id) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post where cId=?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public Post getPostbyID(String id) {
        String query = "select * from Post where postid=?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }
    public int getTotalPost() {
        String query = "select count(*) from Post";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return 0;
    }

    public List<Post> pagingPost(int index) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post order by postid offset ? rows fetch next 4 rows only";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Post> SearchPostbyTitle(String searchTitle) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post where title like ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchTitle + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Post> getRecentPost() {
        List<Post> list = new ArrayList<>();
        String query = "select top 2 * from Post order by [time] desc";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }
    
    public void addPost(String title,String thumbnail, String author, String brief, String detail) {
        String query = "insert into Post(title,thumbnail,author,brief,detail) values (?,?,?,?,?)";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, thumbnail);
            ps.setString(3, author);
            ps.setString(4, brief);     
            ps.setString(5, detail);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public void deletePost(String id) {
        String query = "delete from Post where postid = ?";
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
    public void editPost(String title,String thumbnail, String author, String brief, String detail, String postid) {
        String query = "update Post set title =? ,thumbnail = ?,author = ?,brief =?,detail = ? where postid = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, thumbnail);
            ps.setString(3, author);
            ps.setString(4, brief);     
            ps.setString(5, detail);
            ps.setString(6, postid);
            ps.executeUpdate();
        }  catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }
}

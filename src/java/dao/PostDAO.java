/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBContext;
import entity.Post;
import entity.PostCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post pt = new Post();
                pt.setPostid(rs.getInt("postId"));
                pt.setThumbnail(rs.getString("thumbnail"));
                pt.setTitle(rs.getString("title"));
                pt.setBrief(rs.getString("brief"));
                pt.setDetail(rs.getString("detail"));
                pt.setcId(rs.getInt("cid"));
                pt.setAuthor(rs.getInt("author"));
                pt.setFeatured(rs.getString("featured"));
                pt.setTime(rs.getDate("time"));
                pt.setStatus(rs.getString("status"));
                list.add(pt);
            }
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<PostCategory> getPostCategories() {
        List<PostCategory> list = new ArrayList<>();
        String query = "Select * from PostCategory";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PostCategory(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Post> getPostbyCID(String id) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post where cId=?";
        try {
            conn = new DBContext().getConnection();
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
                        rs.getDate(9),
                        rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Post getPostbyID(String id) {
        String query = "select * from Post where postid=?";
        try {
            conn = new DBContext().getConnection();
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
                        rs.getDate(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
}

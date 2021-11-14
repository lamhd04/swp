/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Document;
import entity.Setting;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hungl
 */
public class DocumentDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Document> getDocuments(String title) {
        List<Document> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Document where title like '%"+title+"%' order by update_date desc ";
                       
            ps = conn.prepareStatement(sql);
            //ps.setString(1, "'%" + title + "%'");       
            rs = ps.executeQuery();
            while (rs.next()) {
                Document doc = new Document();
                doc.setDocID(rs.getInt("docID"));
                doc.setThumbnail(rs.getString("thumbnail"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setUpdate_date(rs.getDate("update_date"));
                doc.setBrief(rs.getString("brief"));
                doc.setContent(rs.getString("post"));
                list.add(doc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }
    
    public int documentCount(String username) {
        int count = 0;
        try {
            String query = "select count(*) from Document where title like ? ";
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
    
    public List<Document> getDocumentByCategory(String category) {
        List<Document> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Document where doc_cate = '" + category+"'";            
            ps = conn.prepareStatement(sql);            
            rs = ps.executeQuery();
            while (rs.next()) {
                Document doc = new Document();
                doc.setDocID(rs.getInt("docID"));
                doc.setThumbnail(rs.getString("thumbnail"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setUpdate_date(rs.getDate("update_date"));
                doc.setBrief(rs.getString("brief"));
                doc.setContent(rs.getString("content"));
                doc.setDoc_cate(rs.getString("doc_cate"));
                list.add(doc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<Document> getDocumentsById(int id) {
        List<Document> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "Select * from Document where docID = " + id;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Document doc = new Document();
                doc.setDocID(rs.getInt("docID"));
                doc.setThumbnail(rs.getString("thumbnail"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setUpdate_date(rs.getDate("update_date"));
                doc.setBrief(rs.getString("brief"));
                doc.setContent(rs.getString("content"));
                doc.setDoc_cate(rs.getString("doc_cate"));
                list.add(doc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }


    public List<Document> searchDocument(String type, String title, int pageIndex, int pageSize, String order,String condition) {
        List<Document> list = new ArrayList<Document>();
        try {
            String query = "select * from (select ROW_NUMBER() over (order by " + type + " " + order + ") as STT,docID,thumbnail,title,brief,content,doc_cate,author,update_date from Document \n"
                    + "where title like ? "+condition+" ) as x where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + title + "%");
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageIndex);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Document doc = new Document();
                doc.setDocID(rs.getInt("docID"));
                doc.setThumbnail(rs.getString("thumbnail"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setUpdate_date(rs.getDate("update_date"));
                doc.setBrief(rs.getString("brief"));
                doc.setContent(rs.getString("content"));
                doc.setDoc_cate(rs.getString("doc_cate"));
                list.add(doc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
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
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return list;
    }
    public List<Document> getTopDocument() {
        List<Document> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "select * from Document order by title limit 5";
            
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Document doc = new Document();
                doc.setDocID(rs.getInt("docID"));
                doc.setThumbnail(rs.getString("thumbnail"));
                doc.setTitle(rs.getString("title"));
                doc.setAuthor(rs.getString("author"));
                doc.setUpdate_date(rs.getDate("update_date"));
                doc.setBrief(rs.getString("brief"));
                doc.setContent(rs.getString("content"));
                list.add(doc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconnection.DBConnection;
import entity.Slider;
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
 * @author hungl
 */
public class SliderDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    public List<Slider> getAllSliders() {
        List<Slider> list = new ArrayList<>();
        try {
            conn = DBConnection.open();
            String sql = "Select * from Slider where status = 'active'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setSliderID(rs.getInt("sliderID"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setNote(rs.getString("note"));
                s.setStatus(rs.getString("status"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public Slider getSliderById(int id) {
        
        try {
            conn = DBConnection.open();
            String sql = "Select * from Slider where sliderID = " + id;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return null;
    }

    public void editSlider(Slider s) {
        String sql = "update Slider set title = ?, image = ?, backlink = ?, note = ?, status = ? where sliderID = ?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setString(1, s.getTitle());
            ps.setString(2, s.getImage());
            ps.setString(3, s.getBacklink());
            ps.setString(4, s.getNote());
            ps.setString(5, s.getStatus());
            ps.setInt(6, s.getSliderID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public int getTotalSlider() {
        String sql = "select count(*) from Slider";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Slider> pagingSlider(int index) {
        List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider\n"
                + "  order by sliderID\n"
                + "  offset ? rows fetch next 4 rows only";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 4);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setSliderID(rs.getInt("sliderID"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setNote(rs.getString("note"));
                s.setStatus(rs.getString("status"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Slider> getSliderByPage(List<Slider> list, int start, int end) {
        List<Slider> t = new ArrayList<>(); 
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }
    
    public void addSlider(Slider s) {
        String query = "insert into Slider(title,image,backlink,note,status) values(?,?,?,?,?)";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, s.getTitle());
            ps.setString(2, s.getImage());
            ps.setString(3, s.getBacklink());
            ps.setString(4, s.getNote());     
            ps.setString(5, s.getStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
    }

    public List<Slider> getSliders(String search,String status ) {
        List<Slider> list = new ArrayList<>();
        try {
            int count = 1;
            conn = DBConnection.open();
            String sql = "SELECT * FROM swp391_quizpractice.slider\n"
                    + "  where 1=1 ";
            if(status.length() > 0){
                sql += "and status = ? ";
            } 
            if(search.length() > 0){
                sql += "and title like ? or backlink like ? ";
            }
            ps = conn.prepareStatement(sql);
            if(status.length() > 0){
                ps.setString(count++, status);
            } 
            if(search.length() > 0){
                ps.setString(count++, "%" + search +"%");
                ps.setString(count++, "%" + search +"%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setSliderID(rs.getInt("sliderID"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setNote(rs.getString("note"));
                s.setStatus(rs.getString("status"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    

}

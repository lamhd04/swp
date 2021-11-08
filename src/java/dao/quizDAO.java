/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Nhat Anh PC
 */
import dbconnection.DBConnection;
import entity.QuizList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat Anh PC
 */
public class quizDAO {

    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement ps;

    /*select * from (select QuizList.quizId,QuizList.name,Subject.title,QuizList.category,QuizList.level,QuizList.type,QuizList.quesNum,QuizList.passRate,Account.fullname, 
  ROW_NUMBER() over (order by quizId ) as STT from ((QuizList  join Account on QuizList.expert=Account.userId)join Subject on QuizList.subject=Subject.id)
  where Subject.title like '%%' and QuizList.category like '%%' and QuizList.[type] like '%%' and QuizList.name like '%%') 
                       as a where STT between (1-1)*1+1 and 1*2*/
    public List<QuizList> paging(String col, int pageIndex, int pageSize, String order, String subject, String category, String type, String name) {
        List<QuizList> list = new ArrayList<QuizList>();
        try {
            String query = "  select * from (select QuizList.quizId,QuizList.name,Subject.title,QuizList.category,QuizList.level,QuizList.type,QuizList.quesNum,QuizList.passRate,Account.fullname, \n"
                    + "  ROW_NUMBER() over (order by " + col + " " + order + ") as STT from((QuizList  join Account on QuizList.expert=Account.userId)join Subject on QuizList.subject=Subject.subID)\n"
                    + "  where Subject.title like ? and QuizList.category like ? and QuizList.[type] like ? and QuizList.name like ?) \n"
                    + "  as a where STT between (?-1)*?+1 and ?*?";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + subject + "%");
            ps.setString(2, "%" + category + "%");
            ps.setString(3, "%" + type + "%");
            ps.setString(4, "%" + name + "%");
            ps.setInt(5, pageIndex);
            ps.setInt(6, pageSize);
            ps.setInt(7, pageIndex);
            ps.setInt(8, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new QuizList(rs.getInt("quizId"),
                        rs.getString("name"),
                        rs.getString("title"),
                        rs.getString("category"),
                        rs.getString("level"),
                        rs.getString("type"),
                        rs.getString("quesNum"),
                        rs.getString("passRate"),
                        rs.getString("fullname")));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public List<QuizList> getAll(int sub) {
        List<QuizList> list = new ArrayList<QuizList>();
        try {
            String query = "select QuizList.quizId,QuizList.name,Subject.title,Subject.category,QuizList.level,QuizList.type,QuizList.quesNum,QuizList.passRate,Account.fullname\n"
                    + " from ((QuizList  join Account on QuizList.expert=Account.userId )join Subject on QuizList.subject=Subject.subID) where QuizList.subject=? ";
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, sub);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizList quiz = new QuizList();
                quiz.setQuizId(rs.getInt("quizId"));
                quiz.setName(rs.getString("name"));
                quiz.setSubject(rs.getString("title"));
                quiz.setCategory(rs.getString("category"));
                quiz.setLevel(rs.getString("level"));
                quiz.setType(rs.getString("type"));
                quiz.setQuesNum(rs.getString("quesNum"));
                quiz.setPassRate(rs.getString("passRate"));
                quiz.setExpert(rs.getString("fullname"));
                list.add(quiz);
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
        return list;
    }

    public int quizCount() {
        int count = 0;
        try {
            String query = "select count(*) from QuizList";
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

    public void addQuiz(String title, String subject,
            String category, String level, String type, int quesNum, String passRate, int expert) {
        String sql = "insert into QuizList values (?,?,?,?,?,?,?,?)";
        try {
            conn = DBConnection.open();

            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, subject);
            ps.setString(3, category);
            ps.setString(4, level);
            ps.setString(5, type);
            ps.setInt(6, quesNum);
            ps.setString(7, passRate);
            ps.setInt(8, expert);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

    }

    public QuizList getQuizDetail(String quizId) {
        QuizList quiz = new QuizList();
        try {
            conn = DBConnection.open();
            String sql = "select QuizList.quizId,QuizList.name,Subject.title,Subject.category,QuizList.level,QuizList.type,QuizList.quesNum,QuizList.passRate,Account.fullname\n"
                    + " from ((QuizList  join Account on QuizList.expert=Account.userId )join Subject on QuizList.subject=Subject.subID) where QuizList.quizId=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                quiz.setQuizId(rs.getInt("quizId"));
                quiz.setName(rs.getString("name"));
                quiz.setSubject(rs.getString("title"));
                quiz.setCategory(rs.getString("category"));
                quiz.setLevel(rs.getString("level"));
                quiz.setType(rs.getString("type"));
                quiz.setQuesNum(rs.getString("quesNum"));
                quiz.setPassRate(rs.getString("passRate"));
                quiz.setExpert(rs.getString("fullname"));
            }
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }
        return quiz;
    }

    public void editQuiz(String title, String subject,
            String category, String level, String type, String quesNum, String passRate, String qid) {
        String query = "update QuizList set title=?,[subject]=?,category=?,[level]=?,[type]=?,quesNum=?,passRate =? where quizId=?";
        try {
            conn = DBConnection.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, subject);
            ps.setString(3, category);
            ps.setString(4, level);
            ps.setString(5, type);
            ps.setString(6, quesNum);
            ps.setString(7, passRate);
            ps.setString(8, qid);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            DBConnection.close(conn, stmt);
        }

    }

    public static void main(String[] args) {
        quizDAO qd = new quizDAO();
        List<QuizList> list = qd.paging("quizid", 1, 6, "", "", "", "", "");
        for (QuizList quizList : list) {
            System.out.println(quizList);
        }
    }
}

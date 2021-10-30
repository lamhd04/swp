/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.QuestionDAO;
import dao.SubjectDAO;
import dao.TestDAO;
import entity.Test;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuestionSearch;

/**
 *
 * @author User
 */
public class PracticeDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //int testId=Integer.parseInt(request.getParameter("testId"));
        int testId = 1;
        TestDAO dao = new TestDAO();
        Test t = dao.getTest(testId);
        if (!"add".equals(request.getParameter("op"))) {
            request.setAttribute("test", t);
        }
        request.getRequestDispatcher("PracticeDetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int check = 0;
        DateTimeFormatter formatter = DateTimeFormatter.BASIC_ISO_DATE;
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd k:m");
        String type = request.getParameter("type");
        String subject = request.getParameter("subject");
        LocalDateTime starttime = null;
        String get = request.getParameter("starttime");
        get=get.replaceAll("T", " ");
        starttime = LocalDateTime.parse(get, formatter);
        if (starttime.isBefore(java.time.LocalDateTime.now())) {
            check = 1;
            get="";
            request.setAttribute("errorstarttime", "Start time must be after current time");
        }
        int duration = Integer.parseInt(request.getParameter("duration"));
        if (duration / 60 > 12) {
            duration=0;
            check = 1;
            request.setAttribute("errorduration", "exam cannot be that long");
        }
        String ques_cate = request.getParameter("ques_cate");
        String ques_subcate = request.getParameter("ques_subcate");
        int ques_numb = Integer.parseInt(request.getParameter("ques_numb"));
        QuestionSearch qs = new QuestionSearch();
        SubjectDAO d = new SubjectDAO();
        qs.setSubject(subject);
        qs.setCategory("cat"+ques_cate);
        qs.setSubcategory("subcat"+ques_subcate);
        QuestionDAO qd = new QuestionDAO();
        int q=qd.questionCount(qs);
        if(q<ques_numb){
            check=1;
            ques_numb=0;
            request.setAttribute("errorques_numb", "question number cannot be more than "+q);
        }         
        Test t = new Test();
        t.setDuration(duration);
        t.setQues_cate(ques_cate);
        t.setQues_numb(ques_numb);
        t.setQues_subcate(ques_subcate);
        t.setStarttime(get);
        t.setType(type);
        t.setSubject(subject);
        TestDAO dao = new TestDAO();
        if (check == 0) {
            dao.addTest(t);
        }
        request.setAttribute("testadd", t);
        request.getRequestDispatcher("PracticeDetail.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

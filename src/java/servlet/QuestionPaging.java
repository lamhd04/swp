/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dao.QuestionDAO;
import dao.SettingDAO;
import dao.SubjectDAO;
import entity.Account;
import entity.Question;
import entity.Setting;
import entity.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuestionSearch;
import model.SubjectSearch;

/**
 *
 * @author User
 */
public class QuestionPaging extends HttpServlet {

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
        doPost(request, response);

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
        doPost(request, response);
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
        SettingDAO s = new SettingDAO();

        String username = request.getParameter("search");
        if (username == null) {
            username = "";
        }
        request.setAttribute("search", username);
        SubjectDAO sbd = new SubjectDAO();
//        SubjectSearch sbs = new SubjectSearch();
//        List<Subject> lsb=sbd.getAll();
//        request.setAttribute("lsb", lsb);
        String pageind = request.getParameter("pageindex");
        if (pageind == null) {
            pageind = "1";
        }
        String condition = request.getParameter("condition");
        if (condition == null) {
            condition = "";
        }
        request.setAttribute("condition", condition);
        String condition2 = request.getParameter("condition2");
        if (condition2 == null) {
            condition2 = "";
        }
        request.setAttribute("condition2", condition2);
        QuestionSearch qs = new QuestionSearch();
        qs.setContent(username);
        String temp ="";
        if (condition.contains("level")) {
            temp = condition.substring(5);
            qs.setLevel(temp);
            request.setAttribute("temp", temp);
        }
        if (condition.contains("status")) {
            temp = condition.substring(6);
            qs.setStatus(temp);
            request.setAttribute("temp", temp);
        }
        if (condition.contains("cat")) {
            temp = condition.substring(3);
            qs.setCategory(condition);
            request.setAttribute("temp", temp);
        }
        if (condition2 != null && condition2.contains("subject")) {
            String temp2 = condition2.substring(8);
            qs.setSubject(temp);
            request.setAttribute("temp2", temp2);
        }
        if (condition2 != null && condition2.contains("subcat")) {
            String temp2 = condition2.substring(6);
            qs.setSubcategory(condition2);
            request.setAttribute("temp2", temp2);
            
        }

        int pageindex = Integer.parseInt(pageind);
        QuestionDAO skindao = new QuestionDAO();
        int pagenum = skindao.questionCount(qs);
        int pagesize = 12;
        int endpage = pagenum / pagesize;
        if (pagenum % pagesize != 0) {
            endpage++;
        }
        List<Setting> subcat = s.getSettingByType(temp);
        request.setAttribute("subcat", subcat);
        List<Question> list = skindao.search(pageindex, pagesize, qs);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("list", list);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("end", endpage);
        request.setAttribute("url", "QuestionPaging?pageindex=");
        int x = 0;
        int y = 0;
        if (pageindex < 3 && endpage > 4) {
            x = 1;
            y = 5;
        } else if (endpage < 5) {
            x = 1;
            y = endpage;
        } else if (pageindex > endpage - 3) {
            x = endpage - 4;
            y = endpage;
        } else {
            x = pageindex - 2;
            y = pageindex + 2;
        }

        request.setAttribute("finish", y);
        request.setAttribute("start", x);
        request.getRequestDispatcher("QuestionList.jsp").forward(request, response);
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

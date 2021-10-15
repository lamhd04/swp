/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dao.QuestionDAO;
import dao.SettingDAO;
import entity.Account;
import entity.Question;
import entity.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        response.setContentType("text/html;charset=UTF-8");
        SettingDAO s = new SettingDAO();
        String type = request.getParameter("type");
        if (type == null) {
            type = "qId";
        }
        String username = request.getParameter("search");
        if (username == null) {
            username = "";
        }
        request.setAttribute("search", username);
        String pageind = request.getParameter("pageindex");
        if (pageind == null) {
            pageind = "1";
        }
        String condition = request.getParameter("condition");
        String temp1 = "";
        if (condition != "" && condition != null) {
            temp1 = "and category='" + condition + "'";
        }
        request.setAttribute("condition", condition);
        String condition2 = request.getParameter("condition2");
        String temp2 = "";
        if (condition2 != "" && condition2 != null) {
            temp2 = "and subcategory='" + condition2 + "'";
        }
        request.setAttribute("condition2", condition2);
        int pageindex = Integer.parseInt(pageind);
        QuestionDAO skindao = new QuestionDAO();
        int pagenum = skindao.questionCount(username, temp1, temp2);
        int pagesize = 12;
        int endpage = pagenum / pagesize;
        if (pagenum % pagesize != 0) {
            endpage++;
        }
        List<Setting> subcat = s.getSettingByType(condition);
        request.setAttribute("subcat", subcat);
        List<Question> list = skindao.search(type, username, pageindex, pagesize, "asc", temp1, temp2);
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
        request.setAttribute("y", y);
        request.setAttribute("x", x);
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

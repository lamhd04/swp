/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dao.SettingDAO;
import entity.Account;
import entity.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class UserPaging extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if("Admin".equals(acc.getPermission())){
        String type = request.getParameter("type");
        if (type == null) {
            type = "userId";
        }
        request.setAttribute("type", type);
        String username = request.getParameter("fullname");
        if (username == null) {
            username = "";
        }
        request.setAttribute("fullname", username);
        String pageind = request.getParameter("pageindex");
                if (pageind == null) {
            pageind = "1";
        }
        String order = request.getParameter("order");
        if (order == null) {
            order = "";
        }
        request.setAttribute("order", order);
        String condition = request.getParameter("condition");
        if (condition == null) {
            condition = "";
        }
        request.setAttribute("condition", condition);
        int pageindex = Integer.parseInt(pageind);
        AccountDAO skindao = new AccountDAO();
        int pagenum = skindao.accountCount(username, condition);
        int pagesize = 12;
        int endpage = pagenum / pagesize;
        if (pagenum % pagesize != 0) {
            endpage++;
        }


        List<Account> list = skindao.search(type,username, pageindex, pagesize, order, condition);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("list", list);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("end", endpage);
        request.setAttribute("url", "UserPaging?pageindex=");
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
        request.getRequestDispatcher("ShowAccount.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

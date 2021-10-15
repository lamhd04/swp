/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class AdminControl extends HttpServlet {

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
        String op = request.getParameter("op");
        AccountDAO acd = new AccountDAO();
        try {
            if ("Admin".equals(acc.getPermission())) {
                switch (op) {
                    case "userlist":
                        response.sendRedirect("UserPaging");
                        break;
                    case "deactivate":
                        acc = acd.getAccount(Integer.parseInt(request.getParameter("userId")));
                        acc.setStatus("inactive");
                        acd.editAccount(acc);
                        response.sendRedirect("UserPaging");
                        break;
                    case "view":
                        int userId = Integer.parseInt(request.getParameter("userId"));
                        request.getRequestDispatcher("UserDetail?userId=" + userId).forward(request, response);
                        break;
                    case "settinglist":
                        response.sendRedirect("SettingServlet");
                        break;
                    case "activate":
                        acc = acd.getAccount(Integer.parseInt(request.getParameter("userId")));
                        acc.setStatus("active");
                        acd.editAccount(acc);
                        response.sendRedirect("UserPaging");
                        break;
                }
            }
        } catch (Exception e) {
            response.sendRedirect("Home.jsp");
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

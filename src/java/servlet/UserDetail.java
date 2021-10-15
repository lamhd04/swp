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
public class UserDetail extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc != null) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            AccountDAO dao = new AccountDAO();
            acc = dao.getAccount(userId);
            request.setAttribute("acc", acc);
            request.setAttribute("role", dao.getSetting(acc.getPermission()));
            SettingDAO dao1 = new SettingDAO();
            List<Setting> list1 = dao1.getSettingByType("user_role");
            request.setAttribute("list1", list1);
            request.getRequestDispatcher("Profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("Home.jsp");
        }
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
        HttpSession session = request.getSession();
        AccountDAO acd = new AccountDAO();
        Account acc = new Account();
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String name = request.getParameter("fullname");
        final String phoneNumberPattern = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        int check = 0;
        if (!phone.matches(phoneNumberPattern)) {
            request.setAttribute("Errorphone", "Wrong phone number");
            check = 1;
        }
        if (address.length() > 150) {
            request.setAttribute("Erroraddress", "Address is too long");
            check = 1;
        }
        if (name.length() > 50) {
            request.setAttribute("Errorname", "Full name is too long");
            check = 1;
        }
        if (check == 0) {
            acc.setUserId(Integer.parseInt(request.getParameter("userId")));
            acc.setFullname(name);
            acc.setUserTitle(request.getParameter("userTitle"));
            acc.setPhone(phone);
            acc.setAddress(address);
            acc.setPermission(request.getParameter("permission"));
            acd.editAccount(acc);
        } else {
            request.getRequestDispatcher("Profile.jsp").forward(request, response);
        }
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

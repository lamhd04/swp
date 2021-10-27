/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
public class SettingServlet extends HttpServlet {

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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        SettingDAO sd = new SettingDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if ("Admin".equals(acc.getPermission())) {
            String index = request.getParameter("index");
            if (index == null) {
                index = "1";
            }
            String order = request.getParameter("order");
            if (order == null) {
                order = "";
            }
            request.setAttribute("order", order);
            String condition = request.getParameter("condition");
            if (condition == null) {
                condition = "settingId";
            }
            request.setAttribute("condition", condition);
            int pageIndex = Integer.parseInt(index);
            int pageNumber = sd.settingCount();
            int pageSize = 6;
            int endPage = pageNumber / pageSize;
            if (pageNumber % pageSize != 0) {
                endPage++;
            }
            List<Setting> settingList = sd.paging(condition, pageIndex, pageSize, order);
            request.setAttribute("index", pageIndex);
            request.setAttribute("pagesize", pageSize);
            request.setAttribute("sList", settingList);
            request.setAttribute("endPage", endPage);
            int x = 0;
            int y = 0;
            if (pageIndex < 3 && endPage > 4) {
                x = 1;
                y = 5;
            } else if (endPage < 5) {
                x = 1;
                y = endPage;
            } else if (pageIndex > endPage - 3) {
                x = endPage - 4;
                y = endPage;
            } else {
                x = pageIndex - 2;
                y = pageIndex + 2;
            }
            request.setAttribute("y", y);
            request.setAttribute("x", x);
            request.getRequestDispatcher("settingList.jsp").forward(request, response);
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

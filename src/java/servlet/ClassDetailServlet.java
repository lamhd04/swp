/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClassDao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.RequestHelper;

/**
 *
 * @author admin
 */
public class ClassDetailServlet extends HttpServlet {

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
        Integer id = RequestHelper.paramToIntegerValue(request, "id");
        if (id == null) {
            response.sendRedirect("../");
            return;
        }
        ClassDao classDao = new ClassDao();
        List<Account> teachers = classDao.getAllTeacher();
        request.setAttribute("teachers", teachers);
        request.setAttribute("data", classDao.getById(id));
        teachers.forEach(x -> System.out.println(x.getUserId()));
        request.getRequestDispatcher("../ClassDetail.jsp").forward(request, response);
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
        Map<String, String[]> param = request.getParameterMap();
        for (String x : param.keySet()) {
            System.out.println(x + " = " + param.get(x)[0]);
        }
        int id = Integer.parseInt(request.getParameter("id"));
        String className = request.getParameter("className");
        int owner = Integer.parseInt(request.getParameter("owner"));
        String status = request.getParameter("status");
        ClassDao classDao = new ClassDao();
        classDao.update(className, owner, status, id);
        List<Account> teachers = classDao.getAllTeacher();
        request.setAttribute("teachers", teachers);
        request.setAttribute("data", classDao.getById(id));
        System.out.println(classDao.getById(id).getOwnerId());
        teachers.forEach(x -> System.out.println(x.getUserId()));
        request.setAttribute("msg", "success");
        request.getRequestDispatcher("../ClassDetail.jsp").forward(request, response);
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

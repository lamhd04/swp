/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dao.ClassDao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class AddClassServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddClassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddClassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ClassDao classDao = new ClassDao();
        List<Account> teachers = classDao.getAllTeacher();
        request.setAttribute("ownerList", teachers);
        request.getRequestDispatcher("../AddClass.jsp").forward(request, response);
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
        try {
            String clasName = request.getParameter("className");
            String status = request.getParameter("status");
            String owner = request.getParameter("owner");
            RequestHelper.displayParam(request);
            ClassDao classDao = new ClassDao();
            entity.Class data = new entity.Class();
            data.setClassName(clasName);
            data.setStatus(status);
            data.setOwnerId(Integer.parseInt(owner));
            data.setCreatedDate(new Date(System.currentTimeMillis()).toString());
            data.setId(classDao.countClass() + 1);
            boolean existClassName = classDao.checkExistClassName(clasName);
            List<Account> teachers = classDao.getAllTeacher();
            request.setAttribute("ownerList", teachers);
            if (existClassName) {
                request.setAttribute("message", "exist");
            } else {
                classDao.insertClass(data);
                request.setAttribute("message", "success");
            }
        } catch (Exception e) {
            request.setAttribute("message", "fail");
        }
        request.getRequestDispatcher("../AddClass.jsp").forward(request, response);
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

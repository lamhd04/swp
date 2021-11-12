/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.EmailController;
import dao.AccountDAO;
import dao.ClassDao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.RequestHelper;

/**
 *
 * @author admin
 */
public class EditClassUserServlet extends HttpServlet {

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
            out.println("<title>Servlet EditClassUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditClassUserServlet at " + request.getContextPath() + "</h1>");
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
        Integer classId = RequestHelper.paramToIntegerValue(request, "classId");
        if (classId == null) {
            response.sendRedirect("../class");
            return;
        }
        ClassDao classDao = new ClassDao();
        AccountDAO accountDao = new AccountDAO();

        entity.Class classData = classDao.getById(classId);
        if (classData == null) {
            response.sendRedirect("../class");
            return;
        }
        request.setAttribute("classId", classId);
        List<entity.Account> accountList = accountDao.getStudentByClassId(classId);
        request.setAttribute("data", accountList);
        request.getRequestDispatcher("/EditClassUser.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        int classId = RequestHelper.paramToIntegerValue(request, "classId");
        Account a = new AccountDAO().getAccount(email);
        if (a == null) {
            request.setAttribute("message", "User with email " + email + " does not exist !");
            request.setAttribute("keyword", email);
        } else {
            ClassDao classDao = new ClassDao();
            if (classDao.checkExist(a.getUserId(), classId)) {
                request.setAttribute("message", "User with email " + email + " existed in class !");
                request.setAttribute("keyword", email);
            } else {
                classDao.insertStudent(a.getUserId(), classId);
                EmailController emaiController = new EmailController();
                String content = "You recently added into class: " +classDao.getById(classId).getClassName() +".";
                emaiController.sendClassAction(a, content);
                request.setAttribute("message", "Add success");
            }
        }
        AccountDAO accountDao = new AccountDAO();
        List<entity.Account> accountList = accountDao.getStudentByClassId(classId);
        request.setAttribute("data", accountList);
        request.setAttribute("classId", classId);
        request.getRequestDispatcher("/EditClassUser.jsp").forward(request, response);
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

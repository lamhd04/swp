/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.EmailController;
import dao.AccountDAO;
import dao.ClassDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class ClassRemoveUserController extends HttpServlet {

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
            out.println("<title>Servlet ClassRemoveUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassRemoveUserController at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        email = email == null ? "" : email;
        int classId = 0;
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
        } catch (Exception e) {
            response.sendRedirect("../class");
            return;
        }
        AccountDAO accDao = new AccountDAO();
        entity.Account acc = accDao.getAccount(email);
        if (acc == null) {
            response.sendRedirect("../class");
            return;
        }
        request.setAttribute("classId", classId);
        request.setAttribute("user", acc);
        request.getRequestDispatcher("../RemoveClassUser.jsp").forward(request, response);
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
        String reason = request.getParameter("reason");
        EmailController emailController = new EmailController();
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int classId = Integer.parseInt(request.getParameter("classId"));
            request.setAttribute("classId", classId);
            ClassDao classDao = new ClassDao();
            if (classDao.removeStudent(userId, classId) == 1) {
                String content = "You recently removed from class: <span>" + classDao.getById(classId).getClassName() + ", please contact to teacher for more information <br>Reason: " + reason;
                request.setAttribute("message", "success");
                emailController.sendClassAction(new AccountDAO().getAccount(userId), content);
            } else {
                request.setAttribute("message", "fail");
            }

        } catch (Exception e) {
            response.sendRedirect("../class");
            return;
        }
        request.getRequestDispatcher("../RemoveClassUser.jsp").forward(request, response);
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

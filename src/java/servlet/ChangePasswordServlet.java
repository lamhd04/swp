/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
 * @author HaGau
 */
public class ChangePasswordServlet extends HttpServlet {

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
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        String newpassword = (String) request.getParameter("newpassword");
        String repassword = (String) request.getParameter("repassword");
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAccount(email);
        if (a == null) {

            request.setAttribute("msg", "This email was not registered!");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else {
            if (newpassword.equals(repassword)) {
                a.setPassword(newpassword);
                dao.editAccount(a);
                session.setAttribute("acc", a);
            } else if (!a.getPassword().equals(password)) {
                request.setAttribute("msg", "Wrong password");
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Re-password does not match the new password!");
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            }
        }
//        if (password.equals(session.getAttribute("acc.pass"))) {
//            if (newpassword.equals(repassword)) {
//                dao.updatePass(newpassword, email);               
//                session.setAttribute("acc", dao.getAccount(email, newpassword));
//            } else {
//                request.setAttribute("message", "Re-password does not match the new password!");
//                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("msg", "Wrong password!");
//            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
//        }

        response.sendRedirect(  "Home.jsp");
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

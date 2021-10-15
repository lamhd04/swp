/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import controller.EmailController;
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
 * @author ADMIN
 */
public class SignupServlet extends HttpServlet {

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
      
            /* TODO output your page here. You may use following sample code. */
            Account acc = (Account) request.getAttribute("acc");
            AccountDAO s = new AccountDAO();
            if("notverify".equals(request.getAttribute("check"))){
            EmailController send = new EmailController();
            send.Send(acc);
            request.setAttribute("msg", "Check Your Mail!!");
            request.getRequestDispatcher("notification.jsp").forward(request, response);
            }else
                doPost(request,response);
        }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc = (Account) request.getAttribute("acc");
        AccountDAO s = new AccountDAO();
        acc.setUserId(s.getMaxId()+ 1);
        s.addAcc(acc);
        int u = acc.getUserId();
        
        response.sendRedirect("Login.jsp");

    }

}
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
import java.util.ArrayList;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.EmailController;

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        check(request, response);

    }

    private void check(HttpServletRequest request, HttpServletResponse response) {
        try {
            int check = 0;
            String fname = request.getParameter("name");
            String gender = request.getParameter("sex");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String mobile = request.getParameter("phone");
            String add = request.getParameter("add");
            AccountDAO a = new AccountDAO();
            Vector<String> paramExcept = new Vector<>();
            // a.getAccount(email);

            String re_pass = request.getParameter("repassword");
            final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                    + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
            //không map với pattern
            if (!email.matches(EMAIL_PATTERN)) {
                request.setAttribute("Erroremail", "Wrong syntax");
                check = 1;
                paramExcept.add("email");
            }
            //email đã tồn tại trong database
            if (a.getAccount(email) != null) {
                request.setAttribute("Erroremail", "Email has already existed");
                check = 1;
                paramExcept.add("email");
            }
            //password ko match
            if (!pass.equals(re_pass)) {
                request.setAttribute("Errorpassword", "Password didn't match repassword");
                check = 1;
                paramExcept.add("password");
            }
            final String phoneNumberPattern = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
            //phone number sai
            if (!mobile.matches(phoneNumberPattern)) {
                request.setAttribute("Errorphone", "Wrong phone number");
                check = 1;
                paramExcept.add("phone");
            }
            final String PASS_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
            //password ko map với pattern
            if (!pass.matches(PASS_PATTERN)) {
                request.setAttribute("Errorpassword", "At least 8 characters "
                        + "A number must be included  "
                        + "A lowercase alphabet and an uppercase alphabet must be included"
                        + "A special character must be included"
                        + "No space or tab");
                check = 1;
            }
            //có lỗi validate
            if (check == 1) {
                addParamExceptToRequest(request, paramExcept);
                request.getRequestDispatcher("Signup.jsp").forward(request, response);
                return;
            }
            Account acc = new Account(new AccountDAO().getMaxId() + 1, fname, gender, email, pass, mobile, add, "User", "inactive");
            EmailController emailController = new EmailController();
            AccountDAO accountDao = new AccountDAO();
            //thêm vào database
            accountDao.addAcc(acc);

            //gửi mail để verify account
            int isSuccess = emailController.sendVerifyAccount(acc);
            request.setAttribute("acc", acc);
            response.sendRedirect("RegistSuccessPage.jsp");
        } catch (Exception e) {
        }
    }

    private void addParamExceptToRequest(HttpServletRequest request, Vector<String> paramExcept) {
        Map<String, String[]> params = request.getParameterMap();
        params.keySet().stream().filter((key) -> (!paramExcept.contains(key))).forEachOrdered((key) -> {
            request.setAttribute(key, params.get(key)[0]);
        });
    }
}

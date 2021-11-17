/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.QuestionDAO;
import dao.ResultDAO;
import entity.Account;
import entity.Answer;
import entity.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nhat Anh PC
 */
public class QuizHandle extends HttpServlet {

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
//        processRequest(request, response);
        QuestionDAO qd = new QuestionDAO();
        HttpSession session = request.getSession();
        int testId=Integer.parseInt(request.getParameter("testId"));
        List<Question> quesList = qd.Test(testId);
        request.setAttribute("quesList", quesList);
        request.getRequestDispatcher("DoTest.jsp").forward(request, response);
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
//        processRequest(request, response);
        QuestionDAO qd = new QuestionDAO();
        ResultDAO rd=new ResultDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int uid = acc.getUserId();
        String questionId[] = request.getParameterValues("quesId");
        int correct = 0;
        int wrong = 0;
        int unans = 0;
        int rId=rd.ResultId()+1;
        for (String question : questionId) {
            
            String a = request.getParameter("x_" + question);
            String s= qd.findCorrectAns(question);
            if (s.equals(a)) {
                correct++;
            }
            if (!s.equals(a)) {
                wrong++;
            }
            if(a==null){
                unans++;
            }
            rd.insertResult(rId, uid, question, a, s);//rId = select cai cuoi cung
        }
        double score=((double)correct/(correct+wrong))*10;
        request.setAttribute("score", score);
        request.setAttribute("correct", correct);
        request.setAttribute("wrong", wrong);
        request.setAttribute("unans", unans);

        request.getRequestDispatcher("QuizResult.jsp").forward(request, response);
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

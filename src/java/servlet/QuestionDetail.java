/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.QuestionDAO;
import dao.SettingDAO;
import entity.Answer;
import entity.Question;
import entity.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class QuestionDetail extends HttpServlet {

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
        doPost(request, response);
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
        //int qId = Integer.parseInt(request.getParameter("qId"));
        int qId=1;
        QuestionDAO dao = new QuestionDAO();
        SettingDAO s = new SettingDAO();
        Question q = dao.getQuestion(qId);
        int i = 0;
        if ("delete".equals(request.getParameter("op"))) {
            String answer = request.getParameter("content");
            dao.deleteAnAnswer(answer, qId);
        }
        if ("addanswer".equals(request.getParameter("op"))) {
            i = Integer.parseInt(request.getParameter("i"));
            i++;
            request.setAttribute("i", i);
        } else if ("removeanswer".equals(request.getParameter("op"))) {
            i = Integer.parseInt(request.getParameter("i"));
            i--;
            request.setAttribute("i", i);

        } else {
            request.setAttribute("i", 0);
        }
        request.setAttribute("question", q);
        request.setAttribute("list", q.getList());
        request.setAttribute("condition", q.getCategory());
        List<Setting> subcat = s.getSettingByType(q.getCategory());
        request.setAttribute("subcat", subcat);
        request.setAttribute("condition2", q.getSubcategory());
        request.setAttribute("currentlevel", q.getLevel());
        request.setAttribute("currentstatus", q.getStatus());
        request.getRequestDispatcher("QuestionDetail.jsp").forward(request, response);
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
//        int qId = Integer.parseInt(request.getParameter("qId"));
        int qId = 1;
        QuestionDAO dao = new QuestionDAO();
        Question q = dao.getQuestion(qId);
        SettingDAO s = new SettingDAO();
        int i=Integer.parseInt(request.getParameter("i"));
        String condition = request.getParameter("condition");
        request.setAttribute("condition", condition);
        List<Setting> subcat = s.getSettingByType(condition);
        request.setAttribute("subcat", subcat);
        String condition2 = request.getParameter("condition2");
        request.setAttribute("question", q);
        request.setAttribute("list", q.getList());
        updateQuestion(request, response, i + q.getList().size());
        request.getRequestDispatcher("QuestionDetail.jsp").forward(request, response);

    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response, int size) throws ServletException, IOException {
        //int qId = Integer.parseInt(request.getParameter("qId"));
        QuestionDAO dao = new QuestionDAO();
        Question q = dao.getQuestion(1);
        String subject = request.getParameter("subject");
        String category = request.getParameter("condition");
        String subcategory = request.getParameter("condition2");
        String level = request.getParameter("level");
        String status = request.getParameter("status");
        String quiz = request.getParameter("quiz");
        String content = request.getParameter("content");
        String media="";
        if(request.getParameter("media")!=null)
        media = new String(request.getParameter("media").getBytes("iso-8859-1"), "utf-8");
        String explanation = request.getParameter("explanation");
        int check = 0;
        String[] a = request.getParameterValues("answer");
        String[] k = request.getParameterValues("key");
        ArrayList<Answer> list = new ArrayList<Answer>();
        for (int i = 0; i < size; i++) {
            if (a[i].length() > 100) {
                check = 1;
            }
            list.add(new Answer(q.getqId(), a[i], Integer.parseInt(k[i])));
        }
        if (content == null || content.length() > 200) {
            check = 1;
            request.setAttribute("errorcontent", "Question content must be under 200 character/n"
                    + "Questio content cannot be empty!");
        }
        if (media.length() > 1000) {
            check = 1;
            request.setAttribute("errormedia", "media code is too long!");
        }
        if (explanation.length() > 100) {
            check = 1;
            request.setAttribute("errorexplanation", "Explanation is too long!");
        }
        if (!media.startsWith("<iframe")&&!media.equals("")) {
            media = "<img src=\"" + media + "\" alt=\"\" class=\"img-fluid\">";
        }
        if (check == 0) {
            q.setCategory(category);
            q.setContent(content);
            q.setExplanation(explanation);
            q.setLevel(level);
            q.setMedia(media);
            q.setQuiz(quiz);
            q.setStatus(status);
            q.setSubcategory(subcategory);
            q.setSubject(subject);
            q.setList(list);
            dao.editQuestion(q);
        }
        doGet(request, response);
        request.getRequestDispatcher("QuestionDetail.jsp").forward(request, response);
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

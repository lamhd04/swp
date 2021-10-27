/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.QuestionDAO;
import dao.SettingDAO;
import dao.SubjectDAO;
import dao.quizDAO;
import entity.Account;
import entity.Answer;
import entity.Question;
import entity.QuizList;
import entity.Setting;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
public class UploadFileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc != null) {
            QuestionImport(request, response);
        }
    }

    private void QuestionImport(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException, ServletException {
        Part file = request.getPart("file");
        String quizId = request.getParameter("quizId");
        quizDAO qd = new quizDAO();
        QuizList qz = qd.getQuizDetail(quizId);
        SubjectDAO sd = new SubjectDAO();
        String subcategory = request.getParameter("condition2");
        InputStreamReader inputStreamReader = new InputStreamReader(file.getInputStream());
        BufferedReader reader = new BufferedReader(inputStreamReader);
        QuestionDAO dao = new QuestionDAO();
        try {
            String line = reader.readLine();
            while (line != null && !line.equals("")) {
                Question q = new Question();
                String[] words = line.split("[|]");
                q.setContent(words[0]);
                q.setLevel(qz.getLevel());
                q.setQuiz(quizId);
                q.setExplanation(words[1]);
                q.setMedia(words[2]);
                q.setqId(dao.getMaxId() + 1);
                q.setCategory(qz.getCategory());
                q.setSubcategory(subcategory);
                q.setSubject(sd.getByTitle(qz.getSubject()).getId() + "");
                q.setStatus("Unpublished");
                line = reader.readLine();
                ArrayList<Answer> list = new ArrayList<Answer>();
                while (!line.equals("end")) {
                    int key = 0;
                    if (line.contains("(key)"));
                    key = 1;
                    list.add(new Answer(q.getqId(), line, key));
                    line = reader.readLine();
                }
                q.setList(list);
                dao.addQuestion(q);
                line = reader.readLine();
            }
        } catch (IOException ex) {

        } finally {
            try {
                reader.close();
                // file.close();
            } catch (IOException ex) {
            }
            response.sendRedirect("QuizListServlet");
        }
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

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
            QuestionImport(request, response);
    }

    private void QuestionImport(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException, ServletException {
        Part file = request.getPart("file");
        String quizId = request.getParameter("quiz");
        quizDAO qd = new quizDAO();
        QuizList qz = qd.getQuizDetail(quizId);
        String subject = request.getParameter("subject");
        String category = request.getParameter("ques_cate");
        String subcategory = request.getParameter("ques_subcate");
        InputStreamReader inputStreamReader = new InputStreamReader(file.getInputStream());
        BufferedReader reader = new BufferedReader(inputStreamReader);
        QuestionDAO dao = new QuestionDAO();
        int check=0;
        int rowcount=0;
        List<Integer> errorline= new ArrayList<Integer>();
        try {
            String line = reader.readLine();
            rowcount++;
            while (line != null && !line.equals("")) {
                Question q = new Question();
                String[] words = line.split("[|]");
                q.setContent(words[0]);
                q.setLevel(qz.getLevel());
                q.setQuiz(quizId);
                if(words[1].length()>1000){
                    check=1;
                    request.setAttribute("errorexplanation","explanation must be under 1000 characters");
                    errorline.add(rowcount);
                    request.setAttribute("errorline", errorline);
                }
                q.setExplanation(words[1]);
                q.setMedia(words[2]);
                q.setqId(dao.getMaxId() + 1);
                q.setCategory(category);
                q.setSubcategory(subcategory);
                q.setSubject(subject);
                q.setStatus("Unpublished");
                line = reader.readLine();
                rowcount++;
                ArrayList<Answer> list = new ArrayList<Answer>();
                while (!line.equals("end")) {
                    int key = 0;
                    if (line.contains("(key)"))
                    key = 1;
                    list.add(new Answer(q.getqId(), line.substring(0, line.length()-5), key));
                    line = reader.readLine();
                    rowcount++;
                }
                q.setList(list);
                if(check==0)
                dao.addQuestion(q);
                line = reader.readLine();
                rowcount++;
            }
        } catch (IOException ex) {

        } finally {
            try {
                reader.close();
                // file.close();
            } catch (IOException ex) {
            }
            request.getRequestDispatcher("QuestionList.jsp").forward(request, response);
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

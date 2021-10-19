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
        SettingDAO s = new SettingDAO();
        String condition = request.getParameter("condition");
        request.setAttribute("condition", condition);
        List<Setting> subcat = s.getSettingByType(condition);
        request.setAttribute("subcat", subcat);
        String condition2 = request.getParameter("condition2");
        if (condition2 != null && !"".equals(condition2)) {
            QuestionImport(request, response);
        }
        request.getRequestDispatcher("questionimport.jsp").forward(request, response);
    }

    private void QuestionImport(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException, ServletException {
        Part file = request.getPart("file");
        String category = request.getParameter("condition");
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
                q.setLevel(words[1]);
                q.setQuiz("quiz");
                q.setExplanation(words[2]);
                q.setMedia(words[3]);
                q.setqId(dao.getMaxId() + 1);
                q.setCategory(category);
                q.setSubcategory(subcategory);
                q.setSubject("SWP391");
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
                break;
            }
        } catch (IOException ex) {

        } finally {
            try {
                reader.close();
                // file.close();
            } catch (IOException ex) {
            }
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

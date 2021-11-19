/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CategoryDao;
import dao.DocumentDAO;
import dao.ExamDAO;
import dao.PostDAO;
import entity.Category;
import entity.Document;
import entity.Exam;
import entity.Post;
import entity.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Constant;

/**
 *
 * @author admin
 */
public class HomeServlet extends HttpServlet {

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
        PostDAO dao = new PostDAO();
        //top 3 hot post (by rating)
        List<Post> post = dao.getTop3HotPost();
        request.setAttribute("post", post);

        //top 5 lastest post
        List<Post> topLastestPost = dao.getRecentPost();
        request.setAttribute("lastestPost", topLastestPost);
        //top 3 lastest exam
        ExamDAO exDao = new ExamDAO();
        List<Exam> exam = exDao.getTop3Exam();
        request.setAttribute("exam", exam);
        List<Setting> examCate = exDao.getExamCategories();
        request.setAttribute("exCate", examCate);
        System.out.println(exam.get(0).getTitle());
        List<Document> document = new DocumentDAO().getTopDocument().subList(0, 3);
        request.setAttribute("document", document);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.LessonDAO;
import dao.SubjectDAO;
import entity.Account;
import entity.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LessonDetail extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String id = request.getParameter("qId");
        int testId = 0;
        if (id != null) {
            testId = Integer.parseInt(id);
            LessonDAO dao = new LessonDAO();
            Lesson t = dao.getLesson(testId);
            request.setAttribute("lesson", t);
        } else {
            Lesson t = new Lesson();
            t.setLessonId(0);
            request.setAttribute("lesson", t);
        }
        //int testId = 1;
        if ("Expert".equals(acc.getPermission())) {
            request.getRequestDispatcher("LessonDetail.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("LessonCustomer.jsp").forward(request, response);
        }

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
        int check = 0;
        String id = request.getParameter("lessonId");
        String sub = request.getParameter("subject");
        String title = request.getParameter("title");
        String status = request.getParameter("status");
        String brief = request.getParameter("brief");
        String content = request.getParameter("content");
        if (title.length() > 100) {
            check = 1;
            request.setAttribute("errortitle", "title must be under 100 characters");
        }
        if (brief.length() > 100) {
            check = 1;
            request.setAttribute("errorbrief", "brief must be under 100 characters");
        }
        if ("".equals(content)) {
            check = 1;
            request.setAttribute("errorcontent", "content cannot be empty");
        }
        SubjectDAO dao1 = new SubjectDAO();
        Lesson l = new Lesson();
        l.setBrief(brief);
        l.setContent(content);
        l.setStatus(status);
        l.setSubject(sub);
        l.setTitle(title);
        if (check == 0) {
            LessonDAO dao = new LessonDAO();
            if ("0".equals(id)) {
                dao.addLesson(l);
                l.setSubject(dao1.getById(Integer.parseInt(sub)).getTitle());
                request.setAttribute("alert", "Success");
                request.getRequestDispatcher("LessonDetail.jsp").forward(request, response);
            } else {
                l.setLessonId(Integer.parseInt(id));
                dao.updateLesson(l);
                l.setSubject(dao1.getById(Integer.parseInt(sub)).getTitle());
                request.setAttribute("lesson", l);
            }
        } else {
            request.setAttribute("lesson", l);
        }
        request.getRequestDispatcher("LessonDetail.jsp").forward(request, response);
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

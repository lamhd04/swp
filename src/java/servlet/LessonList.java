/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LessonSearch;
import dao.LessonDAO;
import dao.QuestionDAO;
import entity.Lesson;
import entity.Question;
import java.util.List;

/**
 *
 * @author User
 */
public class LessonList extends HttpServlet {

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
        doPost(request, response);
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
        String search = request.getParameter("search");
        request.setAttribute("search", search);
        LessonSearch ls = new LessonSearch();
        ls.setSearchcontent(search);
        String subject = request.getParameter("subject");
        request.setAttribute("subject", subject);
        int sub = 0;
        if (subject != null) {
            sub = Integer.parseInt(subject);
        }
        ls.setSubject(sub);
        String status = request.getParameter("status");
        request.setAttribute("status", status);
        ls.setStatus(status);
        String pageind = request.getParameter("pageindex");
        if (pageind == null) {
            pageind = "1";
        }
        LessonDAO ld = new LessonDAO();
        int pageindex = Integer.parseInt(pageind);
        int pagenum = ld.lessonCount(ls);
        int pagesize = 12;
        int endpage = pagenum / pagesize;
        if (pagenum % pagesize != 0) {
            endpage++;
        }
        List<Lesson> list = ld.search(pageindex, pagesize, ls);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("list", list);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("end", endpage);
        request.setAttribute("url", "LessonList?pageindex=");
        int x = 0;
        int y = 0;
        if (pageindex < 3 && endpage > 4) {
            x = 1;
            y = 5;
        } else if (endpage < 5) {
            x = 1;
            y = endpage;
        } else if (pageindex > endpage - 3) {
            x = endpage - 4;
            y = endpage;
        } else {
            x = pageindex - 2;
            y = pageindex + 2;
        }

        request.setAttribute("finish", y);
        request.setAttribute("start", x);
        request.getRequestDispatcher("LessonList.jsp").forward(request, response);
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

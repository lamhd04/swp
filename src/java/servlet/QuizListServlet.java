/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.quizDAO;
import entity.QuizList;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nhat Anh PC
 */
public class QuizListServlet extends HttpServlet {

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
        quizDAO qd = new quizDAO();
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        String order = request.getParameter("order");
        if (order == null) {
            order = "";
        }
        request.setAttribute("order", order);
        String col = request.getParameter("col");
        if (col == null) {
            col = "quizId";
        }
        request.setAttribute("col", col);
        String condition = request.getParameter("condition");
        if (condition == null) {
            condition = "";
        }
        request.setAttribute("condition", condition);
        String subject = request.getParameter("subject");
        if (subject == null) {
            subject = "";
        }
        request.setAttribute("subject", subject);
        String category = request.getParameter("category");
        if (category == null) {
            category = "";
        }
        request.setAttribute("category", category);
        String type = request.getParameter("type");
        if (type == null) {
            type = "";
        }
        request.setAttribute("type", type);
        int pageIndex = Integer.parseInt(index);
        int pageNumber = qd.quizCount();
        int pageSize = 6;
        int endPage = pageNumber / pageSize;
        if (pageNumber % pageSize != 0) {
            endPage++;
        }
        String title = request.getParameter("title");
        if (title == null) {
            title = "";
        }
        request.setAttribute("title", title);
        List<QuizList> qList = qd.paging(col, pageIndex, pageSize, order,subject, category, type,title);
        request.setAttribute("index", pageIndex);
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("qList", qList);
        request.setAttribute("endPage", endPage);
        int x = 0;
        int y = 0;
        if (pageIndex < 3 && endPage > 4) {
            x = 1;
            y = 5;
        } else if (endPage < 5) {
            x = 1;
            y = endPage;
        } else if (pageIndex > endPage - 3) {
            x = endPage - 4;
            y = endPage;
        } else {
            x = pageIndex - 2;
            y = pageIndex + 2;
        }
        request.setAttribute("y", y);
        request.setAttribute("x", x);
        request.getRequestDispatcher("quizList.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.SubjectDAO;
import entity.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SubjectSearch;
import utils.UrlHelper;

/**
 *
 * @author lhquan1
 */
public class SubjectServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            final int PAGE_SIZE = 2;
            SubjectSearch param = new SubjectSearch();

            Integer pageIndex = 1;
            if (request.getParameter("pageIndex") != null) {
                pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
            }
            param.setPageIndex(pageIndex);
            param.setPageSize(PAGE_SIZE);
            param.setTitle(request.getParameter("title"));
            param.setAuthor(request.getParameter("author"));
            param.setStatus(request.getParameter("status"));
            SubjectDAO subjectDAO = new SubjectDAO();
            int totalSubjects = subjectDAO.totalSubjects(param);
            int totalPage = totalSubjects / param.getPageSize();
            if (totalSubjects % param.getPageSize() != 0) {
                totalPage++;
            }
            List<Subject> listSubjects = new SubjectDAO().search(param);

            HashMap<String, String> params = new HashMap<>();
            if (param.getTitle() != null) {
                params.put("title", param.getTitle());

            }
            if (param.getAuthor() != null) {
                params.put("author", param.getAuthor());
            }
            if (param.getStatus() != null) {
                params.put("status", param.getStatus());
            }
            request.setAttribute("paran", param);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("url", "subjects" + UrlHelper.getQueryParam(params));
            request.setAttribute("listSubjects", listSubjects);
            request.getRequestDispatcher("subject.jsp").forward(request, response);
        }
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
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));

        Subject oldSubject = new SubjectDAO().getById(subjectId);
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        oldSubject.setName(name);
        oldSubject.setCategory(category);
        oldSubject.setDescription(description);
        boolean check = new SubjectDAO().update(oldSubject);
        response.sendRedirect("subjects");
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

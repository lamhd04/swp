/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClassDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Class;
import java.util.HashMap;
import java.util.Map;
import utils.PagingHelper;
import utils.RequestHelper;

/**
 *
 * @author admin
 */
public class CLassListServlet extends HttpServlet {

    private static final int PAGE_SIZE = 5;

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
        String className = request.getParameter("keyword");
        int pageIndex = 1;
        String indexParam = request.getParameter("index");
        try {
            pageIndex = Integer.parseInt(indexParam);
        } catch (NumberFormatException e) {

        }
        //attribute list
        Map<String, Object> attributes = new HashMap<>();
        //neu className bang null thi gan className = "" (empty)
        className = (className == null) ? "" : className;
        ClassDao classDao = new ClassDao();
        List<Class> classes = classDao.getByClassName(pageIndex, PAGE_SIZE, className);
        int totalData = classDao.countByClassName(className);
        int totalPage = PagingHelper.calculateTotalPage(totalData, PAGE_SIZE);
        attributes.put("data", classes);
        attributes.put("keyword", className);
        attributes.put("totalPage", totalPage);

        //add attributes to request
        RequestHelper.setAttributes(attributes, request);
        request.getRequestDispatcher("ClassList.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.TestDAO;
import entity.TestDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class PracticeListServlet extends HttpServlet {
 private static final int PAGE_SIZE = 7;
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
        int index = 1;

        String indexParam = request.getParameter("index");
        try {
            index = Integer.parseInt(indexParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        TestDAO testDao = new TestDAO();
        List<TestDTO> data = testDao.getTest(index, PAGE_SIZE, 1);
        int countData = testDao.count();
        int totalPage = calculateTotalPage(countData);
        System.out.println(totalPage);
        request.setAttribute("index", index);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("data", data);
        request.getRequestDispatcher("PracticeList.jsp").forward(request, response);
    }
    private int calculateTotalPage(int total) {
        int totalPage = 0;
        if (total == 0) {
            return 0;
        }
        totalPage = total / PAGE_SIZE;

        if (totalPage * PAGE_SIZE != total) {
            totalPage += 1;
        }
        return totalPage;
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
      String keyword = request.getParameter("keyword");
        TestDAO testDao = new TestDAO();
        //List<TestDTO> data = testDao.getTest(index, PAGE_SIZE, 1);
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

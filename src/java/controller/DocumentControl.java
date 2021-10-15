/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DocumentDAO;
import entity.Document;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hungl
 */
public class DocumentControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        String pageind = request.getParameter("pageindex");
        String docSearch = request.getParameter("docsearch");
        String condition = request.getParameter("condition");
        DocumentDAO ddao = new DocumentDAO();
        
        
        if(condition == null){
            condition ="";
        } else {
            condition = "and doccategory = '" + condition +"'";
        }
        
        if(docSearch == null){
            docSearch ="";
        }
        request.setAttribute("docsearch", docSearch);
        if (pageind == null) {
            pageind = "1";
        }
        int pageindex = Integer.parseInt(pageind);
        
        
        int pagenum = ddao.getDocuments(docSearch).size();
        int pagesize = 4;
        int endpage = pagenum / pagesize;
        if (pagenum % pagesize != 0) {
            endpage++;
        }
        List<Document> list = ddao.searchDocument("update_date", docSearch, pageindex, pagesize, "desc",condition);
        
        session.setAttribute("top5", ddao.getTopDocument());
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("list", list);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("end", endpage);
        request.setAttribute("url", "Documentpaging?pageindex=");
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
        request.setAttribute("y", y);
        request.setAttribute("x", x);
        request.getRequestDispatcher("Document.jsp").forward(request, response);
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

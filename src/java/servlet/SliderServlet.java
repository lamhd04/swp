/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.SliderDAO;
import entity.Slider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author hungl
 */
public class SliderServlet extends HttpServlet {

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
        processRequest(request, response);
        SliderDAO sdao = new SliderDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String op = request.getParameter("op");
        Slider slider = sdao.getSliderById(id);
        switch (op) {
            case "edit":
                request.setAttribute("sdetail", slider);
                request.getRequestDispatcher("SliderDetails.jsp").forward(request, response);
                break;
            case "deactivate":
                slider.setStatus("inactive");
                sdao.editSlider(slider);
                response.sendRedirect("SliderListServlet");
                break;
            case "activate":
                slider.setStatus("active");
                sdao.editSlider(slider);
                response.sendRedirect("SliderListServlet");
                break;
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
        processRequest(request, response);
        String action = request.getParameter("action");
        SliderDAO sdao = new SliderDAO();
        switch (action) {
            case "edit":
                String title = request.getParameter("title");
                String backlink = request.getParameter("backlink");
                String note = request.getParameter("note");
                String s = request.getParameter("sliderId");
                int sid = Integer.parseInt(s);
                boolean check = true;
                if (title.length() > 70) {
                    request.setAttribute("titleError", "Title must be less than 70 characters");
                    check = false;
                }
                if (backlink.length() > 1000) {
                    request.setAttribute("backlinkError", "Backlink must be less than 1000 characters");
                    check = false;
                }

                if (check == true) {
                    Slider newSlider = new Slider();
                    newSlider.setSliderID(sid);
                    newSlider.setTitle(title);
                    newSlider.setBacklink(backlink);
                    newSlider.setNote(note);
                    newSlider.setStatus(sdao.getSliderById(sid).getStatus());
                    newSlider.setImage(sdao.getSliderById(sid).getImage());
                    sdao.editSlider(newSlider);
                    response.sendRedirect("SliderListServlet");
                }
                break;
            case "add":
                String titleA = request.getParameter("titleA");
                String backlinkA = request.getParameter("backlinkA");
                String noteA = request.getParameter("noteA");
                String imageA = request.getParameter("fn");
                String statusA = request.getParameter("statusA");
                Slider newSlider = new Slider();
                newSlider.setTitle(titleA);
                newSlider.setImage(imageA);
                newSlider.setBacklink(backlinkA);
                newSlider.setNote(noteA);
                newSlider.setStatus(statusA);
                sdao.addSlider(newSlider);
                response.sendRedirect("SliderListServlet");
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

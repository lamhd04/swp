/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.SliderDAO;
import entity.Slider;
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
public class SliderListServlet extends HttpServlet {

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
        String search = request.getParameter("search");
        String status = request.getParameter("status");
        if(search == null){
            search = "";
        }
        if(status == null){
            status="";
        }
        SliderDAO sdao = new SliderDAO();
        //String indexPage = request.getParameter("index");
        List<Slider> listS = sdao.getSliders(search, status);
        int size = listS.size();
        int numperPage = 4;
        int numPage = size / numperPage + (size % numperPage == 0 ? 0 : 1);
        String indexPage = request.getParameter("index");
        int page;
        if (indexPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(indexPage);
        }

        int start, end;
        start = (page - 1) * numperPage;
        end = Math.min(size, page * numperPage);
        List<Slider> arr = sdao.getSliderByPage(listS, start, end);
//        if(indexPage == null){
//            indexPage = "1";
//        }
//        int index = Integer.parseInt(indexPage);
        
//        int count = sdao.getTotalSlider();
//        int endPage = count/4;
//        if(count % 4 != 0){
//            endPage++;
//        }
//        List<Slider> list = sdao.pagingSlider(index);
        //request.setAttribute("end", endPage);
        //request.setAttribute("list_sliders", list);
        request.setAttribute("list_sliders", arr);
        request.setAttribute("num", numPage);
        request.setAttribute("index", page);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        
        session.setAttribute("SliderHome1", sdao.getSliderById(1));
        session.setAttribute("SliderHome2", sdao.getSliderById(2));
        session.setAttribute("SliderHome3", sdao.getSliderById(3));
        session.setAttribute("SliderHome4", sdao.getSliderById(4));
        session.setAttribute("SliderHome5", sdao.getSliderById(5));
        request.getRequestDispatcher("Slider.jsp").forward(request, response);

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

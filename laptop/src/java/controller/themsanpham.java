/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entty.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class themsanpham extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        ProductDao productDao = new ProductDao();
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String mota = request.getParameter("mota");
        int soluong =Integer.parseInt(request.getParameter("soluong")) ;
        HttpSession session = request.getSession();
        Account acc = (Account)session.getAttribute("acc");
        String cn = request.getParameter("cn");
        if(cn==null) {
            cn = acc.getCn();
        }
        Part part =  request.getPart("photo");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if(!Files.exists(Paths.get(realPath))){
            Files.createDirectories(Paths.get(realPath));
        }
        part.write(realPath+"/"+filename);
        String anh = "images/"+filename;
        request.setAttribute("filename", anh);
        int cid =Integer.parseInt(request.getParameter("category"));
        String title="";
        int kind = 2;
        if(cid<5){
            title="laptop";
            kind=1;
        }
        else if(cid == 5)
            title="chuột";
        else if(cid == 6)
            title ="Bàn phím";
        else
            title = "tai nghe";
        System.out.println("ok");
        System.out.println(cn);
        productDao.insert(ten, anh,gia, title, mota, soluong, cid, cn);
        
        request.getRequestDispatcher("quanlysanpham").forward(request, response);
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

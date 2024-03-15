/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entty.Laptop_Details;
import entty.Product;
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
public class edit extends HttpServlet {

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
        request.getRequestDispatcher("edit.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        ProductDao productDao = new ProductDao();
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String gia = request.getParameter("gia");
        String mota = request.getParameter("mota");
        
        Part part =  request.getPart("photo");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        
        if(!Files.exists(Paths.get(realPath))){
            Files.createDirectories(Paths.get(realPath));
        }
        part.write(realPath+"/"+filename);
        String anh = "images/"+filename;
        request.setAttribute("filename", anh);
        productDao.UpdateProduct(id, ten,anh, Integer.parseInt(gia), mota);
        
        String manhinh=request.getParameter("manhinh");
        String cpu=request.getParameter("cpu");
        String ram=request.getParameter("ram");
        String ocung=request.getParameter("ocung");
        String dohoa=request.getParameter("dohoa");
        String trongluong=request.getParameter("trongluong");
        String kichthuoc=request.getParameter("kichthuoc");
        productDao.UpdateDetail(id, manhinh, cpu, ram, ocung, dohoa, trongluong, kichthuoc);
        
        
        Product p = productDao.getProductById(id);
        Laptop_Details detail = productDao.getDetailProductByPid(id);
        
        String thongbao = "Đã cập nhật!";
        request.setAttribute("thongbao", thongbao);
        request.setAttribute("detail", detail);
        request.setAttribute("p", p);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
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

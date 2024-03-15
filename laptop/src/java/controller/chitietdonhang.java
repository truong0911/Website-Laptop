/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.sanphamDao;
import entty.Account;
import entty.Order;
import entty.OrderDetail;
import entty.Product;
import entty.sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuong
 */
public class chitietdonhang extends HttpServlet {

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
        OrderDao orderDao = new OrderDao();
        LoginDao loginDao = new LoginDao();
        ProductDao productDao = new ProductDao();
        
        String oid = request.getParameter("id");
        Order o = orderDao.getOrderById(oid);
        Account a = loginDao.getAccountById(o.getCustomerId());
        
        int soluong=0;
        sanphamDao sDao = new sanphamDao();
        ArrayList<sanpham> list = sanphamDao.getAllSanpham(oid);
        for(sanpham s:list){
            soluong+=s.getSoluong();
        }
        request.setAttribute("sanpham", list);
        request.setAttribute("account", a);
        request.setAttribute("o", o);
        request.setAttribute("soluong", soluong);
        request.getRequestDispatcher("chitietdonhang.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entty.Cart;
import entty.Item;
import entty.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class process extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        
        if(o!=null){
            cart = (Cart)o;
        }
        else{
            cart=new Cart();
        }
        int num=Integer.parseInt(request.getParameter("num"));
        String tid=request.getParameter("id");
        String id=tid;
        
        if((num==-1)&& (cart.getQuantityById(id)<=1)){
            cart.removeItem(id);
        }else{
            ProductDao productDao =new ProductDao();
            Product p = productDao.getProductById(tid);
            Item item = new Item(p,num);
            cart.addItem(item,p.getSoluong());
        }
        ArrayList<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        
        if(o!=null){
            cart = (Cart)o;
        }
        else{
            cart=new Cart();
        }
        String id= request.getParameter("id");
        cart.removeItem(id);
        ArrayList<Item> list = cart.getItems();
//        int tongTien = 0;
//        for(Item i: list){
//            tongTien += i.getQuantity()*i.getProduct().getGia();
//        }
//        session.setAttribute("tongtien", tongTien);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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

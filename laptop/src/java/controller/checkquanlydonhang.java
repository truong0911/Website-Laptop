/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDao;
import entty.Account;
import entty.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuong
 */
public class checkquanlydonhang extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDao orderDao =new OrderDao();
        String id = request.getParameter("id");
        int check = Integer.parseInt(request.getParameter("check"));
        HttpSession session = request.getSession();
        Account acc = (Account)session.getAttribute("acc");
        System.out.println("ok" + acc.getId());
        if(check==0){
            orderDao.UpdateStatusOrder(id,acc.getId());
        }
        else{
            orderDao.delete(id);
        }
        
        ArrayList<Order> donchuaduyet =new ArrayList();
        for(Order o:orderDao.getAllOrder()){
            if(o.getStatus()==0)
                donchuaduyet.add(o);
        }
        
        request.setAttribute("donchuaduyet", donchuaduyet);
        request.getRequestDispatcher("quanlydonhang.jsp").forward(request, response);
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

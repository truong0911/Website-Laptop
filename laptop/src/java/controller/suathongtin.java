/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDao;
import entty.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class suathongtin extends HttpServlet {

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
        LoginDao loginDao=new LoginDao();
        HttpSession session =request.getSession();
        String id = request.getParameter("id");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("diachi");
        String ten = request.getParameter("ten");
        String use = request.getParameter("uid");
        String bt = request.getParameter("k");
        int k =-1;
        if(bt!=null){
            k = Integer.parseInt(bt);
        }
        if(k==1){
            Account a = new Account();
            a = loginDao.getAccountById(id);
            session.setAttribute("ac", a);
            request.getRequestDispatcher("suathongtin.jsp").forward(request, response);
        }
        System.out.println("123");
        System.out.println(id+ "/" + user + "/" +  pass);
        if(k==0){
            LoginDao.UpdateAcc(id, user, pass, sdt, diachi, ten);
            request.getRequestDispatcher("quanlytaikhoan").forward(request, response);
        }
        System.out.println(k);
//        if (use == null || use.equals("0")){
//            loginDao.delete(id,"Customer");
//        }
//        else {
//            loginDao.delete(id, "Employee");
//        }
            request.getRequestDispatcher("quanlytaikhoan").forward(request, response);
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

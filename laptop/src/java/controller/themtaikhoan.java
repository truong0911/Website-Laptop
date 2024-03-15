/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDao;
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

/**
 *
 * @author DELL
 */
@MultipartConfig
public class themtaikhoan extends HttpServlet {

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
        LoginDao loginDao = new LoginDao();
        String user = request.getParameter("username");
        String ten = request.getParameter("ten");
        String pass = request.getParameter("password");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("diachi");
        String repass= request.getParameter("repass");
        String cn = request.getParameter("cn");
        HttpSession session = request.getSession();
        Account acc = (Account)session.getAttribute("acc");
        int check = 1;
        if(cn==null){
            cn = acc.getCn();
            check = 0;
        }
        Account a= LoginDao.checkSignUp(user);
//        System.out.println(a.getUser() + "  " + a.getTen());
        if(user=="" |pass=="" | repass=="" | sdt=="" |diachi=="" | ten=="" | !pass.equals(repass)){
            request.setAttribute("mess", "Nhập thiếu thông tin!");
        }
        else if(a!=null){
            request.setAttribute("mess", "Tài khoản đã tồn tại!");
        }
        else{
            System.out.println(user + "/" + pass + "/"+cn);
            System.out.println("ok");
            LoginDao.insert(user, pass,sdt,diachi,ten,cn,check);
            request.setAttribute("mess", "Đăng ký thành công!");
        }
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

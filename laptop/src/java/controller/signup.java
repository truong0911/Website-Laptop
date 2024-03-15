/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDao;
import entty.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("taikhoan");
        String pass = request.getParameter("matkhau");
        String repass= request.getParameter("nlmatkhau");
        String sdt=  request.getParameter("sdt");
        String diachi =  request.getParameter("diachi");
        String ten=  request.getParameter("ten");
        
        Account a= LoginDao.checkSignUp(user);
        if(pass=="" | repass=="" | sdt=="" |diachi=="" | ten=="" | !pass.equals(repass)){
            request.setAttribute("mess", "Nhập thiếu thông tin!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else if(a!=null){
            request.setAttribute("mess", "Tài khoản đã tồn tại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else{
            LoginDao.insert(user, pass,sdt,diachi,ten,"CN1",0);//FIX
            request.setAttribute("mess", "Đăng ký thành công!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//       response.setContentType("text/html;charset=UTF-8");
//        String user = request.getParameter("taikhoan");
//        String pass = request.getParameter("matkhau");
//        String repass= request.getParameter("nlmatkhau");
//        String sdt=  request.getParameter("sdt");
//        String diachi =  request.getParameter("diachi");
//        Account a= LoginDao.checkSignUp(user);
//        if(user==null || pass==null || repass==null) {
//             HttpSession ses = request.getSession();
//            ses.setAttribute("regError", "*Không được để trống");
//            response.sendRedirect("login.jsp");
//        }
//        else  if(repass.compareTo(pass)!=0) {
//            HttpSession ses = request.getSession();
//            ses.setAttribute("regError", "*Nhập lại mật khẩu không trùng khớp!");
//            response.sendRedirect("login.jsp");
//        }
//        else if (a!=null) {
//            HttpSession ses = request.getSession();
//            ses.setAttribute("regError", "Tài khoản đã tồn tại!");
//            response.sendRedirect("login.jsp");
//        } else {
//            LoginDao.insert(user, pass,sdt,diachi);
//            HttpSession ses = request.getSession();
//            ses.setAttribute("regSuccess", "Đăng ký thành công!");
//            response.sendRedirect("login.jsp");
//        }
//
//    }

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

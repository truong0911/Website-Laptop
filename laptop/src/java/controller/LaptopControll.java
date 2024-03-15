/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import connect.connectDB;
import entty.Branch;
import entty.Product;
import entty.TypeOfPhuKien;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuong
 */
@WebServlet(name = "LaptopControll", urlPatterns = {"/laptop"})
public class LaptopControll extends HttpServlet {

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
        HttpSession session =request.getSession();
        DAO dao= new DAO();
        ArrayList<Branch> listCn = dao.getAllBranch();
        session.setAttribute("cn", listCn);
        System.out.println(listCn);
        String cn = request.getParameter("CN");
        session.setAttribute("cnht", cn);
        if(cn==null){
            cn = "";
        }
    // get data from dao
        
        // dsach sp
        ArrayList<Product> listLap = dao.getAllLaptop(cn);
        // set data to jsp
        session.setAttribute("listLap", listLap);
        
        //4 san pham moi nhat
        int length = listLap.size();
        ArrayList<Product> newLap = new ArrayList();
        for(int i=length-1;i>=length-4;i--){
            newLap.add(listLap.get(i));
        }
        session.setAttribute("newlaptop", newLap);
     
   
        ArrayList<TypeOfPhuKien> TypeOfLaptop=dao.getAllTypeLaptop();
        session.setAttribute("typeOfLaptop", TypeOfLaptop);
        
        request.getRequestDispatcher("laptop.jsp").forward(request, response);
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

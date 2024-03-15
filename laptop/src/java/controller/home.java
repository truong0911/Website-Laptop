/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDao;
import dao.DAO;
import dao.ProductDao;
import dao.TypeDao;
import entty.Branch;
import entty.Cart;
import entty.Category;
import entty.Item;
import entty.Laptop_Details;
import entty.Product;
import entty.TypeOfProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuong
 */
public class home extends HttpServlet {

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
        String cn = request.getParameter("CN");
        session.setAttribute("cnht", cn);
        if(cn==null){
            cn = "";
        }
//        Danh sách sản phẩm 
        ProductDao productDao=new ProductDao();
        ArrayList<Product> listProduct=productDao.getAllProduct(cn);
        ArrayList<Product> listPs = new ArrayList<>();
        
//      pagination 
        
        String xpage = request.getParameter("index");
        int page;
        if(xpage==null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        
        int start,end;
        int count  = listProduct.size();
        start = (page-1)*12;
        end = Math.min(page*12, count);
        int dem = 0;
        
        for(Product i : listProduct){
            if(dem>=start&&dem<end){
                listPs.add(i);
            }
            dem++;
        }
          
        int endPage = count/12;
        if(count%12!=0){
            endPage++;
        }
        request.setAttribute("endP", endPage);
        request.setAttribute("listProduct", listPs);
//        sản phẩm mới nhất
        int l=listProduct.size();
        ArrayList<Product> newProduct = new ArrayList();
        for(int i=l-1;i>=l-4;i--){
            newProduct.add(listProduct.get(i));
        }
        request.setAttribute("newProduct", newProduct);
////        Danh sach phu kien
//        ArrayList<Product> listPhukienProduct = productDao.getAllPhukien();
//        request.setAttribute("listPhukienProduct", listPhukienProduct);
//      Đẩy lại category lên trang home  

//category phu kien
        CategoryDao categoryDao=new CategoryDao();
        ArrayList<Category> category=categoryDao.getAllCategory();
        ArrayList<Category> catePhukien=new ArrayList();
        for(int i=4;i<=6;i++){
            catePhukien.add(category.get(i));
        }
            
        session.setAttribute("catePhukien", catePhukien);
        
        TypeDao typeDao=new TypeDao();
        ArrayList<TypeOfProduct> typeOfProduct=typeDao.getAllType();
        session.setAttribute("typeOfProduct", typeOfProduct);
        
        request.setAttribute("tagpage", page);
        request.setAttribute("tag", 0);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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

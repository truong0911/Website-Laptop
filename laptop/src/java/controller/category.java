/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.TypeDao;
import entty.Category;
import entty.Laptop_Details;
import entty.Product;
import entty.TypeOfProduct;
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
public class category extends HttpServlet {

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
        
        TypeDao typeDao=new TypeDao();
        ProductDao productDao=new ProductDao();
        ArrayList<TypeOfProduct> typeOfProduct=typeDao.getAllType();
        request.setAttribute("typeOfProduct", typeOfProduct);
//        lay san pham theo kind
        String kind=request.getParameter("kind");
        
        ArrayList<Product> listProduct = productDao.getProductByKind(kind);
        
//        san pham moi nhat
        ArrayList<Product> list=productDao.getAllProduct("");
       
        
        int l=list.size();
        ArrayList<Product> newProduct = new ArrayList();
        for(int i=l-1;i>=l-4;i--){
            newProduct.add(list.get(i));
        }
        request.setAttribute("newProduct", newProduct);
        
//        
//        CategoryDao categoryDao=new CategoryDao();
//        ArrayList<Category> category=categoryDao.getAllCategory();
//        ArrayList<Category> catePhukien=new ArrayList();
//        for(int i=4;i<=6;i++){
//            catePhukien.add(category.get(i));
//        }
//            
//        request.setAttribute("catePhukien", catePhukien);
        
////      Lấy tag để thêm class cho category- phân biệt category nào được chọn
        
        request.setAttribute("tag", kind);
        
//        phan trang
        ArrayList<Product> listPs = new ArrayList<>();    
        String xpage = request.getParameter("index");
        int page;
        if(xpage==null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        
        int start,end;
        int count  = listProduct.size();
        start = (page-1)*8;
        end = Math.min(page*8, count);
        int dem = 0;
        
        for(Product i : listProduct){
            if(dem>=start&&dem<end){
                listPs.add(i);
            }
            dem++;
        }
          
        int endPage = count/8;
        if(count%8!=0){
            endPage++;
        }
        request.setAttribute("tagpage", page);
        request.setAttribute("endP", endPage);
        request.setAttribute("listProduct", listPs);
//        
        
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

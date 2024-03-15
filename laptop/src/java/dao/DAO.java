/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import static connect.connectDB.getConnect;
import entty.Branch;
import entty.Product;
import entty.TypeOfPhuKien;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author tuong
 */
public class DAO {
    // lấy tất cả sản phẩm là phụ kiện
    public static ArrayList<Product> getAllPhuKien(String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product where cate_id>4";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(1, cn);
            }
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){
            
        }
        return list;
    }
    // loại phụ kiện chuột, bàn phím, tai nghe.
    public static ArrayList<TypeOfPhuKien> getAllType(){
        ArrayList<TypeOfPhuKien> list = new ArrayList();
//        String sql = "select * from kindOfPhuKien";
        String sql = "select * from Category where id > 4";
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                TypeOfPhuKien c=new TypeOfPhuKien(rs.getInt(1),rs.getString(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
    // lấy sản phẩm theo lại phân loại sản phẩm
    public static ArrayList<Product> getPhuKienByCateID(String cID, String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
                    "where cate_id=?";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(2, cn);
            }
            ps.setString(1, cID);
            System.out.println("fff");
            System.out.println(cID);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){   
        }
        return list;
    }
    // tìm phụ kiện theo tên 
    public static ArrayList<Product> searchPhuKienByName(String txtSearch, String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
                    "where [name] like ? and [cate_id] in ('5', '6', '7')";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(2, cn);
            }
            ps.setString(1,"%"+ txtSearch +"%");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){     
        }
        return list;
    }
    
    
    public static ArrayList<TypeOfPhuKien> getAllTypeLaptop(){
        ArrayList<TypeOfPhuKien> list = new ArrayList();
//        String sql = "select * from kindOfLaptop";
        String sql = "select * from Category where id <5";
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                TypeOfPhuKien c=new TypeOfPhuKien(rs.getInt(1),rs.getString(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
     
    public static ArrayList<Product> getAllLaptop(String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product where cate_id<5";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(1, cn);
            }
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){
            
        }
        
        
        return list;
    }
    
    
    public static ArrayList<Product> getLapByCateID(String cID, String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
                    "where cate_id=?";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(2, cn);
            }
            ps.setString(1, cID);
            System.out.println(cID);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){
            
        }

        return list;
    }
    
    public static ArrayList<Product> searchLapByName(String txtSearch, String cn){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
                    "where [name] like ? and [cate_id] in ('1', '2', '3','4')";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
        try{
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(2, cn);
            }
            ps.setString(1,"%"+ txtSearch +"%");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9));
        
                list.add(p);
            }
        }catch(Exception e){
            
        }
        
        
        return list;
    }
    
    public static ArrayList<Branch> getAllBranch(){
        ArrayList<Branch> list = new ArrayList();
        String sql = "select * from Branch";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Branch c=new Branch(rs.getString(1),rs.getString(3));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
//     public static void main(String[] args) {
//         ArrayList<TypeOfPhuKien> list = getAllType();
//        for(TypeOfPhuKien c:list){
//            System.out.println(c);
//        }
//    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Product> list = dao.getAllPhuKien();
//        for(Product o : list){
//            System.out.println(o);
//        }
//    }
}

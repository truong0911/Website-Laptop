/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static connect.connectDB.getConnect;
import entty.Laptop_Details;
import entty.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class ProductDao {
    public static ArrayList<Product> getAllProduct(String cn){
        ArrayList<Product> list=new ArrayList();
        String sql = "select * from Product";
        if(!cn.equals("")) {
            sql += " where CN_id = ?";
        }
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(1, cn);
            }
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Product p=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getString(9));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static ArrayList<Product> getProductByCid(String cid){
        ArrayList<Product> list=new ArrayList();
        String sql = "select * from Product where cate_id = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Product p=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getString(9));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static ArrayList<Product> getProductByKind(String kind){
        ArrayList<Product> list=new ArrayList();
        String sql  = "";
        if(kind.equals("1")){
            sql = "select * from Product where cate_id < 5";
        }
        else {
            sql = "select * from Product where cate_id > 4";
        }
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
//            ps.setString(1, kind);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Product p=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getString(9));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
   
    public static Laptop_Details getDetailProductByPid(String pid){
        String sql = "select * from Laptop_Details where pid = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Laptop_Details p=new Laptop_Details(rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static ArrayList<Product> getProductSearch(String search, String cn){
        ArrayList<Product> list=new ArrayList();
        String sql = "select * from Product where id in\n" +
"(select distinct id from Product where name like ? or [description] like ? or title like ?)";
        if(!cn.equals("")) {
            sql += " and CN_id = ?";
        }
         try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            if(!cn.equals("")) {
                ps.setString(4, cn);
            }
            ps.setString(1, "%"+search+"%");
            ps.setString(2,"%"+search+"%");
            ps.setString(3, "%"+search+"%");
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Product p=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getString(9));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    

    
    public static Product getProductById(String id){
        String sql = "select * from Product where id = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Product p=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8),rs.getString(9));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static int getTotalById(String cn, String table) {
        String sql = "SELECT top 1 id FROM "+ table+" WHERE id LIKE '"+cn+"%' order by id desc";
        try{
            Connection con=getConnect();
            Statement sttm=con.createStatement();
            ResultSet rs=sttm.executeQuery(sql);
            rs.next();
            int sl = Integer.parseInt(rs.getString(1).substring(4));
            return sl;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
    public static void insert(String ten,String anh, int gia, String title, String mota,int soluong,int cid, String cn){
        String query = "insert into [dbo].[Product] ([id], [name], [image], [price], [title], [description], [soluong], [cate_id], [CN_id]) values(?,?,?,?,?,?,?,?,?)";
        int temp = getTotalById(cn, "Product")+1;
        String slID = "0" + temp;
        if(temp>9){
            slID = "" + temp;
        }
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, cn + "P" +slID);
            ps.setString(2, ten);
            ps.setString(3, anh);
            ps.setInt(4, gia);
            ps.setString(5, title);
            ps.setString(6, mota);
            ps.setInt(7, soluong);
//            ps.setInt(7, 3);
            ps.setInt(8, cid);
            ps.setString(9, cn);
            ps.execute();
        }catch(Exception e){
            
        }
        String pid = getIdInsert("Product",cn);
        String slID2 = pid.substring(0, 3) + "LD" + pid.substring(4);
        
        String query2 = "insert into [dbo].[Laptop_Details] ([id], [pid], [manhinh], [cpu], [ram], [ocung], [dohoa], [khoiluong], [kichthuoc]) values(?,?,?,?,?,?,?,?,?)";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query2);
            ps.setString(1, slID2);
            ps.setString(2, pid);
            ps.setString(3, "");
            ps.setString(4, "");
            ps.setString(5, "");
            ps.setString(6, "");
            ps.setString(7, "");
            ps.setString(8, "");
            ps.setString(9, "");
            ps.execute();
        }catch(Exception e){
            System.out.println(e);
        }
        
    }
    
    public static String getIdInsert(String tb, String cn) {
        String query = "select * from Product WHERE CN_id = '"+cn+"' order by id desc";
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public static void UpdateProduct(String id,String ten,String anh,int gia,String mota){
        String query="Update Product set name=?,image=?,price=?,description=? where id='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, ten);
          
            ps.setString(2, anh);  
            ps.setInt(3, gia);
            ps.setString(4, mota);
            ps.executeUpdate();
        }catch(Exception e){
            
        }          
    }
    
    public static void UpdateDetail(String id,String manhinh,String cpu,String ram,String ocung,String dohoa, String khoiluong, String kichthuoc){
        String query="Update Laptop_Details set manhinh=?,cpu=?,ram=?,ocung=?, dohoa=?, khoiluong=? , kichthuoc=? where pid='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, manhinh);
            ps.setString(2, cpu);
            ps.setString(3, ram);
            ps.setString(4, ocung);
            ps.setString(5, dohoa);
            ps.setString(6, khoiluong);
            ps.setString(7, kichthuoc);
            ps.executeUpdate();
        }catch(Exception e){
            
        }          
    }
    
    public static void delete(String id){
        String sql="delete from Laptop_Details where pid='"+id+"'";
        String query="delete from Product where id='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement pstmt2=con.prepareStatement(sql);
            pstmt2.executeUpdate();
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.executeUpdate();
        }catch(Exception e){
            
        }
    }
    public static void main(String[] args) {
//        System.out.println(getProductById("1"));
//        ArrayList<Product> list=getProductSearch("giày");
//        for(Product p:list){
//            System.out.println(p);
//        }
//           Laptop_Details p=getProductByPid("1");
//           System.out.println(p);
//        ArrayList<Product> list = getProductByCid("1");
//        for(Laptop_Details p:list){
//            System.out.println(p);
//        }
//        ArrayList<LaptopProduct> list = getProductSearch(search);
//        for(Product p:list){
//            System.out.println(p);
//        }
//           ArrayList<Product> list = getAllProduct();
//           for ( Product p:list){
//               System.out.println(p);
//           }
        ArrayList<Product> list=getProductByKind("2");
        for(Product p:list){
            System.out.println(p);
        }
    }
}

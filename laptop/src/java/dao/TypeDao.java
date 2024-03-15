/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static connect.connectDB.getConnect;
import static dao.CategoryDao.getAllCategory;
import entty.Category;
import entty.TypeOfProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class TypeDao {
    public static ArrayList<TypeOfProduct> getAllType(){
        ArrayList<TypeOfProduct> list = new ArrayList();
        String sql = "select * from kindOfProduct";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                TypeOfProduct c=new TypeOfProduct(rs.getInt(1),rs.getString(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static void main(String[] args) {
         ArrayList<TypeOfProduct> list = getAllType();
        for(TypeOfProduct c:list){
            System.out.println(c);
        }
    }
}

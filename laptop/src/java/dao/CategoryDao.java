/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static connect.connectDB.getConnect;
import entty.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class CategoryDao {
    public static ArrayList<Category> getAllCategory(){
        ArrayList<Category> list = new ArrayList();
        String sql = "select * from Category";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Category c=new Category(rs.getInt(1),rs.getString(2));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        
        ArrayList<Category> list = getAllCategory();
        for(Category c:list){
            System.out.println(c);
        }
    }
}

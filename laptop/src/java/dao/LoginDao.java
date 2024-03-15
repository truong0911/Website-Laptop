/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static connect.connectDB.getConnect;
import entty.Account;
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
public class LoginDao {
   public static ArrayList<Account> getAllAccount(String table){
    ArrayList<Account> list=new ArrayList();
    String query="select * from " + table;
        try{
            Connection con=getConnect();
            Statement sttm=con.createStatement();
            ResultSet rs=sttm.executeQuery(query);
            String cn = "";
            while(rs.next()){
                if(table.equals("Employee")){
                cn = rs.getString(8);
            }
                Account a = new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),cn);
                list.add(a);
            }
        }catch(Exception e){
            
        }
        return list;
    }
    
    public static Account checkSignIn(String user, String pass) throws SQLException{
        String sql="select * from Customer where [user]=? and pass=?";
        String sql2="select * from Employee where [user]=? and pass=?";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),"");
            }
            PreparedStatement ps2=con.prepareStatement(sql2);
            ps2.setString(1, user);
            ps2.setString(2, pass);
            ResultSet rs2=ps2.executeQuery();
            // tên chi nhánh
            if(rs2.next() &&(rs2.getInt(4)== 2 || rs2.getString(8).equals("CN1"))){  //FIX
                return new Account(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getInt(4),rs2.getString(5),rs2.getString(6),rs2.getString(7),rs2.getString(8));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    public static Account checkSignUp(String user){
        String sql="select * from Customer where [user]=?";
        String sql2="select * from Employee where [user]=?";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),"");
            }
            PreparedStatement ps2=con.prepareStatement(sql2);
            ps2.setString(1, user);
            ResultSet rs2=ps2.executeQuery();
            if(rs2.next()){
                return new Account(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getInt(4),rs2.getString(5),rs2.getString(6),rs2.getString(7),rs2.getString(8));
            }
        }catch(Exception e){
            
        }
        return null;
    }
    
    public static void insert(String user, String pass, String sdt, String diachi, String ten, String cn, int check){
        String query = "insert into [dbo].[Customer] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten]) values(?,?,?,?,?,?,?)";
        String query2 = "insert into [dbo].[Employee] ([id], [user], [pass], [isAdmin], [sdt], [diachi], [ten], [CN_id]) values(?,?,?,?,?,?,?,?)";
        int temp = getLastIDByCN(cn,check)+1;
        String slID = "0" + temp;
        if(temp>9){
            slID = ""+temp;
        }
        try{
            Connection con=getConnect();
            String sql ="";
            if(check==0){
                sql = query;
            }
            else {
                sql = query2;
            }
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(2, user);
            ps.setString(3, pass);
            if(check!=0){
                ps.setInt(4,1);
                ps.setString(1, cn+"E"+slID);
            }
            else {
                ps.setString(1, cn+"C"+slID);
                ps.setInt(4, 0);
            }
            ps.setString(5, sdt);
            ps.setString(6, diachi);
            ps.setString(7,ten);
            if(check!=0){
                ps.setString(8,cn);
            }
            ps.execute();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public static int getLastIDByCN(String cn, int check) {
        String table = "Employee";
        if(check==0){
            table = "Customer";
        }
        String sql = "SELECT top 1 id FROM "+ table+" WHERE id LIKE '"+cn+"%' order by id desc";;
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
    public static void delete(String id, String table){
        System.out.println("1");
        if(table.equals("Customer")){
            OrderDao orderDao =new OrderDao();
            String sql="select * from Orders where [cid]=?";
            System.out.println("2");
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                orderDao.delete(rs.getString(1));
            }
        }catch(Exception e){
            
        }
        }
        System.out.println("3");
        String query="delete from "+table+" where id='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement pstmt=con.prepareStatement(query);
            System.out.println("4");
            pstmt.executeUpdate();
        }catch(Exception e){
            
        }
    }
    
    public static void UpdateAcc(String id,String user,String pass,String sdt,String diachi, String ten){
        String query="Update Customer set [user]=?,pass=?,sdt=?,diachi=?,ten=? where id='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);  
            ps.setString(3, sdt);
            ps.setString(4, diachi);
            ps.setString(5, ten);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }          
    }
    public Account getAccountById(String aid){
        String sql = "select * from Customer where id = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, aid);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),"");
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        ArrayList<Account> list= getAllAccount("Customer");
        for(Account a: list){
            System.out.println(a);
        }
//        Account a=checkSignUp("admin");
//        System.out.println(a);
//        System.out.println(getAccountById(5));
    }
}

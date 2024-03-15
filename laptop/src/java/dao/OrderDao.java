/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static connect.connectDB.getConnect;
import entty.Account;
import entty.Cart;
import entty.Item;
import entty.Order;
import entty.OrderDetail;
import entty.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class OrderDao {
    public static ArrayList<Order> getAllOrder(){
        ArrayList<Order> list=new ArrayList();
        String sql = "select * from Orders";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Order p=new Order(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void delete(String id){
        RecoveryQuantity(id);
        String sql="delete from Orders where id='"+id+"'";
        String sql2="delete from Order_Details where order_id='"+id+"'";
        try{
            Connection con=getConnect();
            PreparedStatement st2=con.prepareStatement(sql2);
            st2.executeUpdate();
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.executeUpdate();
                
            
        }catch(Exception e){
            
        }
    }
    
    public static void RecoveryQuantity(String id) {
        String sql = "select * from Order_Details where order_id='"+id+"'";
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            System.out.println(id);
            String sql3= "update Product set soluong = soluong + ? where id=?";
            PreparedStatement st2 = conn.prepareStatement(sql3);
            while(rs.next()){
                st2.setInt(1, rs.getInt(3));
                st2.setString(2, rs.getString(5));
                System.out.println(rs.getString(5));
                st2.executeUpdate();
            }
            
        } catch (Exception e) {
        }
    }
    
    public int getTotalById(String cn, String table) {
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
    
    public void addOrder(Account a, Cart cart, String eid){
        LocalDate date = java.time.LocalDate.now();
        String d = date.toString();
        String cn = eid.substring(0, 3);
        System.out.println(cn);
        int slID = getTotalById(cn, "Orders")+1;
        System.out.println("1");
        String temp = "0" + slID;
        if (slID>9){
            temp = "" + slID;
        }
        try {
            Connection con=getConnect();
            String sql = "insert into [dbo].[Orders] ([id], [date], [totalmoney], [status], [cid], [eid]) values(?,?,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, cn + "O"+temp);
            st.setString(2, d);
            st.setInt(3, cart.getToTalMoney());
            st.setInt(4, 0);
            st.setString(5, a.getId());
            st.setString(6, eid);
            st.executeUpdate();
            System.out.println("2");
            System.out.println(eid);
            String sql1="  select top 1 id from Orders where eid = '"+eid+"' order by id desc;";//FIX
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs=st1.executeQuery();
            System.out.println("ok");
            int index = 1;
            if(rs.next()){
                String oid = rs.getString(1);
                for(Item i: cart.getItems()){
                    String s = "0" + index;
                    if(index>9){
                        s = "" + index;
                    }
                    System.out.println(i.getProduct().getGia() + "/" +  i.getQuantity() + "/" + i.getProduct().getId() + "/" + oid);
                    String sql2="insert into [dbo].[Order_Details] ([id], [price], [quantity], [order_id], [product_id]) values (?,?,?,?,?)";
                    PreparedStatement st2=con.prepareStatement(sql2);
                    st2.setString(1, cn + "O"+temp+"OD" + s);
                    st2.setString(4, oid);
                    st2.setString(5, i.getProduct().getId());
                    st2.setInt(2,i.getProduct().getGia());
                    st2.setInt(3, i.getQuantity());
                    st2.executeUpdate();
                    index += 1;
                }
                System.out.println("3");
            }
            String sql3= "update Product set soluong = soluong - ? where id=?";
            PreparedStatement st2 = con.prepareStatement(sql3);
            for(Item item: cart.getItems()){
                st2.setInt(1, item.getQuantity());
                st2.setString(2, item.getProduct().getId());
                st2.executeUpdate();
            }
            System.out.println("4");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void UpdateStatusOrder(String id, String eid){
        String query="Update Orders set status=?, eid=? where id=?";
        try{
            Connection con=getConnect();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setString(2, eid);
            ps.setString(3, id);
            ps.executeUpdate();
        }catch(Exception e){
            
        }          
    }
    public static ArrayList<OrderDetail> getOrderDetailById(String id){
        ArrayList<OrderDetail> list=new ArrayList();
        String sql = "select * from Order_Details where order_id = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                OrderDetail o=new OrderDetail(rs.getString(4),rs.getString(5),rs.getInt(3),rs.getInt(2));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static Order getOrderById(String id){
        String sql = "select * from Orders where id = ?";
        
        try {
            Connection conn= getConnect();
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Order o=new Order(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6));
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
//        ArrayList<Order> list = getAllOrder();
//        for(Order o: list){
//            System.out.println(o);
//        }
//      
//        Order o = getOrderById(1);
//        System.out.println(getOrderById(1));
//        ArrayList<OrderDetail> list = getOrderDetailById(1);
//        for(OrderDetail d: list){
//            System.out.println(d);
//        }
    }
}

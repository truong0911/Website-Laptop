/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entty;

/**
 *
 * @author tuong
 */
public class OrderDetail {
    private int quantity,price;
    private String oid,pid;

    public OrderDetail() {
    }

    public OrderDetail(String oid, String pid, int quantity, int price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.price = price;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "oid=" + oid + ", pid=" + pid + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
}

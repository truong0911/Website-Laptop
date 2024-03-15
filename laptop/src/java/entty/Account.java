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
public class Account {
    private String user,pass, id;
    private int isAdmin;
    private String sdt,diachi,ten,cn;

    public Account() {
    }

    public Account(String id,String user, String pass,  int isAdmin, String sdt, String diachi, String ten, String cn) {
        this.user = user;
        this.pass = pass;
        this.id = id;
        this.isAdmin = isAdmin;
        this.sdt = sdt;
        this.diachi = diachi;
        this.ten = ten;
        this.cn = cn;
    }

    public String getUser() {
        return user;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @Override
    public String toString() {
        return "Account{" + "user=" + user + ", pass=" + pass + ", id=" + id + ", isAdmin=" + isAdmin + ", sdt=" + sdt + ", diachi=" + diachi + ", ten=" + ten + '}';
    }

    
}

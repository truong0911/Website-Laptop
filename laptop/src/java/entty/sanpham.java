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
public class sanpham {
    private String anh,ten;
    private int soluong,gia;

    public sanpham(String ten, String anh, int soluong, int gia) {
        this.anh = anh;
        this.ten = ten;
        this.soluong = soluong;
        this.gia = gia;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    @Override
    public String toString() {
        return "sanpham{" + "anh=" + anh + ", ten=" + ten + ", soluong=" + soluong + ", gia=" + gia + '}';
    }
    
    
}

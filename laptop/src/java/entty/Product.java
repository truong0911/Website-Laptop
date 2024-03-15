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
public class Product {
    private String ten,anh;
    private int gia;
    private String title,mota,branchId, id;
    private int soluong;
    private int cate_id;
    public Product(String id, String ten, String anh, int gia, String title, String mota,int soluong,int cate_id, String branchId) {
        this.id = id;
        this.ten = ten;
        this.anh=anh;
        this.gia = gia;
        this.title = title;
        this.mota = mota;
        this.soluong = soluong;
        this.cate_id=cate_id;
        this.branchId = branchId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getBranchId() {
        return branchId;
    }

    public void setBranchId(String branchId) {
        this.branchId = branchId;
    }
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", ten=" + ten + ", anh=" + anh + ", gia=" + gia + ", title=" + title + ", mota=" + mota + ", soluong=" + soluong + '}';
    }

    
    
}

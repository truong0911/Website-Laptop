/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entty;

/**
 *
 * @author tuong
 */
public class TypeOfPhuKien {
    private int id;
    private String name;
    
    public TypeOfPhuKien(){
        
    }
    public TypeOfPhuKien(int id, String name){
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String toString() {
        return "TypeOfPhuKien{" + "id=" + id + ", name=" + name + '}';
    }
    
}

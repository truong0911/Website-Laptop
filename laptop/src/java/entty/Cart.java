
package entty;

import java.util.ArrayList;

/**
 *
 * @author tuong
 */
public class Cart {
    private int id;
    private Account customer;
    private ArrayList<Item> items;

    public Cart() {
        items=new ArrayList<>();
    }

    public Cart(int id, Account customer, ArrayList<Item> items) {
        this.id = id;
        this.customer = customer;
        this.items = items;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getCustomer() {
        return customer;
    }

    public void setCustomer(Account customer) {
        this.customer = customer;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    public int getQuantityById(String id){
        return getItemById(id).getQuantity();
    }
    public Item getItemById(String id){
        for(Item i:items){
            if(i.getProduct().getId().equals(id)){
                return i;
            }
        }
        return null;
    }
    
    public void addItem(Item i, int sl){
        Item m=getItemById(i.getProduct().getId());
        if(m!=null){
            if(sl>m.getQuantity()&&i.getQuantity()==1){
                m.setQuantity(m.getQuantity()+i.getQuantity());
            }
            if(sl>=m.getQuantity()&&i.getQuantity()==-1){
                m.setQuantity(m.getQuantity()+i.getQuantity());
            }
        }
        else{
            items.add(i);
        }
    }
    
    public void removeItem(String id){
        Item m=getItemById(id);
        if(m!=null){
            items.remove(m);
        }
    }
    
    public int getToTalMoney(){
        int tong = 0;
        for(Item i:items){
            tong+=i.getProduct().getGia() * i.getQuantity();
        }
        return tong;
    }
    
    
}

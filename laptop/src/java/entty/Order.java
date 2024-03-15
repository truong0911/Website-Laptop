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
public class Order {
    private String date, id, customerId,employeeId;
    private int totalmoney;
    private int status;

    public Order() {
    }

    public Order(String id, String date, int totalmoney, int status, String customerId, String employeeId) {
        this.id = id;
        this.date = date;
        this.customerId = customerId;
        this.totalmoney = totalmoney;
        this.status = status;
        this.employeeId = employeeId;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", date=" + date + ", customerId=" + customerId + ", totalmoney=" + totalmoney + ", status=" + status + '}';
    }

    
}

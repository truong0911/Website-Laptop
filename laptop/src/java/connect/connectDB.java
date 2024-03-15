/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author tuong
 */
public class connectDB {
    public static Connection getConnect() throws SQLException {
        String url="jdbc:sqlserver://TRUONG\\TRUONG_TEST2:1433;databaseName=laptop;encrypt=false";
        String username="sa";
        String password="123456";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url, username, password);
            return conn;
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
            
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        Connection conn = connectDB.getConnect();
        if (conn != null && !conn.isClosed()) {
            System.out.println("\n\n\nDatabase connection is successful.");
        } else {
            System.out.println("\n\n\nFailed to establish a database connection.");
        }
    }
}

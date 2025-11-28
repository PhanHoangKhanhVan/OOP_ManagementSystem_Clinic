package com.vet.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    
    // thông tin Database
    private final String SERVER_NAME = "127.0.0.1";
    private final String DB_NAME = "VetManagement";
    private final String PORT_NUMBER = "3306";
    private final String USER_ID = "root";      
    private final String PASSWORD = "1234";     
    
    // hàm lấy kết nối
    public Connection getConnection() {
        try {
            String url = "jdbc:mysql://" + SERVER_NAME + ":" + PORT_NUMBER + "/" + DB_NAME;
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, USER_ID, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error connection: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

/* Test kết nối được chưa
    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection conn = db.getConnection();
        
        if (conn != null) {
            System.out.println("Successed");
        } else {
            System.out.println("Failed");
        }
    }
*/
}
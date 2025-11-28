package com.vet.dao;

import com.vet.config.DBContext;
import com.vet.model.*; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //Login
    public Person login(String username, String password) {
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                int id = rs.getInt("user_id");
                String fullName = rs.getString("full_name");
                
                //Poly
                if (role.equalsIgnoreCase("CLIENT")) {
                    return new Customer( //tạo client
                        id, 
                        fullName, 
                        rs.getString("phone"), 
                        rs.getString("email"), 
                        username, 
                        password, 
                        rs.getString("address")
                    );
                } 
                else if (role.equalsIgnoreCase("DOCTOR")) {
                    return new Doctor( //tạo doctor
                        id, 
                        fullName, 
                        rs.getString("phone"), 
                        rs.getString("email"), 
                        username, 
                        password, 
                        rs.getDouble("salary"), 
                        null, // kh dùng hiredate
                        rs.getString("specialization")
                    );
                } 
                /*else if (role.equalsIgnoreCase("STAFF")) {
                    return new Staff(
                        id, 
                        fullName, 
                        rs.getString("phone"), 
                        rs.getString("email"), 
                        username, 
                        password, 
                        rs.getDouble("salary"), 
                        null, // hireDate
                        rs.getString("job_title")
                    );
                } */
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }
    
    //Ktra tài khoản
    public boolean checkUsername(String username) {
        String query = "SELECT username FROM Users WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return true; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; 
    }

    // register
    public void signup(String user, String pass, String fullName, String phone, String email, String address) {
        String query = "INSERT INTO Users (username, password, full_name, phone, email, address, role) "
                     + "VALUES (?, ?, ?, ?, ?, ?, 'CLIENT')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Update profile
    public void updateUser(int userId, String fullName, String gender, String address) {
        String query = "UPDATE Users SET full_name = ?, gender = ?, address = ? WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, gender);
            ps.setString(3, address);
            ps.setInt(4, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* test
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        
        System.out.println("----- TEST LOGIN -----");
        Person p = dao.login("doctor1", "123");
        Person p2 = dao.login("doctor2", "123");
        Person p3 = dao.login("doctor3", "123");
        
        if(p != null) {
            System.out.println("Login OK! Welcome: " + p.getFullName());
            
            // Kiểm tra kiểu thực tế (Runtime Type)
            if (p instanceof Doctor) {
                Doctor d = (Doctor) p; // Down-casting
                System.out.println("Role: Doctor - : " + d.getSpecialization());
            } else if (p instanceof Customer) {
                System.out.println("Role: Customer");
            }
        } else {
            System.out.println("Login Failed!");
        }
    }
*/
}
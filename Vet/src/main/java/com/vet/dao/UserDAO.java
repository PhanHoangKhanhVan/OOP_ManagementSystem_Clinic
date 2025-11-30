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

    public Person login(String username, String password) {
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                String roleStr = rs.getString("role"); // Lấy chuỗi role từ DB
                int id = rs.getInt("user_id");
                String fullName = rs.getString("full_name");

                String gender = rs.getString("gender");

                if (roleStr.equalsIgnoreCase(Role.CLIENT.name())) {
                    // Tạo đối tượng
                    Customer c = new Customer(
                        id, 
                        fullName, 
                        rs.getString("phone"), 
                        rs.getString("email"), 
                        username, 
                        password, 
                        rs.getString("address")
                    );
         
                    c.setGender(gender);
                    return c;
                } 
               
                else if (roleStr.equalsIgnoreCase(Role.DOCTOR.name())) {
                    Doctor d = new Doctor(
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
                    d.setGender(gender);
                    return d;
                } 
                /*
                else if (roleStr.equalsIgnoreCase(Role.STAFF.name())) {
                    Staff s = new Staff(
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
                    s.setGender(gender);
                    return s;
                }*/
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }

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

    public void signup(String user, String pass, String fullName, String phone, String email, String address) {
        // Lưu role là CLIENT
        String query = "INSERT INTO Users (username, password, full_name, phone, email, address, role) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?)"; 
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, Role.CLIENT.name()); // Lưu "CLIENT" vào DB
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

   /*
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        
        System.out.println("----- TEST LOGIN -----");
        // Thử đăng nhập với tài khoản Bác sĩ (đã tạo trong DB)
        Person p = dao.login("doctor1", "123");
        
        if (p != null) {
            System.out.println("Login Thành công!");
            System.out.println("Xin chào: " + p.getFullName());
            System.out.println("Giới tính: " + p.getGender()); // Test xem lấy được gender chưa
            System.out.println("Quyền hạn (Enum): " + p.getRole()); 
            
            // [POLYMORPHISM] Kiểm tra đối tượng con
            if (p instanceof Doctor) {
                Doctor d = (Doctor) p; 
                System.out.println("=> Object Doctor. Chuyên khoa: " + d.getSpecialization());
            } 
            else if (p instanceof Customer) {
                Customer c = (Customer) p; 
                System.out.println("=> Object Customer. Địa chỉ: " + c.getAddress());
            }
        } else {
            System.out.println("Login Thất bại! Sai tài khoản hoặc mật khẩu.");
        }
    }*/
}
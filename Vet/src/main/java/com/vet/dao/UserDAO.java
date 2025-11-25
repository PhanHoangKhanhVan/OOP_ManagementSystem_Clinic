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

    // Hàm login trả về Person (Tính đa hình - Polymorphism)
    public Person login(String username, String password) {
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        
        try {
            conn = new DBContext().getConnection(); // Mở kết nối
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                
                // 1. Lấy dữ liệu chung của Person
                int id = rs.getInt("user_id");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                
                // 2. Dựa vào Role để tạo đúng Object con (OOP)
                if (role.equalsIgnoreCase("CLIENT")) {
                    Customer c = new Customer();
                    c.setId(id); 
                    c.setFullName(fullName);
                    c.setUsername(username);
                    c.setAddress(rs.getString("address")); // Thuộc tính riêng của Client
                    c.setRole("CLIENT");
                    return c;
                } 
                else if (role.equalsIgnoreCase("DOCTOR")) {
                    Doctor d = new Doctor();
                    d.setId(id);
                    d.setFullName(fullName);
                    d.setUsername(username);
                    d.setSalary(rs.getDouble("salary"));         // Thuộc tính của Employee
                    d.setSpecialization(rs.getString("specialization")); // Thuộc tính riêng Doctor
                    d.setRole("DOCTOR");
                    return d;
                } 
                else if (role.equalsIgnoreCase("STAFF")) {
                    Staff s = new Staff();
                    s.setId(id);
                    s.setFullName(fullName);
                    s.setUsername(username);
                    s.setSalary(rs.getDouble("salary"));
                    s.setJobTitle(rs.getString("job_title")); // Thuộc tính riêng Staff
                    s.setRole("STAFF");
                    return s;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy user hoặc sai pass
    }
    
    // Hàm main để test thử ngay tại đây (Không cần giao diện)
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        
        // Test thử với tài khoản mẫu trong DB
        Person p = dao.login("doctor1", "123");
        
        if(p != null) {
            System.out.println("Đăng nhập thành công!");
            System.out.println("Xin chào: " + p.getFullName());
            
            // Kiểm tra xem p đang là class nào
            if(p instanceof Doctor) {
                System.out.println("Role: Bác sĩ");
            }
        } else {
            System.out.println("Đăng nhập thất bại!");
        }
    }
}
package com.vet.dao;

import com.vet.config.DBContext;
import com.vet.model.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {
    
    // Hàm lấy danh sách tất cả lịch hẹn
    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        // Query: Lấy thông tin lịch hẹn + Tên khách hàng (Join bảng)
        String query = "SELECT a.app_id, a.user_id, a.service_name, a.booking_date, a.status, u.full_name " +
                       "FROM Appointments a " +
                       "JOIN Users u ON a.user_id = u.user_id";
        
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setId(rs.getInt("app_id"));
                app.setUserId(rs.getInt("user_id"));
                app.setServiceName(rs.getString("service_name"));
                app.setBookingDate(rs.getDate("booking_date"));
                app.setStatus(rs.getString("status"));
                
                // Lấy tên khách hàng từ bảng Users gán vào Appointment
                app.setCustomerName(rs.getString("full_name"));
                
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    // Hàm cho Khách hàng đặt lịch mới
    public boolean insertAppointment(int userId, String serviceName, java.sql.Date date) {
        String query = "INSERT INTO Appointments (user_id, service_name, booking_date, status) VALUES (?, ?, ?, 'Pending')";
        
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            
            ps.setInt(1, userId);
            ps.setString(2, serviceName);
            ps.setDate(3, date);
            
            int result = ps.executeUpdate();
            return result > 0; // Trả về true nếu insert thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    // Hàm lấy lịch sử khám bệnh của 1 khách hàng cụ thể
    public List<Appointment> getHistory(int userId) {
        List<Appointment> list = new ArrayList<>();
        
        // Join 3 bảng: Prescriptions (lấy thuốc) - Appointments (lấy ngày) - Users (lấy tên)
        String query = "SELECT a.booking_date, a.service_name, p.diagnosis, p.medicine " +
                       "FROM Appointments a " +
                       "JOIN Prescriptions p ON a.app_id = p.app_id " +
                       "WHERE a.user_id = ?"; // Lọc theo ID khách hàng
        
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setBookingDate(rs.getDate("booking_date"));
                app.setServiceName(rs.getString("service_name"));
                
                // Lưu tạm chẩn đoán/thuốc vào biến status/customerName (hoặc tạo class DTO mới nếu muốn chuẩn)
                // Ở đây mình tận dụng lại class Appointment để đỡ phải tạo class mới
                app.setStatus(rs.getString("diagnosis")); // Mượn tạm field status để lưu chẩn đoán
                app.setCustomerName(rs.getString("medicine")); // Mượn tạm field customerName để lưu thuốc
                
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
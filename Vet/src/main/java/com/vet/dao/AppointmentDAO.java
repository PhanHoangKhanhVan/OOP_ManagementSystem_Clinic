package com.vet.dao;

import com.vet.config.DBContext;
import com.vet.model.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Lấy hết danh sách appointment
    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        // Lịch hẹn + client in4 -> join table
        String query = "SELECT a.app_id, a.user_id, a.service_name, a.booking_date, a.booking_time, a.pet_name, a.note, a.status, u.full_name " +
                       "FROM Appointments a " +
                       "JOIN Users u ON a.user_id = u.user_id";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setId(rs.getInt("app_id"));
                app.setUserId(rs.getInt("user_id"));
                app.setServiceName(rs.getString("service_name"));
                app.setBookingDate(rs.getString("booking_date")); 
                app.setBookingTime(rs.getString("booking_time")); 
                app.setPetName(rs.getString("pet_name"));         
                app.setNote(rs.getString("note"));               
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

    // đặt lịch mới
    public boolean insertAppointment(int userId, String serviceName, String date, String time, String petName, String note) {
        String query = "INSERT INTO Appointments (user_id, service_name, booking_date, booking_time, pet_name, note, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, userId);
            ps.setString(2, serviceName);
            ps.setString(3, date); 
            ps.setString(4, time); 
            ps.setString(5, petName);
            ps.setString(6, note);
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // client xem lại lịch sử khám bệnh
    public List<Appointment> getHistory(int userId) {
        List<Appointment> list = new ArrayList<>();
        
        // LEFT JOIN để nếu chưa có đơn thuốc (chưa khám xong) vẫn hiện lịch sử đã đặt
        String query = "SELECT a.booking_date, a.booking_time, a.service_name, p.diagnosis, p.medicine, a.status " +
                       "FROM Appointments a " +
                       "LEFT JOIN Prescriptions p ON a.app_id = p.app_id " +
                       "WHERE a.user_id = ?"; 
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment app = new Appointment();
                app.setBookingDate(rs.getString("booking_date"));
                app.setBookingTime(rs.getString("booking_time")); 
                app.setServiceName(rs.getString("service_name"));
                app.setStatus(rs.getString("status")); // Pending/Completed
                
                String diag = rs.getString("diagnosis");
                String med = rs.getString("medicine");
                
                if (diag != null) {
                    app.setNote(diag); // Lưu chẩn đoán vào Note
                    app.setPetName(med); // Lưu thuốc vào PetName (
                } else {
                    app.setNote("nothing");
                    app.setPetName("nothing");
                }
                
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
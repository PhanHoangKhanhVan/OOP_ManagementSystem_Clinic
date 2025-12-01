package com.vet.dao;

import com.vet.config.DBContext;
import com.vet.model.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO implements GenericDAO<Appointment> {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean insertAppointment(int userId, String serviceName, String date, String time, String petName, String note) {
        String query = "INSERT INTO Appointments (user_id, service_name, booking_date, booking_time, pet_name, note, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
        
        System.out.println(">> User ID: " + userId);
        System.out.println(">> Service: " + serviceName);
        System.out.println(">> Date: " + date + " | Time: " + time);
        System.out.println(">> Pet: " + petName + " | Note: " + note);
        
        try {
            conn = new DBContext().getConnection();
            if (conn == null) {
                System.out.println("Failed");
                return false;
            }

            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, serviceName);
            ps.setString(3, date); 
            ps.setString(4, time); 
            ps.setString(5, petName);
            ps.setString(6, note);
            
            int result = ps.executeUpdate();
            System.out.println(result);
            
            conn.close(); // Đóng kết nối
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("EXCEPTION:");
            e.printStackTrace(); // In lỗi đỏ lòm ra
        }
        return false;
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        String query = "SELECT a.app_id, a.user_id, a.service_name, a.booking_date, a.booking_time, a.pet_name, a.note, a.status, u.full_name " +
                       "FROM Appointments a JOIN Users u ON a.user_id = u.user_id";
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
                app.setCustomerName(rs.getString("full_name"));
                list.add(app);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<Appointment> getHistory(int userId) {
        List<Appointment> list = new ArrayList<>();
        String query = "SELECT a.booking_date, a.booking_time, a.service_name, p.diagnosis, p.medicine, a.status " +
                       "FROM Appointments a LEFT JOIN Prescriptions p ON a.app_id = p.app_id WHERE a.user_id = ?"; 
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
                app.setStatus(rs.getString("status")); 
                String diag = rs.getString("diagnosis");
                String med = rs.getString("medicine");
                if (diag != null) { app.setNote(diag); app.setPetName(med); } 
                else { app.setNote("Chưa có chẩn đoán"); app.setPetName("Chưa có đơn thuốc"); }
                list.add(app);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // IMPLEMENTS INTERFACE ---
    @Override public List<Appointment> findAll() { return getAllAppointments(); }
    @Override public boolean insert(Appointment model) { 
        return insertAppointment(model.getUserId(), model.getServiceName(), model.getBookingDate(), model.getBookingTime(), model.getPetName(), model.getNote()); 
    }
    @Override public boolean update(Appointment model) { return false; }
    @Override public boolean delete(int id) { return false; }
    @Override public Appointment findById(int id) { return null; }
}
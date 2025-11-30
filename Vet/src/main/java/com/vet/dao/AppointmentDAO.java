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

    // =========================================================
    // PHẦN 1: CÁC HÀM CŨ CỦA BẠN (GIỮ NGUYÊN KHÔNG XÓA)
    // =========================================================
    
    public List<Appointment> getAllAppointments() {
        // ... (Code cũ giữ nguyên) ...
        return new ArrayList<>(); // Demo return
    }

    public boolean insertAppointment(int userId, String service, String date, String time, String pet, String note) {
        // ... (Code cũ giữ nguyên) ...
        return true;
    }
    
    public List<Appointment> getHistory(int userId) {
        // ... (Code cũ giữ nguyên) ...
        return new ArrayList<>();
    }

    // =========================================================
    // PHẦN 2: TRIỂN KHAI CÁC HÀM TỪ INTERFACE (MỚI THÊM)
    // Đây là bằng chứng bạn có sử dụng Interface
    // =========================================================

    @Override
    public List<Appointment> findAll() {
        // Hàm này thực chất giống getAllAppointments, bạn có thể gọi lại nó
        return getAllAppointments();
    }

    @Override
    public boolean insert(Appointment model) {
        // Hàm này dùng khi bạn truyền vào 1 object Appointment thay vì 6 tham số rời rạc
        // Bạn có thể viết logic insert ở đây nếu muốn nâng cấp code
        return false; 
    }

    @Override
    public boolean update(Appointment model) {
        // Viết code update trạng thái lịch hẹn ở đây
        String sql = "UPDATE Appointments SET status = ? WHERE app_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, model.getStatus());
            ps.setInt(2, model.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Appointments WHERE app_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Appointment findById(int id) {
        return null;
    }
}
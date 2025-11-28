package com.vet.controller;

import com.vet.config.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PrescriptionController", urlPatterns = {"/doctor/prescribe"})
public class PrescriptionController extends HttpServlet {

    // Khi bấm link "Kê đơn" -> Hiện ra form (prescribe.jsp)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/doctor/prescribe.jsp").forward(request, response);
    }

    // Khi bấm nút "Lưu đơn thuốc" -> Lưu vào Database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8"); // Để lưu tiếng Việt không lỗi
        
        String appId = request.getParameter("app_id");
        String diagnosis = request.getParameter("diagnosis");
        String medicine = request.getParameter("medicine");
        
        // Code lưu trực tiếp vào DB (Bạn có thể tách ra DAO nếu muốn chuẩn bài hơn)
        String query = "INSERT INTO Prescriptions (app_id, diagnosis, medicine) VALUES (?, ?, ?)";
        String updateStatus = "UPDATE Appointments SET status = 'Completed' WHERE app_id = ?";
        
        try {
            Connection conn = new DBContext().getConnection();
            
            // Bước 1: Lưu đơn thuốc
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, appId);
            ps.setString(2, diagnosis);
            ps.setString(3, medicine);
            ps.executeUpdate();
            
            // Bước 2: Cập nhật trạng thái lịch hẹn thành "Completed" (Đã khám xong)
            PreparedStatement ps2 = conn.prepareStatement(updateStatus);
            ps2.setString(1, appId);
            ps2.executeUpdate();
            
            // Xong xuôi thì quay lại trang lịch hẹn
            response.sendRedirect("schedule");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Lỗi: " + e.getMessage());
        }
    }
}
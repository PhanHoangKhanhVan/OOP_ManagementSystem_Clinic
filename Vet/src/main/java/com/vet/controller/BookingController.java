package com.vet.controller;

import com.vet.dao.AppointmentDAO;
import com.vet.model.Person;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookingController", urlPatterns = {"/client/booking"})
public class BookingController extends HttpServlet {

    // 1. Mở form đặt lịch
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến file giao diện form
        request.getRequestDispatcher("/views/client/booking.jsp").forward(request, response);
    }

    // 2. Xử lý khi bấm nút "Đặt lịch ngay"
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // A. Lấy thông tin người đang đăng nhập (để biết ai đặt)
        HttpSession session = request.getSession();
        Person acc = (Person) session.getAttribute("acc");
        
        if (acc == null) {
            response.sendRedirect("../login"); // Chưa đăng nhập thì đuổi về login
            return;
        }

        // B. Lấy dữ liệu từ form
        String service = request.getParameter("service");
        String dateStr = request.getParameter("date");
        
        // C. Gọi DAO lưu vào Database
        AppointmentDAO dao = new AppointmentDAO();
        try {
            Date sqlDate = Date.valueOf(dateStr); // Chuyển chuỗi ngày sang SQL Date
            
            boolean check = dao.insertAppointment(acc.getId(), service, sqlDate);
            
            if (check) {
                // Đặt thành công -> Chuyển về trang chủ hoặc trang thông báo
                request.setAttribute("mess", "Đặt lịch thành công! Vui lòng chờ xác nhận.");
                request.getRequestDispatcher("/views/client/booking.jsp").forward(request, response);
            } else {
                response.getWriter().print("Lỗi: Không thể lưu vào Database.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
package com.vet.controller;

import com.vet.dao.AppointmentDAO;
import com.vet.model.Person;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookingController", urlPatterns = {"/client/booking"})
public class BookingController extends HttpServlet {

    // mở Booking
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/client/booking.jsp").forward(request, response);
    }

    // xử lý khi bấm nút confirm
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // lấy thông tin client
        HttpSession session = request.getSession();
        Person acc = (Person) session.getAttribute("acc");
        
        // yêu cầu login
        if (acc == null) {
            response.sendRedirect("../login"); 
            return;
        }

        // Lấy thông tin từ booking-form
        String service = request.getParameter("service");
        String date = request.getParameter("date");   
        String time = request.getParameter("time");   
        String petName = request.getParameter("petName");
        String note = request.getParameter("note");
        
        // gọi DAO lưu vào Database
        AppointmentDAO dao = new AppointmentDAO();
        try {
            boolean check = dao.insertAppointment(acc.getId(), service, date, time, petName, note);
            
            if (check) {
                // Dùng sendRedirect để tránh bị gửi lại form khi F5 (PRG Pattern)
                response.sendRedirect("history");
            } else {
                response.getWriter().print("Lỗi: Cannot store in Database.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
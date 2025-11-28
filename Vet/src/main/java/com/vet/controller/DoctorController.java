package com.vet.controller;

import com.vet.dao.AppointmentDAO;
import com.vet.model.Appointment;
import com.vet.model.Person;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DoctorController", urlPatterns = {"/doctor/schedule"})
public class DoctorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Ktra role Doctor
        HttpSession session = request.getSession();
        Person acc = (Person) session.getAttribute("acc");
        
        if (acc == null || !acc.getRole().equalsIgnoreCase("DOCTOR")) {
            // Nếu không phải bác sĩ -> về trang login
            response.sendRedirect("../login"); 
            return;
        }

        // gọi DAO lấy dữ liệu
        AppointmentDAO dao = new AppointmentDAO();
        List<Appointment> list = dao.getAllAppointments();

        // gửi dữ liệu sang JSP
        request.setAttribute("listA", list); 
        
        // chuyển trang
        request.getRequestDispatcher("/views/doctor/schedule.jsp").forward(request, response);
    }
}
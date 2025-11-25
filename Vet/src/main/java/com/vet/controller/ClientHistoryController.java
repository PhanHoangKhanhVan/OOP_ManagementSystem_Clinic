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

@WebServlet(name = "ClientHistoryController", urlPatterns = {"/client/history"})
public class ClientHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Person acc = (Person) session.getAttribute("acc");
        
        // Nếu chưa đăng nhập thì đuổi về
        if (acc == null) {
            response.sendRedirect("../login");
            return;
        }

        // Gọi DAO lấy lịch sử của CHÍNH NGƯỜI ĐÓ (acc.getId())
        AppointmentDAO dao = new AppointmentDAO();
        List<Appointment> historyList = dao.getHistory(acc.getId());
        
        request.setAttribute("history", historyList);
        request.getRequestDispatcher("/views/client/history.jsp").forward(request, response);
    }
}
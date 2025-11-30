package com.vet.controller;

import com.vet.dao.UserDAO;
import com.vet.model.Person;
import com.vet.model.Role; //Enum Role
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    // Xử lý login dữ liệu
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // lấy dữ liệu từ form
        String u = request.getParameter("user"); 
        String p = request.getParameter("pass"); 

        // gọi DAO kiểm tra
        UserDAO dao = new UserDAO();
        Person account = dao.login(u, p);

        // xử lý kết quả
        if (account != null) {
            // thành công -> lưu vào Session
            HttpSession session = request.getSession();
            session.setAttribute("acc", account); 
            
            // [CẬP NHẬT] Lấy Role dưới dạng Enum (không phải String nữa)
            Role role = account.getRole();
            
            // So sánh trực tiếp bằng Enum
            if (role == Role.DOCTOR) {
                response.sendRedirect("doctor/schedule"); 
            } 
            else if (role == Role.CLIENT) {
                response.sendRedirect("index.jsp");
            } 
            else {
                // Trường hợp Staff hoặc role khác
                response.sendRedirect("index.jsp");
            }
            
        } else {
            // đăng nhập thất bại
            request.setAttribute("mess", "Wrong username or password!");
            // [SỬA LỖI] Phải trỏ đúng vào thư mục views/auth/login.jsp
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }

    // Xử lý khi người dùng truy cập trực tiếp vào login 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng sang trang giao diện login.jsp
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}
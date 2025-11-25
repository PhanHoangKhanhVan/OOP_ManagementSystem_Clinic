package com.vet.controller;

import com.vet.dao.UserDAO;
import com.vet.model.Person;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Đường dẫn để gọi Servlet này là /login
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    // Xử lý khi người dùng bấm nút "Login" (Gửi dữ liệu lên)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Lấy dữ liệu từ form
        String u = request.getParameter("user"); // Tên input bên HTML phải là "user"
        String p = request.getParameter("pass"); // Tên input bên HTML phải là "pass"

        // 2. Gọi DAO kiểm tra
        UserDAO dao = new UserDAO();
        Person account = dao.login(u, p);

        // 3. Xử lý kết quả
        if (account != null) {
            // A. Đăng nhập thành công -> Lưu vào Session
            HttpSession session = request.getSession();
            session.setAttribute("acc", account); 
            
            // B. Phân quyền (Authorization) - OOP Logic
            String role = account.getRole();
            
            if ("DOCTOR".equalsIgnoreCase(role)) {
                // Nếu là Bác sĩ -> Chuyển đến trang Dashboard bác sĩ
                // Tạm thời chuyển về trang chủ, sau này tạo trang doctor sau
                response.sendRedirect("doctor/schedule"); 
            } else if ("CLIENT".equalsIgnoreCase(role)) {
                // Nếu là Khách -> Chuyển về trang chủ
                response.sendRedirect("index.jsp");
            } else {
                // Staff
                response.sendRedirect("index.jsp");
            }
            
        } else {
            // C. Đăng nhập thất bại
            request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu!");
            // Quay lại trang login và hiện lỗi
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Xử lý khi người dùng truy cập trực tiếp vào link /login (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng sang trang giao diện login.jsp
        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
    }
}